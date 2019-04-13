<?php

namespace App\Http\Controllers;
use App\User; 
use Illuminate\Support\Facades\Auth; 
use Validator;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

class UserController extends Controller{
    public function index(){
        if(session('user') == null){
            return view('auth\login');
        }else
            return view('home');
    }

    public function login(){ 
        if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){ 
            $user = Auth::user(); 
            session(['user' => $user]);
            return redirect('/');
        } 
        else{ 
            return view('auth\login');
        } 
    }

    public function dashboard(){
        
    }
}
