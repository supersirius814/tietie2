<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Quotation_info extends Model
{
	protected $table = 'quotation_info';
	protected $primaryKey = 'quotation_info_id';
	
	public function maintenance()
	{
		return $this->belongsTo('App\Maintenance');
	}
	

}
