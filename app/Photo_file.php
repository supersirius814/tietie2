<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Photo_file extends Model
{
	protected $primaryKey = 'photo_file_id';
	
	public function maintenance()
	{
		return $this->belongsTo('App\Maintenance');
	}
}
