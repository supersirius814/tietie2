<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\User;

class UserController extends Controller
{
	public function index() {
		return User::with(['shop', 'role'])->get();
	}
	
	public function show($userId) {
		return User::with(['shop', 'role'])->find($userId);
	}
}
