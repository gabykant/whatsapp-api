<?php

use App\Http\Controllers\AutomateWhatsApp;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/whatsapp', [AutomateWhatsApp::class, 'index']);

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
