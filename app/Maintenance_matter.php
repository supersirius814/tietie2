<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Maintenance_matter extends Model
{	
	protected $primaryKey = 'maintenance_matter_id';
	
	public function maintenance()
	{
		return $this->belongsTo('App\Maintenance');
	}

	public function matter_option()
	{
		return $this->belongsTo('App\Matter_option', 'matter_option_id', 'matter_option_id');
	}

	public function matter_value()
	{
		return $this->belongsTo('App\Matter_value', 'matter_value_id', 'matter_value_id');
	}
}
