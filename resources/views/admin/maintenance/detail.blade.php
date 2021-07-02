@extends( 'admin.layout' )
@section( 'title', 'メンテナンス申請 詳細' )
@section( 'content' )

<div class="content-admin-maintenance-detail">
	<div class="row" style="display: none;">
		<div class="col-8">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">基本情報</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-4">
							<table class="table table-bordered table-sm">
								<tr>
									<th>メンテナンスNo</th>
									<td id="maintenance_id"></td>
								</tr>
							</table>
							<table class="table table-bordered table-sm">
								<tr>
									<th rowspan="2">受付者</th>
									<td id="receptionist">北村　仁</td>
								</tr>
								<tr>
									<td id="receptionist_date">2020/04/05 00:00</td>
								</tr>
								<tr>
									<th rowspan="2">前受付者</th>
									<td id="pre_receptionist">北村　仁</td>
								</tr>
								<tr>
									<td id="pre_receptionist_date">2020/04/05 00:00</td>
								</tr>
							</table>
						</div>
						<div class="col-4">
							<table class="table table-bordered table-sm">
								<tr>
									<th>店舗CD</th>
									<td class="shop-code" id="shop-code"></td>
									<td class="business-category" id="business-category"></td>
								</tr>
								<tr>
									<th>店舗名</th>
									<td colspan="2" class="shop-name" id="shop-name"></td>
								</tr>
								<tr>
									<th>開店日</th>
									<td colspan="2" class="shop-open-date" id="shop-open-date"></td>
								</tr>
								<tr>
									<th>TEL</th>
									<td colspan="2" class="shop-phone-number" id="shop-phone-number"></td>
								</tr>
								<tr>
									<th>FAX</th>
									<td colspan="2" class="shop-fax-number" id="shop-fax-number"></td>
								</tr>
								<tr>
									<th>店舗担当</th>
									<td colspan="2" id="shop-charge">高橋</td>
								</tr>
							</table>
						</div>
						<div class="col-4">
							<table class="table table-bordered table-sm" id="organization-structure">
								<tr>
									<th></th>
									<th>名称</th>
									<th>担当者</th>
								</tr>
								<tr>
									<th>地域会社</th>
									<td>-</td>
									<td>-</td>
								</tr>
								<tr>
									<th>営業部</th>
									<td>西日本</td>
									<td>町野</td>
								</tr>
								<tr>
									<th>ディストリクト</th>
									<td>東海</td>
									<td>高木</td>
								</tr>
								<tr>
									<th>ブロック</th>
									<td>東愛知</td>
									<td>山田克</td>
								</tr>
								<tr>
									<th>エリア</th>
									<td>安城</td>
									<td>細川</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<button type="button" class="btn btn-sm bg-gradient-primary" data-toggle="modal" data-target="#modal-mail">メール</button>
				</div>

				<div class="modal fade" id="modal-mail" aria-modal="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">メール作成</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<table class="table table-bordered table-sm">
									<tr>
										<th></th>
										<th>名称</th>
										<th>担当者</th>
										<th>メール宛先</th>
										<th>メールCC</th>
									</tr>
									<tr>
										<th>地域会社</th>
										<td>-</td>
										<td>-</td>
										<td><input type="checkbox" name="">
										</td>
										<td><input type="checkbox" name="">
										</td>
									</tr>
									<tr>
										<th>営業部</th>
										<td>西日本</td>
										<td>町野</td>
										<td><input type="checkbox" name="">
										</td>
										<td><input type="checkbox" name="">
										</td>
									</tr>
									<tr>
										<th>ディストリクト</th>
										<td>東海</td>
										<td>高木</td>
										<td><input type="checkbox" name="">
										</td>
										<td><input type="checkbox" name="">
										</td>
									</tr>
									<tr>
										<th>ブロック</th>
										<td>東愛知</td>
										<td>山田克</td>
										<td><input type="checkbox" name="">
										</td>
										<td><input type="checkbox" name="">
										</td>
									</tr>
									<tr>
										<th>エリア</th>
										<td>安城</td>
										<td>細川</td>
										<td><input type="checkbox" name="">
										</td>
										<td><input type="checkbox" name="">
										</td>
									</tr>
								</table>
							</div>
							<div class="modal-footer justify-content-between">
								<button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
								<button type="button" class="btn btn-primary">メール作成</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->

			</div>
			<!-- /.card -->
		</div>
		<!-- /.col- -->

		<div class="col-4">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">特記情報</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-12">
							<table class="table table-bordered table-sm">
								<tr>
									<th>特記①</th>
									<td>20’10/13〜10/25改装<br>浄化槽店舗</td>
								</tr>
								<tr>
									<th>特記②</th>
									<td>20’5/21エアコン全台清掃<br>駐車場案件は大和ハウス様へ</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<button type="button" class="btn btn-sm bg-gradient-primary" data-toggle="modal" data-target="#modal-notice">特記登録</button>
				</div>

				<div class="modal fade" id="modal-notice" aria-modal="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">特記情報</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<table class="table table-bordered table-sm">
									<tr>
										<th>特記①</th>
										<td><textarea name="" id="" cols="30" rows="10"></textarea>
										</td>
									</tr>
									<tr>
										<th>特記②</th>
										<td><textarea name="" id="" cols="30" rows="10"></textarea>
										</td>
									</tr>
								</table>
							</div>
							<div class="modal-footer justify-content-between">
								<button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
								<button type="button" class="btn btn-primary">登録</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->

			</div>
			<!-- /.card -->
		</div>
		<!-- /.col- -->
	</div>
	<!-- .row -->

	<div class="row">
		<div class="col-6">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">依頼情報</h3>
					<button type="button" class="btn btn-sm btn-default float-right">編集</button>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-6">
							<table class="table table-bordered table-sm">
								<tr>
									<th>メンテナンスNo</th>
									<td>M123456789</td>
								</tr>
							</table>
						</div>
						<div class="col-6">
							<table class="table table-bordered table-sm">
								<tr>
									<th>店舗CD</th>
									<td>1174</td>
									<td>HS</td>
								</tr>
								<tr>
									<th>店舗名</th>
									<td colspan="2">八王子みなみ野駅前</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-5">
							
							<table class="table table-bordered table-sm">
								<tr>
									<th>最終ステータス</th>
									<td>入荷待ち</td>
								</tr>
							</table>
						</div>
						<div class="col-7">
							<button type="button" class="btn btn-default btn-sm">本部承認</button>
						</div>
					</div>
					
					<div class="row">
						<div class="col-6">
							<table class="table table-bordered table-sm">
								<tr>
									<th>大分類*</th>
									<td>空調</td>
								</tr>
								<tr>
									<th>中分類*</th>
									<td>エアコン</td>
								</tr>
							</table>
							<table class="table table-bordered table-sm">
								<tr>
									<th>依頼区分*</th>
									<td>修理依頼</td>
								</tr>
							</table>
						</div>
						
						<div class="col-6">
							<table class="table table-bordered table-sm">
								<tr>
									<th>取引先コード</th>
									<td>11000000060</td>
								</tr>
							</table>
							<table class="table table-bordered table-sm">
								<tr>
									<th>取引先名</th>
									<td colspan="2">パナソニック産機システムズ</td>
								</tr>
								<tr>
									<th>TEL/FAX</th>
									<td>0533-66-6277</td>
									<td>0533-66-6277</td>
								</tr>
							</table>
						</div>
					</div>
					<!-- .row -->
					<div class="row">
						<div class="col-12">
							<table class="table table-bordered table-sm">
								<tr>
									<th>依頼内容*</th>
									<td>AC2系統（客席）でP15エラー表示。冷えない。至急手配お願いいたします。AC2系統（客席）でP15エラー表示。冷えない。至急手配お願いいたします。AC2系統（客席）でP15エラー表示。冷えない。P15エラー表示。冷えない。至急手配お願いいたします。</td>
								</tr>
								<tr>
									<th>備考</th>
									<td>完全ガス欠</td>
								</tr>
								<tr>
									<th>添付ファイル</th>
									<td><a href="#">全体写真</a><a href="#">細部写真</a><a href="#">型番写真</a>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<!-- .row -->
					<div class="row">
						<div class="col-12">
							<table class="table table-bordered table-sm">
								<tr>
									<th rowspan="5">案件情報</th>
									<th>系統</th>
									<td>AC2</td>
									<th>原因</th>
									<td>AC2</td>
								</tr>
								<tr>
									<th>発生現象</th>
									<td>エラー</td>
									<th>原因箇所</th>
									<td>AC2</td>
								</tr>
								<tr>
									<th>エラーコード</th>
									<td>P15</td>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th>エラーコード</th>
									<td>P15</td>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th>エラーコード</th>
									<td>P15</td>
									<th></th>
									<td></td>
								</tr>
							</table>
						</div>
					</div>
					<!-- .row -->
				</div>

				<div class="modal fade" id="modal-client" aria-modal="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">取引先メール作成</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<table class="table table-bordered table-sm">
									<tr>
										<th>担当者</th>
										<th>メール宛先</th>
										<th>メールCC</th>
									</tr>
									<tr>
										<td>町野</td>
										<td><input type="checkbox" name="">
										</td>
										<td><input type="checkbox" name="">
										</td>
									</tr>
									<tr>
										<td>高木</td>
										<td><input type="checkbox" name="">
										</td>
										<td><input type="checkbox" name="">
										</td>
									</tr>
									<tr>
										<td>山田克</td>
										<td><input type="checkbox" name="">
										</td>
										<td><input type="checkbox" name="">
										</td>
									</tr>
									<tr>
										<td>細川</td>
										<td><input type="checkbox" name="">
										</td>
										<td><input type="checkbox" name="">
										</td>
									</tr>
								</table>
							</div>
							<div class="modal-footer justify-content-between">
								<button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
								<button type="button" class="btn btn-primary">メール作成</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->

				<div class="modal fade" id="modal-maintenance-detail" aria-modal="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">依頼情報</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">

							</div>
							<div class="modal-footer justify-content-between">
								<button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
								<button type="button" class="btn btn-primary">登録</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->

			</div>
			<!-- /.card -->
		</div>
		<!-- /.col- -->

		<div class="col-6">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">経過情報</h3>
					<button type="button" class="btn btn-default btn-sm float-right" data-toggle="modal" data-target="#modal-progress">登録</button>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-12">
							<button type="button" class="btn btn-default btn-sm">見積書(3)</button>
							<button type="button" class="btn btn-default btn-sm">写真(3)</button>
							<button type="button" class="btn btn-default btn-sm">報告書(1)</button>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col-12">
							<table class="table table-bordered table-sm">
							<thead>
								<tr>
									<th rowspan="2">日時</th>
									<th rowspan="2">ステータス</th>
									<th rowspan="2">コメント</th>
									<th colspan="2">FAX送信</th>
									<th rowspan="2">入力者</th>
								</tr>
								<tr>
									<th>取</th>
									<th>店</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2020/05/15 18:00:00</td>
									<td></td>
									<td>パナ訪問。ガス漏れ調査実施</td>
									<td>済</td>
									<td>済</td>
									<td>川手</td>
								</tr>
								<tr>
									<td>2020/05/12 18:00:00</td>
									<td></td>
									<td>漏れ箇所特定。商品入荷待ち</td>
									<td></td>
									<td></td>
									<td>島田</td>
								</tr>
								<tr>
									<td>2020/05/11 18:00:00</td>
									<td></td>
									<td>受付情報を取引先様にFAX送信</td>
									<td>済</td>
									<td></td>
									<td>島田</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
							</table>
						</div>
					</div>
				</div>

