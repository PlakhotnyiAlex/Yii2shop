<?php

namespace shop\forms\auth;

use yii\base\InvalidArgumentException;
use yii\base\Model;
use Yii;
use shop\entities\User\User;

/**
 * Password reset form
 */
class ResetPasswordForm extends Model
{
    public $password;

    /**
     * @var \shop\entities\User\User
     */

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            ['password', 'required'],
            ['password', 'string', 'min' => Yii::$app->params['user.passwordMinLength']],
        ];
    }
}
