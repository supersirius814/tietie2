<?php

namespace App\Http\Controllers\V2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Bmcategory_table;

class BmcategoryController extends Controller
{
	public function index() {
		return Bmcategory_table::all();
	}

}
