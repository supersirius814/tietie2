<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Business_category extends Model
{
	protected $primaryKey = 'Business_category_id';
	
	public function shop()
	{
		return $this->hasMany('App\Shop');
	}
	
	public function user()
	{
		return $this->hasMany('App\User');
	}
}
