<?php

namespace shop\services\auth;

use shop\entities\User\User;
use shop\forms\auth\SignupForm;
use yii\mail\MailerInterface;
use shop\repositories\UserRepository;
class SignupService
{
    private $mailer;
    private $users;
    public function __construct(MailerInterface $mailer, UserRepository $users)
    {
        $this->mailer = $mailer;
        $this->users = $users;
    }

    public function signup(SignupForm $form): void
    {
        $user = User::requestSignup(
            $form->username,
            $form->email,
            $form->password
        );
       $this->users->save($user);

        $sent = $this
            ->mailer
            ->compose(
                ['html' => 'emailConfirmToken-html', 'text' => 'emailResetConfirmToken-text'],
                ['user' => $user]
            )
            ->setTo($user->email)
            ->setSubject('Signup confirm for ' . \Yii::$app->name)
            ->send();
        if (!$sent) {
            throw new \RuntimeException('Email sending error.');
        }
    }
    public function confirm($token): void
    {
        if (empty($token)) {
            throw new \DomainException('Empty confirm token.');
        }
        $user = $this->users->getByEmailConfirmToken($token);
        $user->confirmSignup();
        $this->users->save($user);
    }

}