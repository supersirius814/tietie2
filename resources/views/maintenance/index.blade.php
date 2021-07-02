@extends('layouts.layout')

@section('title', 'メンテナンス一覧')

@section('content')

<div class="page-content page-content-maintenance-list">
	<ul class="nav nav-tabs" id="custom-tabs-status-tab" role="tablist">
		<li class="nav-item">
			<a class="nav-link active" id="custom-tabs-application-status-tab" data-toggle="pill" href="#custom-tabs-application-status" role="tab" aria-controls="custom-tabs-application-status" aria-selected="true">申請状況</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="custom-tabs-progress-tab" data-toggle="pill" href="#custom-tabs-progress" role="tab" aria-controls="custom-tabs-progress" aria-selected="false">進捗状況</a>
		</li>
	</ul>

	<div class="tab-content" id="custom-tabs-four-tabContent">
		<div class="tab-pane fade active show" id="custom-tabs-application-status" role="tabpanel" aria-labelledby="custom-tabs-application-status-tab">
			<div class="status-area">
				<div class="label">承認ST</div>
				<div class="status status-request">すべて</div>
				<div class="status-slide-container">
					<div class="status-slide">
						<div class="btn-close">
							<span class="btn-close__line btn-close__line--1"></span>
							<span class="btn-close__line btn-close__line--2"></span>
						</div>
						<h2>承認ステータス</h2>
						<ul class="status-list status-list-request">
							<li data-status-id="">すべて</li>
							<li data-status-id="1">BM承認待ち</li>
							<li data-status-id="2">BM承認</li>
							<li data-status-id="3">BM差戻し</li>
							<li data-status-id="4">BM却下</li>
							<li data-status-id="5">BM保留</li>
							<li data-status-id="6">本部受付前</li>
							<li data-status-id="22">問合せ中</li>
							<li data-status-id="7">本部差戻し</li>
							<li data-status-id="8">本部見送り</li>
						</ul>
					</div>
				</div>
			</div>

			@if (session('flash_message'))
				<div class="flash_message">{{ session('flash_message') }}</div>
			@endif

			<div class="table-container">
				<table class="table table-hover table-striped table-request">
					<thead>
						<tr>
							<th>申請日</th>
							<th>内容</th>
							<th>BM承認</th>
							<th>本部承認</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>

		<div class="tab-pane fade" id="custom-tabs-progress" role="tabpanel" aria-labelledby="custom-tabs-progress-tab">

			<div class="status-area">
				<div class="label">経過ST</div>
				<div class="status status-progress">すべて</div>
				<div class="status-slide-container">
					<div class="status-slide">
						<div class="btn-close">
							<span class="btn-close__line btn-close__line--1"></span>
							<span class="btn-close__line btn-close__line--2"></span>
						</div>
						<h2>経過ステータス</h2>
						<ul class="status-list status-list-progress">
							<li data-status-id="">すべて</li>
							<li data-status-id="9">依頼確定</li>
							<li data-status-id="10">依頼済</li>
							<li data-status-id="11">見積待ち</li>
							<li data-status-id="12">見積精査中</li>
							<li data-status-id="13">入荷待ち</li>
							<li data-status-id="14">DM承認待ち</li>
							<li data-status-id="15">稟議中</li>
							<li data-status-id="16">見積発注済み</li>
							<li data-status-id="17">日程調整中</li>
							<li data-status-id="18">訪問待ち</li>
							<li data-status-id="19">報告待ち</li>
							<li data-status-id="20">店完了</li>
							<li data-status-id="21">取完了</li>
						</ul>
					</div>
				</div>
			</div>

			@if (session('flash_message'))
				<div class="flash_message">{{ session('flash_message') }}</div>
			@endif

			<div class="table-container">
				<table class="table table-hover table-striped table-progress">
					<thead>
						<tr>
							<th>更新日</th>
							<th>内容</th>
							<th>経過ST</th>
							<th>訪問日</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div><!-- /.table-container -->
			
		</div><!-- /.tab-pane -->
	</div><!-- /.tab-content -->
</div><!-- /.page-content -->
	
