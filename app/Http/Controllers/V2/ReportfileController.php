<?php

namespace App\Http\Controllers\V2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Report_file;

class ReportfileController extends Controller
{
	public function index() {
		return Report_file::all();
	}
	
	public function get($id) {
		return Report_file::where('id', $id)->get();
	}
}
