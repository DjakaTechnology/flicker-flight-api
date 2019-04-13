<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Plane;
use App\Airline;
use Illuminate\Support\Facades\Redirect;

class PlaneController extends Controller{
    public function __construct(){
        
    }

    public function plane(){
        return view('plane')->with('plane', Plane::with('airline')->get());
    }

    public function planeDetail(Request $request){
        $plane = $request->id == "new" ? new Plane() : Plane::find($request->id);
        if($request->id == "new"){
            $plane->id = -1;
        }
        return view('plane_detail')->with('plane', $plane)->with('airline', Airline::all());
    }

    public function planeSave(Request $q){
        $plane = $q->id == -1 ? new Plane() : Plane::find($q->id);
        
        $plane->code = $q->code;
        $plane->seat_row = $q->seat_row;
        $plane->seat_column = $q->seat_column;
        $plane->airline_id = $q->airline_id;
    
        $plane->save();

        return view('plane_detail')->with('plane', $plane)->with('airline', Airline::all());;
    }

    public function planeDelete(Request $q){
        $plane = Plane::find($q->id);
        $plane->delete();

        return redirect('admin/plane');
    }
}
