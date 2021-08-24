<?php

namespace App\Http\Controllers\V2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Category;

class CategoryController extends Controller
{
	public function index() {
		return Category::all();
	}
	
	public function get($id) {
		return Category::where('category_id', $id)->get();
	}
}
