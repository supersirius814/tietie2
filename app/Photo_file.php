<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Photo_file extends Model
{
	protected $primaryKey = 'id';
	
	public function equipment()
	{
		return $this->hasMany('App\Equipment');
	}
}
