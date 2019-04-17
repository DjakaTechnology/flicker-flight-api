<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Airport;

class Route extends Model{
    public $primary_key = 'id';

    public function airportFrom(){
        return $this->belongsTo('App\Airport', 'airport_from_id');
    }

    public function airportTo(){
        return $this->belongsTo('App\Airport', 'airport_to_id');
    }

    public function plane(){
        return $this->belongsTo('App\Plane');
    }
}
