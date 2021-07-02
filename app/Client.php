<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
	
	protected $primaryKey = 'client_id';
	
	public function maintenances()
	{
		return $this->hasMany('App\Maintenance');
	}
}
