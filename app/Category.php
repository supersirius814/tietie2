<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
	protected $primaryKey = 'category_id';
	
	public function equipment()
	{
		return $this->hasMany('App\Equipment');
	}
	
	public function maintenances()
	{
		return $this->hasMany('App\Maintenance');
	}
}
