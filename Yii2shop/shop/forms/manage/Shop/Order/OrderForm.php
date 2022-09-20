<?php

namespace shop\forms\manage\Shop\Order;

use shop\forms\CompositeForm;
use shop\forms\Shop\Order\CustomerForm;
use shop\forms\Shop\Order\DeliveryForm;

/**
 * @property DeliveryForm $delivery
 * @property CustomerForm $customer
 */
class OrderForm extends CompositeForm
{
    public $note;

    public function __construct(int $weight, array $config = [])
    {
        $this->delivery = new DeliveryForm($weight);
        $this->customer = new CustomerForm();
        parent::__construct($config);
    }

    public function rules(): array
    {
        return [
            [['note'], 'string'],
        ];
    }

    protected function internalForms(): array
    {
        return ['delivery', 'customer'];
    }
}