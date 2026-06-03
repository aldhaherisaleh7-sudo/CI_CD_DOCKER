<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/saleh', function () {
    return "welcome this is me saleh";
});
