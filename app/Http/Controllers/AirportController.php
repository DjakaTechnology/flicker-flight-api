<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Airport;

class AirportController extends Controller{
    public function __construct(){
        
    }

    public function airport(){
        return view('airport')->with('airport', Airport::all());
    }

    public function airportDetail(Request $request){
        return view('airport_edit')->with('airport', Airport::find($request->id));
    }

    public function airportUpdate(Request $q){
        $airport = Airport::find($q->id);
        $airport->name = $q->name;
        $airport->code = $q->code;
        $airport->address = $q->address;
        $airport->city = $q->city;
        $airport->save();

        return view('airport_edit')->with('airport', $airport);
    }

    public function airportDelete(Request $q){
        $airport = Airport::find($q->id);
        $airport->delete;

        redirect('/airport');
    }
}
