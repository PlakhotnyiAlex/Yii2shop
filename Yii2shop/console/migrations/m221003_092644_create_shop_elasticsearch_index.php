<?php

use Elastic\Elasticsearch\Exception\ClientResponseException;
use Elastic\Elasticsearch\Client;
use yii\db\Migration;

/**
 * Class m221003_092644_create_shop_elasticsearch_index
 */
class m221003_092644_create_shop_elasticsearch_index extends Migration
{
    public function up()
    {
        $client = $this->getClient();

        try {
            $client->indices()->delete([
                'index' => 'shop'
            ]);
        } catch (ClientResponseException $e) {}

        $client->indices()->create([
            'index' => 'shop',
            'body' => [
                'mappings' => [
                    '_source' => [
                        'enabled' => true,
                    ],
                    'properties' => [
                        'id' => [
                            'type' => 'integer',
                        ],
                        'name' => [
                            'type' => 'text',
                        ],
                        'description' => [
                            'type' => 'text',
                        ],
                        'price' => [
                            'type' => 'integer',
                        ],
                        'rating' => [
                            'type' => 'float',
                        ],
                        'brand' => [
                            'type' => 'integer',
                        ],
                        'categories' => [
                            'type' => 'integer',
                        ],
                        'tags' => [
                            'type' => 'integer',
                        ],
                        'values' => [
                            'type' => 'nested',
                            'properties' => [
                                'characteristic' => [
                                    'type' => 'integer'
                                ],
                                'value_string' => [
                                    'type' => 'keyword',
                                ],
                                'value_int' => [
                                    'type' => 'integer',
                                ],
                            ]
                        ]
                    ]
                ]

            ]
        ]);
    }

    public function down()
    {
        try {
            $this->getClient()->indices()->delete([
                'index' => 'shop'
            ]);
        } catch (ClientResponseException $e) {}
    }

    private function getClient(): Client
    {
        return Yii::$container->get(Client::class);
    }
}
