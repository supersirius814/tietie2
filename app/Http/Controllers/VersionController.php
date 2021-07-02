<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class VersionController extends Controller
{
	public function index() {
		$version = [
			'version' => '1.0',
			'history' => [
				'1.0' => '変更履歴',
				'0.9.1' => '変更履歴',
			],
		];
		return $version;
	}
}
