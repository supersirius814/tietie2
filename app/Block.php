<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Block extends Model
{
	protected $primaryKey = 'block_id';
	
	public function district()
	{
		return $this->belongsTo('App\District');
	}

	public function shop()
	{
		return $this->hasMany('App\Shop');
	}
}
