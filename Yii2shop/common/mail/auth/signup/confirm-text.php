<?php

/** @var yii\web\View $this */
/** @var \shop\entities\User\User $user */

$confirmLink = Yii::$app->urlManager->createAbsoluteUrl(['auth/signup/confirm', 'token' => $user->email_confirm_token]);

?>
Hello <?= $user->username ?>,

Follow the link below to verify your email:

<?= $verifyLink ?>
