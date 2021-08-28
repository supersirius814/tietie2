<?php

namespace App\Http\Controllers\V2;

use App\Http\Controllers\Controller;
use App\Order_type;

class OrderTypeController extends Controller
{
	public function index() {
		return Order_type::all();
	}
	
	public function get($id) {
		return Order_type::where('order_type_id', $id)->get();
	}
}
