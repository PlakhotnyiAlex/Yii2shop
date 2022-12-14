<?php

namespace frontend\tests\unit\forms;

use common\fixtures\UserFixture;
use shop\forms\auth\ResetPasswordForm;
use function codecept_data_dir;
use function expect_that;

class ResetPasswordFormTest extends \Codeception\Test\Unit
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
            ],
        ]);
    }

    public function testResetWrongToken()
    {
        $this->tester->expectException('\yii\base\InvalidArgumentException', function() {
            new \shop\forms\auth\ResetPasswordForm('');
        });

        $this->tester->expectException('\yii\base\InvalidArgumentException', function() {
            new \shop\forms\auth\ResetPasswordForm('notexistingtoken_1391882543');
        });
    }

    public function testResetCorrectToken()
    {
        $user = $this->tester->grabFixture('user', 0);
        $form = new \shop\forms\auth\ResetPasswordForm($user['password_reset_token']);
        expect_that($form->resetPassword());
    }

}
