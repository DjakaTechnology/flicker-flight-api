<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Route;
use App\Airport;
use App\Plane;
use Illuminate\Support\Facades\Redirect;

class RouteController extends Controller{
    public function __construct(){
        
    }

    public function route(){
        return view('route')->with('route', Route::with('airportFrom', 'airportTo', 'plane', 'plane.airline')->get());
    }

    public function routeDetail(Request $request){
        $route = $request->id == "new" ? new Route() : Route::find($request->id);
        if($request->id == "new"){
            $route->id = -1;
        }
        return view('route_detail')->with('route', $route)->with('airport', Airport::all())->with('plane', Plane::with('airline')->get());
    }

    public function routeSave(Request $q){
        $route = $q->id == -1 ? new Route() : Route::find($q->id);
        
        $route->airport_from_id = $q->airport_from_id;
        $route->airport_to_id = $q->airport_to_id;
        $route->depart_at = $q->depart_at;
        $route->price = $q->price;
        $route->plane_id = $q->plane_id;
        $route->arrived_at = $q->arrived_at;
    
        $route->save();

        return view('route_detail')->with('route', $route)->with('airport', Airport::all())->with('plane', Plane::with('airline')->get());
    }

    public function routeDelete(Request $q){
        $route = Route::find($q->id);
        $route->delete();

        return redirect('admin/route');
    }
}