<!--				<div class="modal fade" id="modal-progress" aria-modal="true">-->
				<div>
					<div class="">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">経過情報登録</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="" method="">
									<div class="row">
										<div class="col-5">
											<table class="table">
												<tr>
													<th>経過ステータス*</th>
													<td>
														<select name="" id="">
															<option value="">----</option>
														</select>
													</td>
												</tr>
											</table>
										</div>
										<div class="col-3">
											<table class="table">
												<tr>
													<th>入力者</th>
													<td>川手</td>
												</tr>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<table class="table">
												<tr>
													<th>経過情報</th>
													<td>5月13日　13時訪問予定</td>
												</tr>
											</table>
										</div>
									</div>
								</form>
							</div>
							<div class="row">
								<div class="col-12">
									<button type="button" class="btn btn-default float-right" data-dismiss="modal">閉じる</button>
									<button type="button" class="btn btn-primary float-right">登録</button>
								</div>
							</div>					
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->

			</div>
			<!-- /.card -->
		</div>
		<!-- /.col- -->
	</div>
	<!-- .row -->

	<div class="row" style="display: none;">
		<div class="col-6">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">見積情報</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-12">
							<table class="table table-bordered table-sm">
								<tr>
									<th>日時</th>
									<th>金額</th>
									<th>摘要</th>
									<th>入力者</th>
								</tr>
								<tr>
									<td>2020/05/12 16:00:00</td>
									<td>200,000</td>
									<td>作業後の訂正見積</td>
									<td>川手</td>
								</tr>
								<tr>
									<td>2020/05/10 14:00:00</td>
									<td>250,000</td>
									<td>作業見積</td>
									<td>川手</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<button type="button" class="btn btn-sm bg-gradient-secondary">見積書 (3)</button>
					<button type="button" class="btn btn-sm bg-gradient-secondary">写真 (3)</button>
					<button type="button" class="btn btn-sm bg-gradient-secondary">報告書 (1)</button>
					<button type="button" class="btn btn-sm bg-gradient-primary" data-toggle="modal" data-target="#modal-estimation">見積登録</button>
				</div>

				<div class="modal fade" id="modal-estimation" aria-modal="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">見積情報</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">

							</div>
							<div class="modal-footer justify-content-between">
								<button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
								<button type="button" class="btn btn-primary">登録</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->

			</div>
			<!-- /.card -->
		</div>
		<!-- /.col- -->

		<div class="col-6">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">会計情報</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-12">
							<table class="table table-bordered table-sm">
								<tr>
									<th>会計年月</th>
									<th>請求金額（税抜）</th>
									<th>消費税</th>
									<th>請求金額（税込）</th>
									<th>科目</th>
									<th>入力者</th>
								</tr>
								<tr>
									<td>2020/05</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>川手</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<button type="button" class="btn btn-sm bg-gradient-primary" data-toggle="modal" data-target="#modal-accounting">会計登録</button>
				</div>

				<div class="modal fade" id="modal-accounting" aria-modal="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">会計情報</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">

							</div>
							<div class="modal-footer justify-content-between">
								<button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
								<button type="button" class="btn btn-primary">登録</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->

			</div>
			<!-- /.card -->
		</div>
		<!-- /.col- -->
	</div>
	<!-- .row -->

	<div class="row" style="display: none;">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">同一中分類過去履歴</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-12">
							<table class="table table-bordered table-sm">
							<thead>
								<tr>
									<th>緊/重</th>
									<th>メンテナンスNo</th>
									<th>ステータス</th>
									<th>依頼日</th>
									<th>完了日</th>
									<th>取引先名</th>
									<th>依頼内容</th>
									<th>会計年月</th>
									<th>請求金額（税抜）</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>緊急</td>
									<td>0000345678</td>
									<td>取完了</td>
									<td>2020/04/07</td>
									<td>2020/04/09</td>
									<td>パナソニック産機システムズ</td>
									<td>事務所のエアコンから水漏れ</td>
									<td>2020/04</td>
									<td>¥35,000</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<button type="button" class="btn btn-sm bg-gradient-primary" data-toggle="modal" data-target="#modal-history">店舗過去履歴</button>
				</div>

				<div class="modal fade" id="modal-history" aria-modal="true">
					<div class="modal-dialog modal-xl">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">店舗過去履歴</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<table class="table table-bordered table-sm">
								<thead>
									<tr>
										<th>緊/重</th>
										<th>メンテナンスNo</th>
										<th>ステータス</th>
										<th>依頼日</th>
										<th>完了日</th>
										<th>取引先名</th>
										<th>依頼内容</th>
										<th>会計年月</th>
										<th>請求金額（税抜）</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>緊急</td>
										<td>0000345678</td>
										<td>取完了</td>
										<td>2020/04/07</td>
										<td>2020/04/09</td>
										<td>パナソニック産機システムズ</td>
										<td>事務所のエアコンから水漏れ</td>
										<td>2020/04</td>
										<td>¥35,000</td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
								</table>
							</div>
							<div class="modal-footer justify-content-between">
								<button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
								<button type="button" class="btn btn-primary">登録</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->

			</div>
			<!-- /.card -->
		</div>
		<!-- /.col- -->
	</div>
	<!-- .row -->
