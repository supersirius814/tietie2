<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order_reason extends Model
{
    protected $primaryKey = 'Order_reason_id';
    
    public function maintenances()
    {
        return $this->belongsToMany('App\Maintenance');
    }
}
