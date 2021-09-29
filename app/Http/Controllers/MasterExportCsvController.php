<?php

namespace App\Http\Controllers;

use DB;
use Carbon\Carbon;
use Symfony\Component\HttpFoundation\StreamedResponse;
use Log;

class MasterExportCsvController extends Controller
{
	public function index()
	{
		// 処理
		echo "パラメータを確認の上再実行してください";
		return;
	}

	public function exportCsv($value)
	{
		$kmsBusinessCatgTbl = "business_categories";
		setlocale(LC_ALL, 'ja_JP.UTF-8');

		$now = Carbon::now();

		if (!is_null($value))
		{
			// 業態種別情報のセット
			$businessCatg = $value;
			// echo "業態種別：".$businessCatg."</br>";
			Log::debug("業態種別：".$businessCatg);

			$kmsBusinessCatgId = DB::table($kmsBusinessCatgTbl)
			->where('business_category', $value)->value('business_category_id');
			// echo "KMS側の業態種別ID：".$kmsBusinessCatgId."</br>";
			Log::debug("KMS側の業態種別ID：".$kmsBusinessCatgId);

		} else {
			echo "パラメータを確認の上再実行してください";
			Log::debug("パラメータを確認の上再実行してください");
			return;
		}
		if (!is_null($businessCatg && !is_null($kmsBusinessCatgId)))
		{
			try {
				$organization = DB::select(
					"  SELECT".
					"    t8.department_name,".
					"    (SELECT c1.name FROM `users`c1 WHERE c1.user_id = t7.user_id) gm_name,".
					"    t6.district_name,".
					"    (SELECT c2.name FROM `users` c2 WHERE c2.user_id = t5.user_id) dm_name,".
					"    t4.block_name,".
					"    t1.staff_id,".
					"    t1.name,".
					"    t1.email,".
					"    t3.shop_code,".
					"    t3.shop_name".
					"  FROM `users` t1".
					"  INNER JOIN `block_managers` t2".
					"  ON t1.user_id = t2.user_id".
					"  INNER JOIN `shops` t3".
					"  ON t2.block_id = t3.block_id AND t3.business_category_id = ".$kmsBusinessCatgId.
					"  INNER JOIN `blocks` t4".
					"  ON t3.block_id = t4.block_id".
					"  INNER JOIN `district_managers` t5".
					"  ON t4.district_id = t5.district_id".
					"  INNER JOIN `districts` t6".
					"  ON t5.district_id = t6.district_id".
					"  INNER JOIN `general_managers` t7".
					"  ON t6.department_id = t7.department_id".
					"  INNER JOIN `departments` t8".
					"  ON t7.department_id = t8.department_id".
					"  WHERE t1.business_category_id = ".$kmsBusinessCatgId.
					"  GROUP BY t3.shop_code".
					"  ORDER BY t8.department_name, t6.district_name, t4.block_name"
				);

				// StreamedResponseの第1引数（コールバック関数）
				$response = new StreamedResponse(function () use ($organization) {

				// ファイルの書き出しはfopen()
				$stream = fopen('php://output', 'w');
				fwrite($stream, "\xEF\xBB\xBF");

				// ヘッダの設定
				$head = [
					'department_name',
					'gm_name',
					'district_name',
					'dm_name',
					'block_name',
					'staff_id',
					'bm_name',
					'email',
					'shop_code',
					'shop_name'
				];

				// 宣言したストリームに対してヘッダを書き出し
				mb_convert_variables('SJIS', 'UTF-8', $head);
				fputcsv($stream, $head);

				foreach ($organization as $value)
				{
					fputcsv($stream, [
						$value->department_name,
						$value->gm_name,
						$value->district_name,
						$value->dm_name,
						$value->block_name,
						$value->staff_id,
						$value->name,
						$value->email,
						$value->shop_code,
						$value->shop_name,
					]);
				}
				fclose($stream);
				},
				// StreamedResponseの第2引数（レスポンス）
				\Illuminate\Http\Response::HTTP_OK,

				// StreamedResponseの第3引数（レスポンスヘッダ）
				[
					'Content-Type'        => 'text/csv',
					'Content-Disposition' => 'attachment; filename='.'kms_'.$businessCatg.'_'.$now->format('YmdHis').'.csv',
				]
				);
				return $response;

			} catch (\Exception $e) {
				echo 'CSV出力に失敗しました';
				Log::error('CSV出力に失敗しました '.$e);
				return;
			}
		}
	}
}