<?php

namespace shop\helpers;

class PriceHelper
{
    public static function format($price): string
    {
        if (!$price == NULL) {
            return number_format($price, 0, '.', ' ');
        }
        return '0';
    }
} 