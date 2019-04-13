<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'UserController@index');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::post('/login', 'UserController@login');

Route::get('admin/airport', 'AirportController@airport');
Route::get('admin/airport/{id}', 'AirportController@airportDetail');
Route::get('admin/airport/{id}/update', 'AirportController@airportUpdate');
Route::get('admin/airport/{id}/delete', 'AirportController@airportDelete');

Route::get('admin/airline', 'AirlineController@airline');
Route::get('admin/airline/{id}', 'AirlineController@airlineDetail');
Route::get('admin/airline/{id}/update', 'AirlineController@airlineUpdate');
Route::get('admin/airline/{id}/delete', 'AirlineController@airlineDelete');

Route::get('admin/plane', 'PlaneController@plane');
Route::get('admin/plane/{id}', 'PlaneController@planeDetail');
Route::get('admin/plane/{id}/save', 'PlaneController@planeSave');
Route::get('admin/plane/{id}/delete', 'PlaneController@planeDelete');

Route::get('admin/route', 'RouteController@route');
Route::get('admin/route/{id}', 'RouteController@routeDetail');
Route::get('admin/route/{id}/save', 'RouteController@routeSave');
Route::get('admin/route/{id}/delete', 'RouteController@routeDelete');

Route::get('admin/reservation', 'ReservationController@reservation');
Route::get('admin/reservation/pending', 'ReservationController@reservationPending');
Route::get('admin/reservation/{id}', 'ReservationController@reservationDetail');
Route::get('admin/reservation/{id}/save', 'ReservationController@reservationSave');
Route::get('admin/reservation/{id}/delete', 'ReservationController@reservationDelete');
Route::get('admin/reservation/{id}/{status}', 'ReservationController@reservationConfirm');

Route::get('admin/customer', 'CustomerController@customer');
Route::get('admin/customer/{id}', 'CustomerController@customerDetail');
Route::get('admin/customer/{id}/save', 'CustomerController@customerSave');
Route::get('admin/customer/{id}/delete', 'CustomerController@customerDelete');