</div>
<!-- .bg-white -->

<script>
$(function(){




	// ajaxリクエスト
	function ajaxRequest(url) {
		console.log("call "+url);
		return new Promise((resolve, reject) => {
			$.ajax({
				url: url,
				type: 'GET',
				cache: false,
				dataType: 'json',
			}).done( function(maintenances) {
				// console.log(maintenances);
				resolve(maintenances);
			}).fail( function(xhr) {
				reject(null);
			}).always( function() {

			});
		});
	}
	// メンテナンステーブルボディ構築
	function makeMaintenanceTableBody(maintenances, tableName, statusList, statusId) {
		let row = '';
		const text_limit = 11;
		$('.'+tableName+' tbody tr').remove();
		maintenances.forEach( maintenance => {
			const progress_id = maintenance['progress_id'];
			let alert_class = '';
			alert_No = [3, 4, 7,];

				if ( 9 > progress_id ) {
					//申請状況
					if (  alert_No.indexOf( progress_id ) !== -1 ) {
						alert_class = 'alert';
					}
					row += '<tr class="' + alert_class + '" data-href="{{ url('/maintenance') }}/' + maintenance['maintenance_id'] + '">';
					let created_at = maintenance['created_at'];
					if ( null !== created_at ) {
						created_at = created_at.split(' ');
						created_at = created_at[0].replace(/-/g, '/');
						created_at = created_at.slice(created_at.indexOf('/') + 1);
						row += '<td>' + created_at + '</td>';
					} else {
						row += '<td>' + maintenance['created_at'] + '</td>';
					}
					const order = ellipsis(maintenance['order'], text_limit);
					row += '<td>' + order + '</td>';

					const bm_status = status_data_list.find( (data) => data.id === progress_id ).bm;
					const headquarters = status_data_list.find( (data) => data.id === progress_id ).headquarters;

					row += '<td>' + bm_status + '</td>';
					row += '<td>' + headquarters + '</td>';
					row += '</tr>';
				}else{
					//進捗状況
					row += '<tr data-href="{{ url('/maintenance') }}/' + maintenance['maintenance_id'] + '">';
					let created_at = maintenance['created_at'];
					if ( null !== created_at ) {
						created_at = created_at.split(' ');
						created_at = created_at[0].replace(/-/g, '/');
						created_at = created_at.slice(created_at.indexOf('/') + 1);
						row += '<td>' + created_at + '</td>';
					} else {
						row += '<td>' + maintenance['created_at'] + '</td>';
					}

					const order = ellipsis(maintenance['order'], text_limit);
					row += '<td>' + order + '</td>';

					const headquarters = status_data_list.find( (data) => data.id === progress_id ).headquarters;
					row += '<td>' + headquarters + '</td>';
					row += '<td>----</td>';
					row += '</tr>';
				}
		});
		$('.'+tableName+' tbody').append(row);
	}
});

</script>


@endsection