<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Storage;

class FileViewController extends Controller
{


	/* local file get */

	//quotation pdf file get
	// public function getQuotationFile($file_name)
	// {
	// 	$file_url = 'public/quotations/'.$file_name;
	// 	$file = Storage::get($file_url);

	// 	// $file = Storage::disk('s3')->get("zensho-mainte/quotationfiles/$maintenance_id/$file_name");  
	// 	header('Content-type: application/pdf');
	// 	echo $file;
	// }
	
	// //report pdf file get
	// public function getReportFile($file_name)
	// {
	// 	$file_url = 'public/reports/'.$file_name;
	// 	$file = Storage::get($file_url);

	// 	// $file = Storage::disk('s3')->get("zensho-mainte/reportfiles/$maintenance_id/$file_name"); 
	// 	header('Content-type: application/pdf');
	// 	echo $file;
	// }

	// //photo file image get 
	// public function getPhotoFile($file_name)
	// {
	// 	$file_url = 'public/photos/'.$file_name;
	// 	$file = Storage::get($file_url);

	// 	// $file = Storage::disk('s3')->get("zensho-mainte/photofiles/$maintenance_id/$file_name"); 
	// 	header('Content-type: image/jpeg');
	// 	echo $file;
	// }


	/* s3 file get */

	//quotation pdf file get
	public function getQuotationFile($maintenance_id, $file_name)
	{
		$file = Storage::disk('s3')->get("zensho-mainte/quotationfiles/$maintenance_id/$file_name");  
		header('Content-type: application/pdf');
		echo $file;
	}
	
	//report pdf file get
	public function getReportFile($maintenance_id, $file_name)
	{
		$file = Storage::disk('s3')->get("zensho-mainte/reportfiles/$maintenance_id/$file_name"); 
		header('Content-type: application/pdf');
		echo $file;
	}

	//photo file image get 
	public function getPhotoFile($maintenance_id,$file_name)
	{
		$file = Storage::disk('s3')->get("zensho-mainte/photofiles/$maintenance_id/$file_name"); 
		header('Content-type: image/jpeg');
		echo $file;
	}
}
