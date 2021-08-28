<?php

namespace App\Http\Controllers\V2;

use App\Http\Controllers\Controller;
use App\Matter_option;

class MatterOptionController extends Controller
{
	public function index() {
		return Matter_option::all();
	}
}
