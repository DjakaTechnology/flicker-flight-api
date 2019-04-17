<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Airline;

use Illuminate\Support\Facades\Redirect;

class AirlineController extends Controller{
    public function checkLogin(){
        if(session("user") == null)
            redirect('/')->send();
    }

    public function checkAdmin(){
        if(session("user")->level_id != 1)
            redirect('admin/airline')->send();
    }

    public function airline(){
        $this->checkLogin();

        return view('airline')->with('airline', Airline::all());
    }

    public function airlineDetail(Request $request){
        $this->checkLogin();

        $airline = $request->id == "new" ? new Airline() : Airline::find($request->id);
        if($request->id == "new") $airline->id = -1;

        return view('airline_detail')->with('airline', $airline);
    }

    public function airlineUpdate(Request $q){
        $this->checkLogin();

        $airline = $q->id == -1 ? new Airline() : Airline::find($q->id);
        
        $airline->name = $q->name;
        $airline->logo = $q->logo;
        $airline->description = $q->description;
        
        if($q->id == -1) $this->checkAdmin();

        $airline->save();

        return view('airline_detail')->with('airline', $airline);
    }

    public function airlineDelete(Request $q){
        $this->checkLogin();
        $airline = Airline::find($q->id);
        $airline->delete();

        return redirect('admin/airline');
    }
}
