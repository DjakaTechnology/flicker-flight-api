<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Airport;
use Illuminate\Support\Facades\Redirect;

class AirportController extends Controller{
    public function __construct(){
        
    }

    public function airport(){
        return view('airport')->with('airport', Airport::all());
    }

    public function airportDetail(Request $request){
        $airport = $request->id == "new" ? new Airport() : Airport::find($request->id);
        if($request->id == "new") $airport->id = -1;

        return view('airport_edit')->with('airport', $airport);
    }

    public function airportUpdate(Request $q){
        $airport = $q->id == -1 ? new Airport() : Airport::find($q->id);
        $airport->name = $q->name;
        $airport->code = $q->code;
        $airport->address = $q->address;
        $airport->city = $q->city;
        $airport->save();

        return view('airport_edit')->with('airport', $airport);
    }

    public function airportDelete(Request $q){
        $airport = Airport::find($q->id);
        $airport->delete();

        return redirect('admin/airport');
    }
}
