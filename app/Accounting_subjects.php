<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Accounting_subjects extends Model
{
    protected $table = 'accounting_subjects';
	protected $primaryKey = 'accounting_subjects_id';

	public function maintenance()
	{
		return $this->belongsTo('App\Maintenance');
	}
}
