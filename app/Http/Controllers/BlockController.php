<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Block;

class BlockController extends Controller
{
	public function index() {
		return Block::all();
	}
}
