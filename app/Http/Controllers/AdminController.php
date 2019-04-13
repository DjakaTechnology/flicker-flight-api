<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Airport;

class AdminController extends Controller{
    public function airport(){
        return view('airport')->with('airport', Airport::all());
    }
}
