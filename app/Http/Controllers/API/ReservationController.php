<?php
namespace App\Http\Controllers\API;
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use App\Route;
use App\Reservation;
use Illuminate\Support\Facades\Auth; 
use Validator;
class ReservationController extends Controller {
    public $successStatus = 200;

    function index(){
        $result = Route::all();
        return response()->json($result, $this-> successStatus);
    }

    function insert(Request $q)
    {
        $route = Route::find($q->route_id)->with('plane', 'plane.airline', 'airportTo', 'airportFrom')->first();
    
        $result = new Reservation;
        $result->res_code = "D17".rand(1000000, 9999999);

        $result->customer_id = $q->customer_id;
        $result->seat_code = $q->seat_code;
        $result->route_id = $q->route_id;
        $result->name = $q->name;
        $result->gender_id = $q->gender_id;

        $result->res_loc = $route->airportFrom->city;
        $result->destination_id = $route->airport_to_id;
        $result->checkin_at = $route->depart_at;
        $result->depart_at = $route->depart_at;
        $result->cost = $route->price;

        $result->status_id = 1;

        $result->save();

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
                            ->get();
        
        return response()->json($result, $this-> successStatus); 
    }

    function seatTaken(Request $request){
        $result = Reservation::where('route_id', $request->id)
                                ->where('status_id', '!=', 3)
                                ->select('id', 'name', 'gender_id', 'seat_code')
                                ->get();

        return response()->json($result, $this-> successStatus); 
    }

    function customer(Request $request){
       $result = Reservation::where('customer_id', $request->id)->with('customer', 'route', 'status', 'route.plane', 'route.plane.airline', 'route.airportTo', 'route.airportFrom')->get();

       return response()->json($result, $this-> successStatus); 
    }

    public function upload(Request $request) {
        $this->validate($request, [
            'img' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
    
        if ($request->hasFile('img')) {
            $image = $request->file('img');
            $name = time().'.'.$image->getClientOriginalExtension();
            $destinationPath = public_path('/upload/');
            $image->move($destinationPath, $name);
            $url = url('/').'/upload/'.$name;
            
            $reservation = Reservation::find($request->id);
            if($reservation->status_id != 3){
                $reservation->payment_proof = $url;
                
                $reservation->status_id = 1;
                $reservation->save();
            }
            
            //Revision Feature
            // if($reservation->try_count < 1){
            //     $reservation->payment_proof = $url;
            //     if($reservation->status_id == 3)
            //         $reservation->try_count = $reservation->try_count + 1;
            //     $reservation->status_id = 1;
            //     $reservation->save();
            // }

            return response()->json($reservation, $this-> successStatus); 
        }

        return array('result'=>false);
    }
}