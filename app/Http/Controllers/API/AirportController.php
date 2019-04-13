<?php
namespace App\Http\Controllers\API;
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use App\Airport;
use Illuminate\Support\Facades\Auth; 
use Validator;
class AirportController extends Controller {
    public $successStatus = 200;

    function index(){
        $result = Airport::all();
        return response()->json($result, $this-> successStatus); 
    }

    function search(Request $request){
        $result = Airport::where('name', 'like', "%$request->q%")
                            ->orWhere('code', 'like', "%$request->q%")
                            ->orWhere('city', 'like', "%$request->q%")
                            ->orWhere('address', 'like', "%$request->q%")
                            ->get();
        
        return response()->json($result, $this-> successStatus); 
    }
}