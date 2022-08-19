<?php

namespace shop\helpers;

use shop\entities\Shop\Product\Product;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;

class ProductHelper
{
    public static function statusList(): array
    {
        return [
            Product::STATUS_DRAFT => 'Draft',
            Product::STATUS_ACTIVE => 'Active',
        ];
    }

    public static function statusName($status): string
    {
        return ArrayHelper::getValue(self::statusList(), $status);
    }

    public static function statusLabel($status): string
    {
        switch ($status) {
            case Product::STATUS_DRAFT:
                $class = 'badge badge-default';
                break;
            case Product::STATUS_ACTIVE:
                $class = 'badge badge-success';
                break;
            default:
                $class = 'badge badge-default';
        }

        return Html::tag('span', ArrayHelper::getValue(self::statusList(), $status), [
            'class' => $class,
        ]);
    }
}