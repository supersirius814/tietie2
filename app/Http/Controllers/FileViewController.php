<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Storage;

class FileViewController extends Controller
{
	//quotation pdf file get
	public function getQuotationFile($file_name)
	{
		$file_url = 'public/quotations/'.$file_name;
		$file = Storage::get($file_url);
		header('Content-type: application/pdf');
		echo $file;
	}
	
	//report pdf file get
	public function getReportFile($file_name)
	{
		$file_url = 'public/reports/'.$file_name;
		$file = Storage::get($file_url);
		header('Content-type: application/pdf');
		echo $file;
	}

	//photo file image get 
	public function getPhotoFile($file_name)
	{
		$file_url = 'public/photos/'.$file_name;
		$file = Storage::get($file_url);
		header('Content-type: image/jpeg');
		echo $file;
	}
}
