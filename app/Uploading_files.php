<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Uploading_files extends Model
{
	protected $primaryKey = 'id';
	protected $table = 'uploading_files';
	
	public function maintenance()
	{
		return $this->belongsTo('App\Maintenance');
	}
}
