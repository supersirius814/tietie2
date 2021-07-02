<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class District extends Model
{
	protected $primaryKey = 'District_id';
	
	public function block()
	{
		return $this->hasMany('App\Block');
	}
}
