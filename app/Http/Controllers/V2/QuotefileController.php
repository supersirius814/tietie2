<?php

namespace App\Http\Controllers\V2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Quote_file;

class QuotefileController extends Controller
{
	public function index() {
		return Quote_file::all();
	}
	
	public function get($id) {
		return Quote_file::where('id', $id)->get();
	}
}
