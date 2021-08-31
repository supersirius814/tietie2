<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Report_file extends Model
{
	protected $primaryKey = 'report_file_id';
	
	public function maintenance()
	{
		return $this->belongsTo('App\Maintenance');
	}
}
