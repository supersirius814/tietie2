<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Progress;

class ProgressController extends Controller
{
	public function index() {
		return Progress::all();
	}
	
	public function type($type) {
		return Progress::where('type', $type)->get();
	}
}
