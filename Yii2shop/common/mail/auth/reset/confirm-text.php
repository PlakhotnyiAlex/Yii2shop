<?php

/** @var yii\web\View $this */
/** @var \shop\entities\User\User $user */

$resetLink = Yii::$app->get('frontendUrlManager')->createAbsoluteUrl(['auth/reset/confirm', 'token' => $user->password_reset_token]);?>
Hello <?= $user->username ?>,

Follow the link below to reset your password:

<?= $resetLink ?>