<script>
	const status_data_list = [
		{ id:  1, bm: '待ち', headquarters: '受付前' },
		{ id:  2, bm: '承認', headquarters: '受付前' },
		{ id:  3, bm: '差戻', headquarters: '受付前' },
		{ id:  4, bm: '却下', headquarters: '受付前' },
		{ id:  5, bm: '保留', headquarters: '受付前' },
		{ id:  6, bm: '承認', headquarters: '受付前' },
		{ id:  7, bm: '承認', headquarters: '差戻し' },
		{ id:  8, bm: '承認', headquarters: '見送り' },
		{ id:  9, bm: '承認', headquarters: '依頼確定' },
		{ id: 10, bm: '承認', headquarters: '依頼済' },
		{ id: 11, bm: '承認', headquarters: '見積待ち' },
		{ id: 12, bm: '承認', headquarters: '見積精査中' },
		{ id: 13, bm: '承認', headquarters: '入荷待ち' },
		{ id: 14, bm: '承認', headquarters: 'DM承認待ち' },
		{ id: 15, bm: '承認', headquarters: '稟議中' },
		{ id: 16, bm: '承認', headquarters: '見積発注済' },
		{ id: 17, bm: '承認', headquarters: '日程調整中' },
		{ id: 18, bm: '承認', headquarters: '訪問待ち' },
		{ id: 19, bm: '承認', headquarters: '報告待ち' },
		{ id: 20, bm: '承認', headquarters: '店完了' },
		{ id: 21, bm: '承認', headquarters: '取完了' },
		{ id: 22, bm: '承認', headquarters: '問合中' },
	];

	$(function () {
		let apiUrl = '{{ url('/api/v1/maintenance') }}?shop_id={{ $shop['shop_id'] }}';

		//初期表示
		getMaintenanceData(apiUrl,'1,2,3,4,5,6,7,8,22','table-request');
		getMaintenanceData(apiUrl,'9,10,11,12,13,14,15,16,17,18,19,20,21','table-progress');


		// ステータスリスト開閉
		$('.status').on('click', function() {
			$('.status-slide-container').addClass('open');
		});

		$('.btn-close').on('click', function() {
			$('.status-slide-container').removeClass('open');
		});

		$('.status-list-request li').on('click', function() {
			$('.status-slide-container').removeClass('open');
			$('.status-request').text($(this).text());
		});

		$('.status-list-progress li').on('click', function() {
			$('.status-slide-container').removeClass('open');
			$('.status-progress').text($(this).text());
		});

		// ステータスリストで絞り込み
		$('.status-list-request li').on('click', function() {
			const status_id = $(this).data('status-id') ? $(this).data('status-id') : '1,2,3,4,5,6,7,8,22';
			getMaintenanceData(apiUrl,status_id,'table-request');
		});

		$('.status-list-progress li').on('click', function() {
			const status_id = $(this).data('status-id') ? $(this).data('status-id') : '9,10,11,12,13,14,15,16,17,18,19,20,21';
			getMaintenanceData(apiUrl,status_id,'table-progress');
		});


		// 関数にしたい
		// メンテデータ取得
		function getMaintenanceData(url,statusId,tableName) {
			// console.log("call getMaintenanceData");
			if(statusId){
				url += "&status_id=" + statusId;
			}
			ajaxRequest(url)
			.then(maintenances => {
				makeMaintenanceTableBody(maintenances, tableName);
			})
			.catch(error => {
				console.error(error);
				console.log("メンテデータ取得エラー");
				console.log("リクエストurl::"+apiUrl);
				console.log("リクエストstatus_id::"+status_id);
			});
		}


		// メンテナンステーブルボディ構築
		function makeMaintenanceTableBody(maintenances, tableName, statusList, statusId) {
			let row = '';
			const text_limit = 11;
			$('.'+tableName+' tbody tr').remove();
			maintenances.forEach( maintenance => {
				const progress_id = maintenance['progress_id'];
                const sort_order  = maintenance['progress']['sort_order'];
                
				let alert_class = '';
				alert_No = [3, 4, 7,];

					if ( 10 > sort_order ) {
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

		//選択中のタブをhashに記録して、history.backで元のタブに戻れる様に。
		var hash = document.location.hash;
		var paramsArr = hash.split('/');
		if (paramsArr[0]) {
			$('#custom-tabs-status-tab a[href="'+paramsArr[0]+'"]').tab('show');
		}
		$('#custom-tabs-status-tab a').on('shown.bs.tab', function (e) {
			hash = document.location.hash;
			paramsArr = hash.split('/');
			if(hash != e.target.hash){
				history.pushState('','',e.target.hash);
			}
		});
	});

</script>
@endsection

@section('footer-button')
	<div class="new-request"><a href="{{ url('/maintenance/add') }}"><img src="{{ asset('img/icon_new_request.svg') }}" alt="">新規申請</a></div>
@endsection
