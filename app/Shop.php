<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Shop extends Model
{
	protected $primaryKey = 'shop_id';
	
	public function business_category()
	{
		return $this->belongsTo('App\Business_category', 'business_category_id', 'business_category_id');
	}

	public function block()
	{
		return $this->belongsTo('App\Block', 'block_id', 'block_id');
	}

	public function notices()
	{
		return $this->hasMany('App\Notice');
	}

	public function maintenances()
	{
		return $this->hasMany('App\Maintenance');
	}
	
	public function users()
	{
		return $this->hasMany('App\User');
	}
}
