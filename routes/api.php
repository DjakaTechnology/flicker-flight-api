<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::get('airport', 'API\AirportController@index');
Route::get('airport/search', 'API\AirportController@search');

Route::get('route/{from}/{to}/{depart}', 'API\RouteController@routeFromTo');

Route::post('reservation', 'API\ReservationController@insert');
Route::post('reservation/mine', 'API\ReservationController@mine');

Route::get('customer/{id}/reservation', 'API\ReservationController@customer');
Route::post('customer/update', 'API\CustomerController@update');

Route::post('reservation/upload', 'API\ReservationController@upload');

Route::post('login', 'API\UserController@login');
Route::post('register', 'API\UserController@register');
Route::group(['middleware' => 'auth:api'], function(){
Route::post('details', 'API\UserController@details');
});
Route::get('seat/{id}/taken', 'API\ReservationController@seatTaken');