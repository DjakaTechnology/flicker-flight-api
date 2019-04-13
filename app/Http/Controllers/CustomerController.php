<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Customer;
use App\Gender;

class CustomerController extends Controller{
    public function __construct(){
        
    }

    public function customer(){
        return view('customer')->with('customer', Customer::all());
    }

    public function customerDetail(Request $request){
        $customer = $request->id == "new" ? new Customer() : Customer::find($request->id);
        if($request->id == "new"){
            $customer->id = -1;
        }
        return view('customer_detail')->with('customer', $customer)->with('gender', Gender::all());
    }

    public function customerSave(Request $q){
        $customer = $q->id == -1 ? new Customer() : Customer::find($q->id);
        
        $customer->email = $q->email;
        $customer->name = $q->name;
        $customer->address = $q->address;
        $customer->phone = $q->phone;
        $customer->gender_id = $q->gender_id;
    
        $customer->save();

        return view('customer_detail')->with('customer', $customer)->with('gender', Gender::all());
    }

    public function customerDelete(Request $q){
        $customer = Customer::find($q->id);
        $customer->delete();

        return redirect('admin/customer');
    }
}