<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer_information extends Model
{
	protected $table = 'customer_information';
	
	public function maintenance()
	{
		return $this->belongsTo('App\Maintenance');
	}
}
