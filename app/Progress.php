<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Progress extends Model
{	
	protected $table = 'progress';
	protected $primaryKey = 'progress_id';
	
	public function maintenances()
	{
		return $this->hasMany('App\Maintenance');
	}
}
