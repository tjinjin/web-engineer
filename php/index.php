<?php

use Symfony\Component\HttpFoundation\Request;

require_once __DIR__. '/vendor/autoload.php';

$app = new Silex\Application();

$app->get('/ip', function (Request $request) use ($app) {
    return $app->json([
        'origin' => $request->getClientIp(),
    ]);
});

$app->get('/user-agent', function (Request $request) use ($app) {
    return $app->json([
        'user-agent' => $request->headers->get('User-Agent'),
    ]);
});

$app->get('/get', function (Request $request) use ($app) {

    //ヘッダーのキーを「-」区切りで大文字に。user-agent -> User-Agent
    $headers = [];
    foreach ($request->headers->all() as $key => $value) {
        $key = preg_replace_callback('/\w+/', function($matches){
            return ucfirst($matches[0]);
        }, $key);
        $headers[$key] = $value[0];
    }

    return $app->json([
        'args' => $request->query->all(),
        'headers' => $headers,
        'origin' => $request->getClientIp(),
        'user-agent' => $request->headers->get('User-Agent'),
    ]);
});

$app->get('/hello/{name}', function ($name) use ($app) {
    return 'Hello ' . $app->escape($name) . PHP_EOL;
});

$app->run();
