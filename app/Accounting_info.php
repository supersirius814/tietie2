<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Accounting_info extends Model
{
	protected $table = 'accounting_info';
	protected $primaryKey = 'accounting_info_id';
	
	public function maintenance()
	{
		return $this->belongsTo('App\Maintenance');
	}

	public function accounting_info(){
        return $this->belongsTo('App\User', 'modified_by', 'user_id');
    }

}
