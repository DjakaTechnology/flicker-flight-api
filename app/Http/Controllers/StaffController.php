<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Admin;
use App\Level;

class StaffController extends Controller{
    public function checkLogin(){
        if(session("user") == null)
            redirect('/')->send();
    }

    public function staff(){
        $this->checkLogin();

        return view('staff')->with('staff', Admin::with('level')->get());
    }

    public function staffDetail(Request $request){
        $staff = $request->id == "new" ? new Admin() : Admin::find($request->id);
        if($request->id == "new"){
            $staff->id = -1;
        }
        return view('staff_detail')->with('staff', $staff)->with('level', Level::all());
    }

    public function staffSave(Request $q){
        $this->checkLogin();

        $staff = $q->id == -1 ? new Admin() : Admin::find($q->id);
        
        $staff->email = $q->email;
        $staff->name = $q->name;
        if($q->id == -1) $staff->password = bcrypt($q->password);
        $staff->level_id = $q->level_id;
    
        $staff->save();

        return view('staff_detail')->with('staff', $staff)->with('level', Level::all());
    }

    public function staffDelete(Request $q){
        $this->checkLogin();

        $staff = Admin::find($q->id);
        $staff->delete();

        return redirect('admin/staff');
    }
}