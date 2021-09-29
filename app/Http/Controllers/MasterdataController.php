<?php

namespace App\Http\Controllers;

use DB;
use ZipArchive;
use File;
use Log;

class MasterdataController extends Controller
{
	public function index()
	{
		// 処理
		echo "パラメータを確認の上再実行してください";
		return;
	}

	// マスタ連携_差分更新
	public function update($value)
	{
		setlocale(LC_ALL, 'ja_JP.UTF-8');

		global $businessCatg;
		global $businessCatgId;
		global $kmsBusinessCatgId;
		global $csvPath;
		global $fileNm1;
		global $fileNm2;
		global $ds;
		global $ts;

		$dbTblArray = array(
			"m_ht_department_temporary",
			"m_employee_temporary",
			"business_categories",
			"departments",
			"districts",
			"blocks",
			"shops",
			"users",
			"general_managers",
			"district_managers",
			"block_managers"
		);

		$kmsBusinessCatgTbl = "business_categories";

		$ds = DIRECTORY_SEPARATOR;
		$ts = time();
        $host = env('DB_HOST');
        $username = env('DB_USERNAME');
        $password = env('DB_PASSWORD');
        $database = env('DB_DATABASE');

		if (!is_null($value))
		{
			// 業態種別情報のセット
			$businessCatg = $value;
			// echo "業態種別：".$businessCatg."</br>";
			Log::debug("業態種別：".$businessCatg);

			$businessCatgId = DB::table($kmsBusinessCatgTbl)
			->where('business_category', $value)->value('company_cd');
			// echo "汎用CSV側の業態種別CD：".$businessCatgId."</br>";
			Log::debug("汎用CSV側の業態種別CD：".$businessCatgId);

			$kmsBusinessCatgId = DB::table($kmsBusinessCatgTbl)
			->where('business_category', $value)->value('business_category_id');
			// echo "KMS側の業態種別ID：".$kmsBusinessCatgId."</br>";
			Log::debug("KMS側の業態種別ID：".$kmsBusinessCatgId);

		} else {
			echo "パラメータを確認の上再実行してください";
			Log::debug("パラメータを確認の上再実行してください");
			return;
		}

		if (!is_null($businessCatg) && !is_null($businessCatgId))
		{
			// マスタ連携
			echo $businessCatg."向けマスタ連携<br/>";
			Log::debug($businessCatg."向けマスタ連携");

			// テーブルバックアップ先
			$tblBackupsPath = $ds.'mnt'.$ds.'efs'.$ds.'masterCooperation'.$ds.'backups';

			// 取り込む汎用CSVフルパス - 営業組織マスタ
			$organizationPath = $ds.'mnt'.$ds.'win'.$ds.$businessCatg.$ds;
			$importOrganizationPath = $organizationPath.'営業組織マスタ_*.csv';

			// 取り込む汎用CSVフルパス - 従業員マスタ
			$employeePath = $ds.'mnt'.$ds.'win'.$ds.$businessCatgId.$ds;
			$importEmployeePath = $employeePath.'従業員_社員_*.csv';

			// 汎用CSVファイルのファイルコピー先
			$csvPath = $ds.'mnt'.$ds.'efs'.$ds.'masterCooperation'.$ds.'csv';

			try {
				// テーブルバックアップ
				echo "DBバックアップ<br/>";
				Log::debug("DBバックアップ");

				$tblBackupsPath = $tblBackupsPath.$ds.date('Y', $ts).$ds.date('md', $ts).$ds;
				if (!is_dir($tblBackupsPath)) {
					mkdir($tblBackupsPath, 0755, true);
				}

				if (!is_null($host) && !is_null($username) && !is_null($password) && !is_null($database)){
					foreach ($dbTblArray as $table) {
						switch ($table){
							case "business_categories":
							case "m_ht_department_temporary":
							case "m_employee_temporary":
								break;

							default:
								$file = $table.'.sql';
								$command = sprintf('mysqldump -h %s -u %s -p%s %s %s > %s', $host, $username, $password, $database, $table, $tblBackupsPath.$file);
								exec($command);
								echo "　".$table."：完了<br/>";
								Log::debug("　".$table."：完了");
								break;
						}
					}
				} else {
					echo "接続情報が不足の為、DBバックアップに失敗しました。処理を中断します。<br/>";
					Log::debug("接続情報が不足の為、DBバックアップに失敗しました。処理を中断します。");
					return;
				}
				unset($table);

				// テーブルバックアップ後、ZIP圧縮
				$pathAry = array();
				foreach (glob($tblBackupsPath."*.sql") as $filename) {
					$pathAry[] = $filename;
				}
				// zipのインスタンス作成
				$objzip = new zipArchive($pathAry);

				// 一時ファイル（zip）の名前とPath
				$zipName = 'dump_'.$database.'_'.date("YmdHis", $ts).'.zip';
				$zipPath = $tblBackupsPath.$zipName;

				// 一時ファイル（zipファイル）を作成
				$result = $objzip->open($zipPath, ZIPARCHIVE::CREATE | ZIPARCHIVE::OVERWRITE);
				if ($result !== true) {
					echo "err - open zip-file";
					Log::debug("err - open zip-file");
					exit;
				}

				// スクリプトが実行可能な秒数を設定
				set_time_limit(0);

				// ZIPにSQLファイル追加
				foreach ($pathAry as $filepath) {
					$filename = basename($filepath);
					$objzip->addFromString($filename, file_get_contents($filepath));
				}
				$objzip->close();
				echo "　→ 出力されたダンプ圧縮ファイル：".$zipPath."<br/><br/>";
				Log::debug("　→ 出力されたダンプ圧縮ファイル：".$zipPath);
				Log::debug("");

				foreach ($pathAry as $fileUnlinkPath) {
					unlink($fileUnlinkPath);
				}
			} catch (\Exception $e) {
				echo 'テーブルバックアップに失敗しました';
				Log::error('テーブルバックアップに失敗しました '.$e);
				return;
			}

			try {
				$files1 = glob($importOrganizationPath);
				$files2 = glob($importEmployeePath);

				$fileNm1 = basename($files1[0]);
				$fileNm2 = basename($files2[0]);

				if (!is_dir($csvPath)) {
					mkdir($csvPath, 0755, true);
				}

				File::copy($files1[0], $csvPath.$ds.$fileNm1);
				File::copy($files2[0], $csvPath.$ds.$fileNm2);

			} catch (\Exception $e) {
				echo '汎用CSVのファイル設置に失敗しました';
				Log::error('汎用CSVのファイル設置に失敗しました '.$e);
				return;
			}

			/*-------------------------------------*/
			/*--------- マスタテーブル更新 ---------*/
			/*-------------------------------------*/
			DB::beginTransaction();

			try {
				// 汎用CSV取り込み処理
				$sql = "TRUNCATE TABLE m_ht_department_temporary;";
				DB::statement($sql);

				$sql = "TRUNCATE TABLE m_employee_temporary;";
				DB::statement($sql);

				$pdo = DB::connection()->getPdo();
				$pdo->setAttribute(\PDO::ATTR_EMULATE_PREPARES, true);

		        $sql = "set character_set_database=utf8; ";
				$sql .= "LOAD DATA LOCAL INFILE ";
				$sql .= '\''.$csvPath.'/'.$fileNm1."' ";
				$sql .= "INTO TABLE m_ht_department_temporary FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\\r\\n' IGNORE 1 LINES;";
				$pdo->exec($sql);

		        $sql = "set character_set_database=utf8; ";
				$sql .= "LOAD DATA LOCAL INFILE ";
				$sql .= '\''.$csvPath.'/'.$fileNm2."' ";
				$sql .= "INTO TABLE m_employee_temporary FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\\r\\n' IGNORE 1 LINES;";
				$pdo->exec($sql);

				if (!is_dir($csvPath.$ds.'old')) {
					mkdir($csvPath.$ds.'old', 0755, true);
				}

				// 汎用CSV取り込み後は指定階層へCSVファイル退避
				File::move($csvPath.$ds.$fileNm1, $csvPath.$ds.'old'.$ds.$fileNm1);
				File::move($csvPath.$ds.$fileNm2, $csvPath.$ds.'old'.$ds.$fileNm2);

				// 汎用CSV（営業組織）内の最新発令日を取得
				$announceDate = DB::table("m_ht_department_temporary")
				->where('business_catg', $businessCatg)->max('announce_date');

				// 優先1：departments
				$sql = file_get_contents(database_path('./sql/01_diff_update_departments.sql'));
				DB::statement($sql,['col1' => $announceDate, 'col2' => $businessCatg, 'col3' => $kmsBusinessCatgId]); // 差分更新SQL

				$sql = file_get_contents(database_path('./sql/01_diff_add_departments.sql'));
				DB::statement($sql,['col1' => $announceDate, 'col2' => $businessCatg, 'col3' => $kmsBusinessCatgId]); // 差分追加SQL

				// 優先2：districts
				$sql = file_get_contents(database_path('./sql/02_diff_update_districts.sql'));
				DB::statement($sql,['col1' => $announceDate, 'col2' => $businessCatg, 'col3' => $kmsBusinessCatgId]); // 差分更新SQL

				$sql = file_get_contents(database_path('./sql/02_diff_add_districts.sql'));
				DB::statement($sql,['col1' => $announceDate, 'col2' => $businessCatg, 'col3' => $kmsBusinessCatgId]); // 差分追加SQL

				// 優先3：blocks
				$sql = file_get_contents(database_path('./sql/03_diff_update_blocks.sql'));
				DB::statement($sql,['col1' => $announceDate, 'col2' => $businessCatg, 'col3' => $kmsBusinessCatgId]); // 差分更新SQL

				$sql = file_get_contents(database_path('./sql/03_diff_add_blocks.sql'));
				DB::statement($sql,['col1' => $announceDate, 'col2' => $businessCatg, 'col3' => $kmsBusinessCatgId]); // 差分追加SQL

				// 優先4：shops
				$sql = file_get_contents(database_path('./sql/04_diff_update_shops.sql'));
				DB::statement($sql,['col1' => $announceDate, 'col2' => $businessCatg, 'col3' => $kmsBusinessCatgId]); // 差分更新SQL

				$sql = file_get_contents(database_path('./sql/04_diff_add_shops.sql'));
				DB::statement($sql,['col1' => $announceDate, 'col2' => $businessCatg, 'col3' => $kmsBusinessCatgId]); // 差分追加SQL

				// 優先5：users
				$sql = file_get_contents(database_path('./sql/05-1_diff_update_users.sql'));
				DB::statement($sql,['col1' => $kmsBusinessCatgId]); // 差分更新SQL

				$sql = file_get_contents(database_path('./sql/05-1_diff_add_users.sql'));
				DB::statement($sql,['col1' => $kmsBusinessCatgId]); // 差分追加SQL

				$sql = file_get_contents(database_path('./sql/05-2_diff_update_users.sql'));
				DB::statement($sql,['col1' => $kmsBusinessCatgId]); // 差分更新SQL

				$sql = file_get_contents(database_path('./sql/05-2_diff_add_users.sql'));
				DB::statement($sql,['col1' => $kmsBusinessCatgId]); // 差分追加SQL

				// 優先6：general_managers
				$sql = file_get_contents(database_path('./sql/06_diff_update_general_managers.sql'));
				DB::statement($sql,['col1' => $announceDate, 'col2' => $kmsBusinessCatgId]); // 差分更新SQL

				$sql = file_get_contents(database_path('./sql/06_diff_add_general_managers.sql'));
				DB::statement($sql,['col1' => $announceDate, 'col2' => $businessCatg, 'col3' => $kmsBusinessCatgId]); // 差分追加SQL

				// 優先7：district_managers
				$sql = file_get_contents(database_path('./sql/07_diff_update_district_managers.sql'));
				DB::statement($sql,['col1' => $announceDate, 'col2' => $kmsBusinessCatgId]); // 差分更新SQL

				$sql = file_get_contents(database_path('./sql/07_diff_add_district_managers.sql'));
				DB::statement($sql,['col1' => $announceDate, 'col2' => $businessCatg, 'col3' => $kmsBusinessCatgId]); // 差分追加SQL

				// 優先8：block_managers
				$sql = file_get_contents(database_path('./sql/08_diff_update_block_managers.sql'));
				DB::statement($sql,['col1' => $announceDate, 'col2' => $kmsBusinessCatgId]); // 差分更新SQL

				$sql = file_get_contents(database_path('./sql/08_diff_add_block_managers.sql'));
				DB::statement($sql,['col1' => $announceDate, 'col2' => $businessCatg, 'col3' => $kmsBusinessCatgId]); // 差分追加SQL

				DB::commit();

				// 実行件数
				echo "差分更新<br/>";
				Log::debug("差分更新");
				echo "※件数は直近1分以内のものを抽出<br/>";
				Log::debug("※件数は直近1分以内のものを抽出");
				$createdCount = null; $updatedCount = null; $sumCount = null;

				foreach ($dbTblArray as $table) {
					switch ($table){
						case "m_ht_department_temporary":
						case "m_employee_temporary":
						case "business_categories":
							break;

						case "general_managers":
						case "district_managers":
						case "block_managers":
							$createdCount = DB::table($table)
							->where('created_at', '>=', DB::raw('DATE_SUB(NOW(),INTERVAL 1 MINUTE)'))->count();

							$updatedCount = DB::table($table)
							->where('updated_at', '>=', DB::raw('DATE_SUB(NOW(),INTERVAL 1 MINUTE)'))->count();

							$sumCount = (int)$createdCount+(int)$updatedCount;
							echo "　".$table." 計：".$sumCount." （新規：".$createdCount."　更新：".$updatedCount."）<br/>";
							echo "　　※"."TBL内部で業態判定がおこなえない為、当該TBLの新規・更新が集計されました</br>";
							Log::debug("　".$table." 計：".$sumCount." （新規：".$createdCount."　更新：".$updatedCount."）");
							Log::debug("　　※"."TBL内部で業態判定がおこなえない為、当該TBLの新規・更新が集計されました");
							break;

						default:
							$createdCount = DB::table($table)
							->where('created_at', '>=', DB::raw('DATE_SUB(NOW(),INTERVAL 1 MINUTE)'))
							->where('business_category_id', $kmsBusinessCatgId)->count();

							$updatedCount = DB::table($table)
							->where('updated_at', '>=', DB::raw('DATE_SUB(NOW(),INTERVAL 1 MINUTE)'))
							->where('business_category_id', $kmsBusinessCatgId)->count();

							$sumCount = (int)$createdCount+(int)$updatedCount;
							echo "　".$table." 計：".$sumCount." （新規：".$createdCount."　更新：".$updatedCount."）<br/>";
							Log::debug("　".$table." 計：".$sumCount." （新規：".$createdCount."　更新：".$updatedCount."）");
							break;
					}
				}

				unset($table);
				return;
			} catch (\Exception $e) {
				//ex->getMessage()；
				echo 'DB更新が失敗しました';
				Log::error('DB更新が失敗しました '.$e);
				var_dump($e);
				DB::rollback();
				return;
			}
			return;
		}
	}

