<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Quotation_file extends Model
{
	protected $primaryKey = 'quotation_file_id';
	protected $table = 'quotation_files';
	
	public function maintenance()
	{
		return $this->belongsTo('App\Maintenance');
	}
}
