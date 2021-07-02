<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Shop;

class ShopController extends Controller
{
	public function index(Request $request) {
		$business_category_id = $request->input('business_category_id');
		if($business_category_id){
			return Shop::with(['business_category'])->where('business_category_id',$business_category_id)->get();
		}
		return Shop::with(['business_category'])->get();
	}
	
	public function show($shopCode) {
		return Shop::with(['business_category'])->find($shopCode);
	}
}
