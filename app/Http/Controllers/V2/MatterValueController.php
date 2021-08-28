<?php

namespace App\Http\Controllers\V2;

use App\Http\Controllers\Controller;
use App\Matter_value;

class MatterValueController extends Controller
{
	public function index() {
		return Matter_value::all();
	}
}
