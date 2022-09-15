<?php

use yii\db\Migration;

/**
 * Class m220821_094431_add_shop_product_fields
 */
class m220821_094431_add_shop_product_fields extends Migration
{
    public function up()
    {
        $this->addColumn('{{%shop_products}}', 'weight', $this->integer()->notNull());
        $this->addColumn('{{%shop_products}}', 'quantity', $this->integer()->notNull());

        $this->addColumn('{{%shop_modifications}}', 'quantity', $this->integer()->notNull());
    }

    public function down()
    {
        $this->dropColumn('{{%shop_modifications}}', 'quantity');

        $this->dropColumn('{{%shop_products}}', 'quantity');
        $this->dropColumn('{{%shop_products}}', 'weight');
    }
}
