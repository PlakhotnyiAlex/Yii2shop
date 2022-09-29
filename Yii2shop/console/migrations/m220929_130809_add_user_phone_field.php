<?php

use yii\db\Migration;

/**
 * Class m220929_130809_add_user_phone_field
 */
class m220929_130809_add_user_phone_field extends Migration
{
    public function up()
    {
        $this->addColumn('{{%user}}', 'phone', $this->string()->notNull());

        $this->createIndex('{{%idx-user-phone}}', '{{%user}}', 'phone', true);
    }

    public function down()
    {
        $this->dropColumn('{{%user}}', 'phone');
    }
}
