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
