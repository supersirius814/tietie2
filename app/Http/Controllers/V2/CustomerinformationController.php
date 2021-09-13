<?php

namespace App\Http\Controllers\V2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Customer_information;

class CustomerinformationController extends Controller
{
	public function index() {
		return Customer_information::all();
	}

}
