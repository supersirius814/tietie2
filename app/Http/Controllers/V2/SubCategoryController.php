<?php

namespace App\Http\Controllers\V2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Sub_category;

class SubCategoryController extends Controller
{
	public function index() {
		return Sub_category::all();
	}
	
	public function get($id) {
		return Sub_category::where('sub_category_id', $id)->get();
	}
}
