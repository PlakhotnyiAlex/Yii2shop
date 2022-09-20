<?php

namespace console\controllers;

use Elastic\Elasticsearch\Client;
use Elastic\Elasticsearch\Exception\ClientResponseException;
use Elastic\Elasticsearch\Exception\ServerResponseException;
use yii\console\Exception;
use yii\console\Controller;

class ElasticController extends Controller
{
    private $client;

    public function __construct($id, $module, Client $client, $config = [])
    {
        parent::__construct($id, $module, $config);
        $this->client = $client;
    }
    public function actionIndex(): void
    {
       $params = [
            'index' => 'shop',
            'body' => ['products' => 'laptop']
           ];

        try {
            $response = $this->client->index($params);
        } catch (ClientResponseException $e) {
            // manage the 4xx error
        } catch (ServerResponseException $e) {
            // manage the 5xx error
        } catch (Exception $e) {
            // eg. network error like NoNodeAvailableException
        }
    }

}