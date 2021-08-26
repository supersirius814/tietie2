<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sub_category extends Model
{
	protected $primaryKey = 'sub_category_id';
	
	public function maintenances()
	{
		return $this->hasMany('App\Maintenance');
	}
}
