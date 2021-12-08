<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Partner extends Model
{
	protected $table = 'partners';
	
	public function maintenance()
	{
		return $this->belongsTo('App\Maintenance');
	}

	public function partner()
	{
		return $this->hasMany('App\Maintenance', 'partner_code', 'partner_code');
	}
}
