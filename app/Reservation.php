<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reservation extends Model{
    public function customer(){
        return $this->belongsTo('App\Customer');
    }

    public function destination(){
        return $this->belongsTo('App\Airport', 'destination_id');
    }

    public function route(){
        return $this->belongsTo('App\Route');
    }

    public function status(){
        return $this->belongsTo('App\Status');
    }
}
