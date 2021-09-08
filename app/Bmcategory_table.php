<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bmcategory_table extends Model
{
	protected $table = 'bmcategory_table';
	
	public function maintenance()
	{
		return $this->belongsTo('App\Maintenance');
	}
}
