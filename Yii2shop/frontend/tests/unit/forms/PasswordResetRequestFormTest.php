<?php

namespace frontend\tests\unit\forms;

use Yii;
use shop\forms\auth\PasswordResetRequestForm;
use common\fixtures\UserFixture as UserFixture;
use shop\entities\User\User;
use function codecept_data_dir;
use function expect;
use function expect_not;
use function expect_that;

class PasswordResetRequestFormTest extends \Codeception\Test\Unit
{
    /**
     * @var \frontend\tests\UnitTester
     */
    protected $tester;


    public function _before()
    {
        $this->tester->haveFixtures([
            'user' => [
                'class' => UserFixture::className(),
                'dataFile' => codecept_data_dir() . 'user.php'
            ]
        ]);
    }

    public function testSendMessageWithWrongEmailAddress()
    {
        $model = new \shop\forms\auth\PasswordResetRequestForm();
        $model->email = 'not-existing-email@example.com';
        expect_not($model->sendEmail());
    }

    public function testNotSendEmailsToInactiveUser()
    {
        $user = $this->tester->grabFixture('user', 1);
        $model = new \shop\forms\auth\PasswordResetRequestForm();
        $model->email = $user['email'];
        expect_not($model->sendEmail());
    }

    public function testSendEmailSuccessfully()
    {
        $userFixture = $this->tester->grabFixture('user', 0);
        
        $model = new \shop\forms\auth\PasswordResetRequestForm();
        $model->email = $userFixture['email'];
        $user = User::findOne(['password_reset_token' => $userFixture['password_reset_token']]);

        expect_that($model->sendEmail());
        expect_that($user->password_reset_token);

        $emailMessage = $this->tester->grabLastSentEmail();
        expect('valid email is sent', $emailMessage)->isInstanceOf('yii\mail\MessageInterface');
        expect($emailMessage->getTo())->hasKey($model->email);
        expect($emailMessage->getFrom())->hasKey(Yii::$app->params['supportEmail']);
    }
}
