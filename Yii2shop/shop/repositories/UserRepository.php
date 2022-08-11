<?php

namespace shop\repositories;
use shop\entities\User;
use shop\repositories\NotFoundException;

class UserRepository
{
    public function getByEmailConfirmToken(string $token): User
    {
        if (!$user = User::findOne(['email_confirm_token' => $token])){
            throw new \DomainException('User is not found.');
        }
        return $user;
    }
    public function getByEmail(string $email): User
    {
        if (!$user = User::findOne(['email' => $email])) {
            throw new \DomainException('User is not found.');
        }
        return $user;
    }
    public function existsByPasswordResetToken(string $token): User
    {
        return User::findByPasswordResetToken($token);
    }
    public function getByPasswordResetToken(string $token): User
    {
        if (!$user = User::findByPasswordResetToken($token)) {
            throw new \DomainException('User is not found.');
        }
        return $user;
    }
    public function save(User $user): void
    {
        if (!$user->save()) {
            throw new \RuntimeException('Saving error.');
        }
    }
    private function getBy(array $condition): User
    {
        if (!$user = User::find()->andWhere($condition)->limit(1)->one()) {
            throw new \shop\repositories\NotFoundException('User is not found.');
        }
        return $user;
    }
}