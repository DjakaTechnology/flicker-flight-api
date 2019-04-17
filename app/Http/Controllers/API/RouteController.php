<?php
namespace App\Http\Controllers\API;
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use App\Route;
use Illuminate\Support\Facades\Auth; 
use Validator;
class RouteController extends Controller {
    public $successStatus = 200;

    function index(){
        $result = Route::all();
        return response()->json($result, $this-> successStatus);
    }

    function routeFromTo(Request $q){
        return Route::where('airport_from_id', $q->from)
                            ->where('airport_to_id', $q->to)
                            ->where('depart_at', 'LIKE', "%$q->depart%")
                            ->with('plane', 'plane.airline', 'airportTo', 'airportFrom')
                            ->get();
    }

    function search(Request $request){
        $result = Airport::where('name', 'like', "%$request->q%")
                            ->orWhere('code', 'like', "%$request->q%")
                            ->orWhere('city', 'like', "%$request->q%")
                            ->orWhere('address', 'like', "%$request->q%")
                            ->with('plane', 'plane.airline', 'airportTo', 'airportFrom')
                            ->get();
        
        return response()->json($result, $this-> successStatus); 
    }
}