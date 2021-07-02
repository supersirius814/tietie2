<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\StreamedResponse;
use Illuminate\Support\Facades\Schema;

class CsvController extends Controller
{
	public function import(Request $request)
	{
		
		$uploaded_file = $request->file('csv_file');
		
		$file_path = $request->file('csv_file')->path($uploaded_file);
		
	}
	
	public function export(Request $request)
	{
		
		$table = $request->table;
		
		return new StreamedResponse(
			function () use ($table) {
				
				$columns = Schema::getColumnListing($table);
				$class_name = 'App\\' . ucfirst(rtrim($table, 's'));
				$stream = fopen('php://output', 'w');
				fputcsv($stream, $columns);

				$class_name::chunk(10, function ($records) use ($columns, $stream) {
					foreach ($records as $record) {
						$data = [];
						foreach ($columns as $column) {
							$data[] = $record->$column;
						}
						mb_convert_variables('SJIS-win', 'UTF-8', $data);
						fputcsv($stream, $data);							
					}
				});
				fclose($stream);
			},
			200,
			[
				'Content-Type' => 'text/csv',
				'Content-Disposition' => 'attachment; filename="' . $table . '_' . date('Ymd') . '.csv"',			
			]
		);
	
	}
}
