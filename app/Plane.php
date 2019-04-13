<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Plane extends Model{
    public $timestamps = false;
    public function airline(){
        return $this->belongsTo('App\Airline');
    }
}
