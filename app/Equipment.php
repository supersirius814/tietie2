<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Equipment extends Model
{
	protected $table = 'equipments';
	
	protected $primaryKey = 'equipment_id';
	
	public function category()
	{
		return $this->belongsTo('App\Category');
	}
	
	public function sub_category()
	{
		return $this->belongsTo('App\Sub_category');
	}
	
	public function manufacturer()
	{
		return $this->belongsTo('App\Manufacturer');
	}
	
	public function maintenances()
	{
		return $this->hasMany('App\Maintenance');
	}
}
