<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Manufacturer extends Model
{
	protected $primaryKey = 'manufacturer_id';

	public function equipment()
	{
		return $this->hasMany('App\Equipment');
	}
}
