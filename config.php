<?php

include('_start.php');

$databasemanagar->addConnection([
    'driver'    => 'mysql',
    'host'      => getenv('DB_HOST') ?: 'localhost',
    'database'  => getenv('DB_NAME'),
    'username'  => getenv('DB_USER'),
    'password'  => getenv('DB_PASSWORD'),
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => '',
]);

$debug = false;

include('_load.php');
