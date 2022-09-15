<?php

use yii\db\Migration;

/**
 * Class m220810_145604_add_user_email_confirmation_token
 */
class m220810_145604_add_user_email_confirmation_token extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('{{%user}}', 'email_confirm_token', $this->string()->unique()->after('email'));
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropColumn('{{%user}}', 'email_confirm_token');
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m220810_145604_add_user_email_confirmation_token cannot be reverted.\n";

        return false;
    }
    */
}
