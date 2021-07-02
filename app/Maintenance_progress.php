<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Maintenance_progress extends Model
{
	protected $table = 'maintenance_progress';
	
	public function maintenance()
	{
		return $this->belongsTo('App\Maintenance');
	}
	
	public function entered_by()
	{
		return $this->belongsTo('App\User', 'entered_by', 'user_id');
	}
	
}
