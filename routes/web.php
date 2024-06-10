<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});
Route::get('/test', function() {
    return "ABCD1234";
});

Route::get('/test123', function() {
    return "ABCD1234";
});
