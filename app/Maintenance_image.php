<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Maintenance_image extends Model
{	
	protected $primaryKey = 'maintenance_image_id';
	
	public function maintenance()
	{
		return $this->belongsTo('App\Maintenance');
	}
}
