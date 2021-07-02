<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Storage;

class ImageController extends Controller
{
	public function getImage($maintenance_id, $file_name)
	{
		$image = Storage::disk('s3')->get("zensho-mainte/images/$maintenance_id/$file_name");  
		header('Content-type: image/jpeg');
		echo $image;
	}
}
