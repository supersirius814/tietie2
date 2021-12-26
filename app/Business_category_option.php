<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Business_category_option extends Model
{
    //

    protected $table = 'business_category_options';
	public function shop()
	{
		return $this->hasMany('App\Shop', 'business_category_id', 'business_category_id');
	}
}