	// マスタ連携_DBリストア
	public function restore($value)
	{
		setlocale(LC_ALL, 'ja_JP.UTF-8');

		global $businessCatg;
		global $dbRestoreArray;
		global $ds;
		global $ts;
		global $tblBackupsPath;
		global $zipFile;

		$dbRestoreArray = array(
			"departments",
			"districts",
			"blocks",
			"shops",
			"users",
			"general_managers",
			"district_managers",
			"block_managers"
		);

		$ds = DIRECTORY_SEPARATOR;
	    $ts = time();

	    $host = env('DB_HOST');
        $username = env('DB_USERNAME');
        $password = env('DB_PASSWORD');
        $database = env('DB_DATABASE');

		if (!is_null($value))
		{
			// 業態種別情報のセット
			$businessCatg = $value;

		} else {
			echo "パラメータを確認の上再実行してください";
			Log::debug("パラメータを確認の上再実行してください");
			return;
		}

		if (!is_null($businessCatg))
		{
			try {
				// DBリストア
				echo $businessCatg."向けDBリストア<br/>";
				Log::debug($businessCatg."向けDBリストア");

                // テーブルバックアップ先
                $tblBackupsPath = $ds.'mnt'.$ds.'efs'.$ds.'masterCooperation'.$ds.'backups';
              	$tblBackupsPath .= $ds.date('Y', $ts).$ds.date('md', $ts).$ds;
				$fileArray = scandir($tblBackupsPath);

				/*----- ディレクトリ内のZIPファイルを取得 ------*/
				foreach($fileArray as $fileContent){
					$fileName = $fileContent;

					$pathinfo = pathinfo($fileName,PATHINFO_EXTENSION);//拡張子のみ取得
					if($pathinfo === 'zip') //拡張子がCSVだったら
					{
						$fileDate[] = $fileName;//配列に入れる
					}
				}

				if(count($fileDate) === 0)
				{
					die('ZIPファイルが存在しません');
				}

				/*CSVファイルの更新日時を取得*/
				$timer = 0;//時間比較用の変数
				foreach ($fileDate as $newFile) {
					$timeDate = date('Y-m-d H:i:s', filemtime($tblBackupsPath.$newFile));
					if($timeDate > $timer)
					{
						$newCsv = $newFile;//最新のCSVファイル
						$timer = $timeDate;//最新の更新日時
					}
				}

				$zipFile = $newCsv;

				$zip = new ZipArchive;
				if ($zip->open($tblBackupsPath.$zipFile) === TRUE) {
					$zip->extractTo($tblBackupsPath);
					$zip->close();

					// DBリストア
					echo "DBリストア<br/>";
					Log::debug("DBリストア");
				}
			} catch (\Exception $e) {
				echo 'テーブルバックアップが失敗しました';
				Log::error('テーブルバックアップが失敗しました '.$e);
				return;
			}

			/*------------------------------*/
			/*--------- DBリストア ---------*/
			/*------------------------------*/
			DB::beginTransaction();
			try {
				DB::beginTransaction();
				foreach ($dbRestoreArray as &$table) {
					$file = $table.'.sql';
					$command = sprintf('mysql -h %s -u %s -p%s %s < %s', $host, $username, $password, $database, $tblBackupsPath.$file);
					exec($command);
					echo "　".$table."：リストア完了<br/>";
					Log::debug("　".$table."：リストア完了");
				}
				DB::commit();
				unset($table);

				$pathAry = array();
				foreach (glob($tblBackupsPath."*.sql") as $filename) {
					$pathAry[] = $filename;
				}

				foreach ($pathAry as $fileUnlinkPath) {
					unlink($fileUnlinkPath);
				}
				echo "　→ リストアしたダンプ圧縮ファイル：".$tblBackupsPath.$zipFile."<br/><br/>";
				Log::debug("　→ リストアしたダンプ圧縮ファイル：".$tblBackupsPath.$zipFile);
			} catch (\Exception $e) {
				echo 'DBリストアが失敗しました';
				Log::error('DBリストアが失敗しました '.$e);
				DB::rollback();
				return;
			}
		}
	}
}


