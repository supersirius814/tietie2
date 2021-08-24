<?php

namespace App\Http\Controllers\V2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Client;

class ClientController extends Controller
{
	public function index() {
		return Client::all();
	}
}
