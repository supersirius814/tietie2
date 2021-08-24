<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Report_file extends Model
{
	protected $primaryKey = 'id';
	
	public function equipment()
	{
		return $this->hasMany('App\Equipment');
	}
}
