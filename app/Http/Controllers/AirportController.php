<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Airport;
use Illuminate\Support\Facades\Redirect;

class AirportController extends Controller{
    public function checkLogin(){
        if(session("user") == null)
            redirect('/')->send();
    }

    public function airport(){
        $this->checkLogin();

        return view('airport')->with('airport', Airport::all());
    }

    public function airportDetail(Request $request){
        $this->checkLogin();

        $airport = $request->id == "new" ? new Airport() : Airport::find($request->id);
        if($request->id == "new") $airport->id = -1;

        return view('airport_edit')->with('airport', $airport);
    }

    public function airportUpdate(Request $q){
        $this->checkLogin();

        $airport = $q->id == -1 ? new Airport() : Airport::find($q->id);
        $airport->name = $q->name;
        $airport->code = $q->code;
        $airport->address = $q->address;
        $airport->city = $q->city;
        $airport->save();

        return view('airport_edit')->with('airport', $airport);
    }

    public function airportDelete(Request $q){
        $this->checkLogin();
        
        $airport = Airport::find($q->id);
        $airport->delete();

        return redirect('admin/airport');
    }
}
