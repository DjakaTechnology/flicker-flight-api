<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Airline;

class AirlineController extends Controller{
    public function __construct(){
        
    }

    public function airline(){
        return view('airline')->with('airline', Airline::all());
    }

    public function airlineDetail(Request $request){
        return view('airline_detail')->with('airline', Airline::find($request->id));
    }

    public function airlineUpdate(Request $q){
        $airline = Airline::find($q->id);
        
        $airline->name = $q->name;
        $airline->logo = $q->logo;
        $airline->description = $q->description;
    
        $airline->save();

        return view('airline_detail')->with('airline', $airline);
    }

    public function airlineDelete(Request $q){
        $airline = Airline::find($q->id);
        $airline->delete;

        redirect('/airline');
    }
}
