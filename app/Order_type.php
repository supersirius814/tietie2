<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order_type extends Model
{
	protected $primaryKey = 'order_type_id';

	public function maintenances()
	{
		return $this->hasMany('App\Maintenance');
	}
}
