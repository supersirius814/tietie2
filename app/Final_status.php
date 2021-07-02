<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Final_status extends Model
{
	protected $primaryKey = 'final_status_id';
	
	public function maintenances()
	{
		return $this->hasMany('App\Maintenance');
	}
}
