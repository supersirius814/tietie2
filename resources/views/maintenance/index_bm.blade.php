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
				<div class="status status-request" data-status-id="">すべて</div>
				<div class="status-slide-container">
					<div class="status-slide">
						<div class="btn-close">
							<span class="btn-close__line btn-close__line--1"></span>
							<span class="btn-close__line btn-close__line--2"></span>
						</div>
						<h2>承認ステータス</h2>
						<ul class="status-list status-list-request">
							<li data-status-id="">すべて</li>
							@foreach ( $all_progress as $progress )
								@if( 10 > $progress->sort_order ) <!-- progressテーブル BM承認待ち〜本部見送りまでと問合せ中 -->
								  <li data-status-id="{{ $progress->progress_id }}">{{ $progress->status }}</li>
								@endif
							@endforeach
							
						</ul>
					</div>
				</div>
			</div>
			
			<div class="shop-area">
				<div class="label">店舗</div>
				<div class="shop" data-shop-id="">すべて</div>
				<div class="shop-slide-container">
					<div class="shop-slide">
						<div class="btn-close">
							<span class="btn-close__line btn-close__line--1"></span>
							<span class="btn-close__line btn-close__line--2"></span>
						</div>
						<h2>店舗</h2>
						<ul class="shop-list shop-list-request">
							<li data-shop-id="">すべて</li>
							@foreach ($shops as $shop)
								<li data-shop-id="{{ $shop->shop_id }}">{{ $shop->shop_name }}</li>
							@endforeach
						</ul>
					</div>
				</div>
			</div>

			<div class="tables-request"></div>
			
		</div>

		<div class="tab-pane fade" id="custom-tabs-progress" role="tabpanel" aria-labelledby="custom-tabs-progress-tab">

			<div class="status-area">
				<div class="label">経過ST</div>
				<div class="status status-progress" data-status-id="">すべて</div>
				<div class="status-slide-container">
					<div class="status-slide">
						<div class="btn-close">
							<span class="btn-close__line btn-close__line--1"></span>
							<span class="btn-close__line btn-close__line--2"></span>
						</div>
						<h2>経過ステータス</h2>
						<ul class="status-list status-list-progress">
							<li data-status-id="">すべて</li>
							@foreach ( $all_progress as $progress )
								@if( 10 <= $progress->sort_order ) <!-- progressテーブル 依頼確定〜取完了まで -->
								  <li data-status-id="{{ $progress->progress_id }}">{{ $progress->status }}</li>
								@endif
							@endforeach
						</ul>
					</div>
				</div>
			</div>
			
			<div class="shop-area">
				<div class="label">店舗</div>
				<div class="shop" data-shop-id="">すべて</div>
				<div class="shop-slide-container">
					<div class="shop-slide">
						<div class="btn-close">
							<span class="btn-close__line btn-close__line--1"></span>
							<span class="btn-close__line btn-close__line--2"></span>
						</div>
						<h2>店舗</h2>
						<ul class="shop-list shop-list-progress">
							<li data-shop-id="">すべて</li>
							@foreach ($shops as $shop)
								<li data-shop-id="{{ $shop->shop_id }}">{{ $shop->shop_name }}</li>
							@endforeach
						</ul>
					</div>
				</div>
			</div>

			<div class="tables-progress"></div>
			
		</div><!-- /.tab-pane -->
	</div><!-- /.tab-content -->
</div><!-- /.page-content -->

<script>
	let url;
	const text_limit = 11;
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
	
@foreach ($shops as $shop)
		
	// ブロックを先に作る
	$('.tables-request').append('<div class="table-request-shop-id-{{ $shop->shop_id }}"></div>');
	$('.tables-progress').append('<div class="table-progress-shop-id-{{ $shop->shop_id }}"></div>');
	
	// 申請状況
	url = '{{ url('/api/v1/maintenance') }}?shop_id={{ $shop->shop_id }}&status_id=1,2,3,4,5,6,7,8,22&limit=3';
	$.ajax({
		url: url,
		type: 'GET',
		cache: false,
		dataType: 'json',
	})
	.done(function(maintenances) {
		
		// 店舗名の追加
		$('.table-request-shop-id-{{ $shop->shop_id }}').append('<div class="shop-name">{{ $shop->shop_name }}(' + maintenances.length + ')</div>');
		
		// テーブルの作成
		const $table = $('<table class="table table-hover table-striped"></table>');
		
		// theadの作成
		let thead  = '<thead>';
			thead += '<tr>';
			thead += '<th>申請日</th>';
			thead += '<th>内容</th>';
			thead += '<th>BM承認</th>';
			thead += '<th>本部承認</th>';
			thead += '</tr>';
			thead += '</thead>';
		$table.append(thead);
		
		// tbodyの作成
		const $tbody = $('<tbody></tbody>');
		let tr;
		maintenances.forEach((maintenance) => {
			let alert = '';
			if ( 'BM承認待ち' === maintenance['progress']['status'] ) {
				alert = 'alert';
			}
			tr += '<tr class="' + alert + '" data-href="{{ url('/maintenance') }}/' + maintenance['maintenance_id'] + '">';
			let created_at = maintenance['created_at'];
			if ( null !== created_at ) {
				created_at = created_at.split(' ');
				created_at = created_at[0].replace(/-/g, '/');
				created_at = created_at.slice(created_at.indexOf('/') + 1);
			}
			tr += '<td>' + created_at + '</td>';
			const order = ellipsis(maintenance['order'], text_limit);
			tr += '<td>' + order + '</td>';
			let progress_id = maintenance['progress_id'];
			const bm_status = status_data_list.find( (data) => data.id === progress_id ).bm;
			tr += '<td>' + bm_status + '</td>';
			const headquarters = status_data_list.find( (data) => data.id === progress_id ).headquarters;
			tr += '<td>' + headquarters + '</td>';
			tr += '</tr>';
		});
		$tbody.append(tr);		
		$table.append($tbody);
		
		$('.table-request-shop-id-{{ $shop->shop_id }}').append($table);

	})
	.fail( function(xhr) {

	})
	.always( function() {

	});

	
	
	// 進捗状況
	url = '{{ url('/api/v1/maintenance') }}?shop_id={{ $shop->shop_id }}&status_id=9,10,11,12,13,14,15,16,17,18,19,20,21&limit=3';
	$.ajax({
		url: url,
		type: 'GET',
		cache: false,
		dataType: 'json',
	})
	.done(function(maintenances) {
		
		// 店舗名の追加
		$('.table-progress-shop-id-{{ $shop->shop_id }}').append('<div class="shop-name">{{ $shop->shop_name }}(' + maintenances.length + ')</div>');

		// テーブルの作成
		const $table = $('<table class="table table-hover table-striped"></table>');
		
		// theadの作成
		let thead  = '<thead>';
			thead += '<tr>';
			thead += '<th>更新日</th>';
			thead += '<th>内容</th>';
			thead += '<th>経過ST</th>';
			thead += '<th>訪問日</th>';
			thead += '</tr>';
			thead += '</thead>';
		$table.append(thead);
		
		// tbodyの作成
		const $tbody = $('<tbody></tbody>');
		let tr = '';
		maintenances.forEach((maintenance) => {
			tr += '<tr data-href="{{ url('/maintenance') }}/' + maintenance['maintenance_id'] + '">';
			let updated_at = maintenance['updated_at'];
			if ( null !== updated_at ) {
				updated_at = updated_at.split(' ');
				updated_at = updated_at[0].replace(/-/g, '/');
				updated_at = updated_at.slice(updated_at.indexOf('/') + 1);
			}
			tr += '<td>' + updated_at + '</td>';
			const order = ellipsis(maintenance['order'], text_limit);
			tr += '<td>' + order + '</td>';
			let progress_id = maintenance['progress_id'];
			const headquarters = status_data_list.find( (data) => data.id === progress_id ).headquarters;
			tr += '<td>' + headquarters + '</td>';
			tr += '<td>-----</td>';
			tr += '</tr>';
		});
		$tbody.append(tr);
		$table.append($tbody);
		
		$('.table-progress-shop-id-{{ $shop->shop_id }}').append($table);

	})
	.fail( function(xhr) {

	})
	.always( function() {

	});
	
@endforeach
		

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
	
	
	// リスト開閉
	$('.status').on('click', function() {
		$('.status-slide-container').addClass('open');
	});
	
	$('.shop').on('click', function() {
		$('.shop-slide-container').addClass('open');
	});
	
	$('.btn-close').on('click', function() {
		$('.status-slide-container, .shop-slide-container').removeClass('open');
	});
	
	$('.status-list li').on('click', function() {
		$('.status-slide-container').removeClass('open');
		$('.active .status').text($(this).text()).data('status-id', $(this).data('status-id'));
	});
	
	$('.shop-list li').on('click', function() {
		$('.shop-slide-container').removeClass('open');
		$('.active .shop').text($(this).text()).data('shop-id', $(this).data('shop-id'));
	});
	

	// リストで絞り込み
	$('.status-list-request li').on('click', function() {
		
		const status_id = $(this).data('status-id');
		const shop_id = $('.active .shop').data('shop-id');

		const tablesRequest = $('.tables-request');
		tablesRequest.empty();

		if ( shop_id ) {
			
			url = '{{ url('/api/v1/maintenance') }}?shop_id=' + shop_id;
			if ( status_id ) {
				url += '&status_id=' + status_id;
			} else {
				url += '&status_id=1,2,3,4,5,6,7,8,22';
			}
			
			$.ajax({
				url: url,
				type: 'GET',
				cache: false,
				dataType: 'json',
			}).done( function( maintenances ) {
				tablesRequest.append('<div class="table-request-shop-id-' + shop_id + '"></div>');
				
				const shop_name = $('.active .shop').text();
				$('.table-request-shop-id-' + shop_id ).append('<div class="shop-name">' + shop_name + '(' + maintenances.length + ')</div>');

				// テーブルの作成
				const $table = $('<table class="table table-hover table-striped"></table>');

				// theadの作成
				let thead  = '<thead>';
					thead += '<tr>';
					thead += '<th>申請日</th>';
					thead += '<th>内容</th>';
					thead += '<th>BM承認</th>';
					thead += '<th>本部承認</th>';
					thead += '</tr>';
					thead += '</thead>';
				$table.append(thead);

				if ( maintenances.length ) {

					// tbodyの作成
					const $tbody = $('<tbody></tbody>');
					let tr;
					maintenances.forEach((maintenance) => {
						let alert = '';
						if ( 'BM承認待ち' === maintenance['progress']['status'] ) {
							alert = 'alert';
						}
						tr += '<tr class="' + alert + '" data-href="{{ url('/maintenance') }}/' + maintenance['maintenance_id'] + '">';
						let created_at = maintenance['created_at'];
						if ( null !== created_at ) {
							created_at = created_at.split(' ');
							created_at = created_at[0].replace(/-/g, '/');
							created_at = created_at.slice(created_at.indexOf('/') + 1);
						}
						tr += '<td>' + created_at + '</td>';
						const order = ellipsis(maintenance['order'], text_limit);
						tr += '<td>' + order + '</td>';
						let progress_id = maintenance['progress_id'];
						const bm_status = status_data_list.find( (data) => data.id === progress_id ).bm;
						tr += '<td>' + bm_status + '</td>';
						const headquarters = status_data_list.find( (data) => data.id === progress_id ).headquarters;
						tr += '<td>' + headquarters + '</td>';
						tr += '</tr>';					
					});
					$tbody.append(tr);		
					$table.append($tbody);

				}
				
				$('.table-request-shop-id-' + shop_id ).append($table);
				
			}).fail( function() {
				
			}).always( function() {
				
			});
		} else {
			@foreach ($shops as $shop)
				tablesRequest.append('<div class="table-request-shop-id-{{ $shop->shop_id }}"></div>');
				
				url = '{{ url('/api/v1/maintenance') }}?shop_id={{ $shop->shop_id }}&limit=3';
				if ( status_id ) {
					url += '&status_id=' + status_id;
				} else {
					url += '&status_id=1,2,3,4,5,6,7,8,22';
				}
				$.ajax({
					url: url,
					type: 'GET',
					cache: false,
					dataType: 'json',
				})
				.done( function(maintenances) {
					
					$('.table-request-shop-id-{{ $shop->shop_id }}').append('<div class="shop-name">{{ $shop->shop_name }}(' + maintenances.length + ')</div>');

					const $table = $('<table class="table table-hover table-striped"></table>');

					let thead  = '<thead>';
						thead += '<tr>';
						thead += '<th>申請日</th>';
						thead += '<th>内容</th>';
						thead += '<th>BM承認</th>';
						thead += '<th>本部承認</th>';
						thead += '</tr>';
						thead += '</thead>';
					$table.append(thead);

					const $tbody = $('<tbody></tbody>');
					let tr;
					maintenances.forEach((maintenance) => {
						let alert = '';
						if ( 'BM承認待ち' === maintenance['progress']['status'] ) {
							alert = 'alert';
						}
						tr += '<tr class="' + alert + '" data-href="{{ url('/maintenance') }}/' + maintenance['maintenance_id'] + '">';
						let created_at = maintenance['created_at'];
						if ( null !== created_at ) {
							created_at = created_at.split(' ');
							created_at = created_at[0].replace(/-/g, '/');
							created_at = created_at.slice(created_at.indexOf('/') + 1);
						}
						tr += '<td>' + created_at + '</td>';
						const order = ellipsis(maintenance['order'], text_limit);
						tr += '<td>' + order + '</td>';
						let progress_id = maintenance['progress_id'];
						const bm_status = status_data_list.find( (data) => data.id === progress_id ).bm;
						tr += '<td>' + bm_status + '</td>';
						const headquarters = status_data_list.find( (data) => data.id === progress_id ).headquarters;
						tr += '<td>' + headquarters + '</td>';
						tr += '</tr>';
					});
					$tbody.append(tr);		
					$table.append($tbody);

					$('.table-request-shop-id-{{ $shop->shop_id }}').append($table);
					
				}).fail( function() {
				
				}).always( function() {

				});
			@endforeach
		}
	});

	$('.shop-list-request li').on('click', function() {
		
		const status_id = $('.active .status').data('status-id');
		const shop_id = $(this).data('shop-id');

		const tablesRequest = $('.tables-request');
		tablesRequest.empty();

		if ( shop_id ) {
			
			url = '{{ url('/api/v1/maintenance') }}?shop_id=' + shop_id;
			if ( status_id ) {
				url += '&status_id=' + status_id;
			} else {
				url += '&status_id=1,2,3,4,5,6,7,8,22';
			}
			
			$.ajax({
				url: url,
				type: 'GET',
				cache: false,
				dataType: 'json',
			}).done( function( maintenances ) {
				tablesRequest.append('<div class="table-request-shop-id-' + shop_id + '"></div>');
				
				const shop_name = $('.active .shop').text();
				$('.table-request-shop-id-' + shop_id ).append('<div class="shop-name">' + shop_name + '(' + maintenances.length + ')</div>');

				// テーブルの作成
				const $table = $('<table class="table table-hover table-striped"></table>');

				// theadの作成
				let thead  = '<thead>';
					thead += '<tr>';
					thead += '<th>申請日</th>';
					thead += '<th>内容</th>';
					thead += '<th>BM承認</th>';
					thead += '<th>本部承認</th>';
					thead += '</tr>';
					thead += '</thead>';
				$table.append(thead);

				if ( maintenances.length ) {

					// tbodyの作成
					const $tbody = $('<tbody></tbody>');
					let tr;
					maintenances.forEach((maintenance) => {
						let alert = '';
						if ( 'BM承認待ち' === maintenance['progress']['status'] ) {
							alert = 'alert';
						}
						tr += '<tr class="' + alert + '" data-href="{{ url('/maintenance') }}/' + maintenance['maintenance_id'] + '">';
						let created_at = maintenance['created_at'];
						if ( null !== created_at ) {
							created_at = created_at.split(' ');
							created_at = created_at[0].replace(/-/g, '/');
							created_at = created_at.slice(created_at.indexOf('/') + 1);
						}
						tr += '<td>' + created_at + '</td>';
						const order = ellipsis(maintenance['order'], text_limit);
						tr += '<td>' + order + '</td>';
						let progress_id = maintenance['progress_id'];
						const bm_status = status_data_list.find( (data) => data.id === progress_id ).bm;
						tr += '<td>' + bm_status + '</td>';
						const headquarters = status_data_list.find( (data) => data.id === progress_id ).headquarters;
						tr += '<td>' + headquarters + '</td>';
						tr += '</tr>';					
					});
					$tbody.append(tr);		
					$table.append($tbody);

				}
				
				$('.table-request-shop-id-' + shop_id ).append($table);
				
			}).fail( function() {
				
			}).always( function() {
				
			});
		} else {
			@foreach ($shops as $shop)
				tablesRequest.append('<div class="table-request-shop-id-{{ $shop->shop_id }}"></div>');
				
				url = '{{ url('/api/v1/maintenance') }}?shop_id={{ $shop->shop_id }}&limit=3';
				if ( status_id ) {
					url += '&status_id=' + status_id;
				}
				$.ajax({
					url: url,
					type: 'GET',
					cache: false,
					dataType: 'json',
				})
				.done( function(maintenances) {
					
					$('.table-request-shop-id-{{ $shop->shop_id }}').append('<div class="shop-name">{{ $shop->shop_name }}(' + maintenances.length + ')</div>');

					const $table = $('<table class="table table-hover table-striped"></table>');

					let thead  = '<thead>';
						thead += '<tr>';
						thead += '<th>申請日</th>';
						thead += '<th>内容</th>';
						thead += '<th>BM承認</th>';
						thead += '<th>本部承認</th>';
						thead += '</tr>';
						thead += '</thead>';
					$table.append(thead);

					const $tbody = $('<tbody></tbody>');
					let tr;
					maintenances.forEach((maintenance) => {
						let alert = '';
						if ( 'BM承認待ち' === maintenance['progress']['status'] ) {
							alert = 'alert';
						}
						tr += '<tr class="' + alert + '" data-href="{{ url('/maintenance') }}/' + maintenance['maintenance_id'] + '">';
						let created_at = maintenance['created_at'];
						if ( null !== created_at ) {
							created_at = created_at.split(' ');
							created_at = created_at[0].replace(/-/g, '/');
							created_at = created_at.slice(created_at.indexOf('/') + 1);
						}
						tr += '<td>' + created_at + '</td>';
						const order = ellipsis(maintenance['order'], text_limit);
						tr += '<td>' + order + '</td>';
						let progress_id = maintenance['progress_id'];
						const bm_status = status_data_list.find( (data) => data.id === progress_id ).bm;
						tr += '<td>' + bm_status + '</td>';
						const headquarters = status_data_list.find( (data) => data.id === progress_id ).headquarters;
						tr += '<td>' + headquarters + '</td>';
						tr += '</tr>';
					});
					$tbody.append(tr);		
					$table.append($tbody);

					$('.table-request-shop-id-{{ $shop->shop_id }}').append($table);
					
				}).fail( function() {
				
				}).always( function() {

				});
			@endforeach
		}
	});

	$('.status-list-progress li').on('click', function() {
		
		const status_id = $(this).data('status-id');
		const shop_id = $('.active .shop').data('shop-id');

		const tablesProgress = $('.tables-progress');
		tablesProgress.empty();

		if ( shop_id ) {
			
			url = '{{ url('/api/v1/maintenance') }}?shop_id=' + shop_id;
			if ( status_id ) {
				url += '&status_id=' + status_id;
			} else {
				url += '&status_id=9,10,11,12,13,14,15,16,17,18,19,20,21';
			}
			
			$.ajax({
				url: url,
				type: 'GET',
				cache: false,
				dataType: 'json',
			}).done( function( maintenances ) {
				tablesProgress.append('<div class="table-progress-shop-id-' + shop_id + '"></div>');
				
				const shop_name = $('.active .shop').text();
				$('.table-progress-shop-id-' + shop_id ).append('<div class="shop-name">' + shop_name + '(' + maintenances.length + ')</div>');

				// テーブルの作成
				const $table = $('<table class="table table-hover table-striped"></table>');

				// theadの作成
				let thead  = '<thead>';
					thead += '<tr>';
					thead += '<th>更新日</th>';
					thead += '<th>内容</th>';
					thead += '<th>経過ST</th>';
					thead += '<th>訪問日</th>';
					thead += '</tr>';
					thead += '</thead>';
				$table.append(thead);

				if ( maintenances.length ) {

					// tbodyの作成
					const $tbody = $('<tbody></tbody>');
					let tr;
					maintenances.forEach((maintenance) => {
						let alert = '';
						if ( 'BM承認待ち' === maintenance['progress']['status'] ) {
							alert = 'alert';
						}
						tr += '<tr class="' + alert + '" data-href="{{ url('/maintenance') }}/' + maintenance['maintenance_id'] + '">';
						let created_at = maintenance['created_at'];
						if ( null !== created_at ) {
							created_at = created_at.split(' ');
							created_at = created_at[0].replace(/-/g, '/');
							created_at = created_at.slice(created_at.indexOf('/') + 1);
						}
						tr += '<td>' + created_at + '</td>';
						const order = ellipsis(maintenance['order'], text_limit);
						tr += '<td>' + order + '</td>';
						let progress_id = maintenance['progress_id'];
						const headquarters = status_data_list.find( (data) => data.id === progress_id ).headquarters;
						tr += '<td>' + headquarters + '</td>';
						tr += '<td>-----</td>';
						tr += '</tr>';					
					});
					$tbody.append(tr);		
					$table.append($tbody);

				}
				
				$('.table-progress-shop-id-' + shop_id ).append($table);
				
			}).fail( function() {
				
			}).always( function() {
				
			});
		} else {
			@foreach ($shops as $shop)
				tablesProgress.append('<div class="table-progress-shop-id-{{ $shop->shop_id }}"></div>');
				
				url = '{{ url('/api/v1/maintenance') }}?shop_id={{ $shop->shop_id }}&limit=3';
				if ( status_id ) {
					url += '&status_id=' + status_id;
				} else {
					url += '&status_id=9,10,11,12,13,14,15,16,17,18,19,20,21';
				}
				$.ajax({
					url: url,
					type: 'GET',
					cache: false,
					dataType: 'json',
				})
				.done( function(maintenances) {
					
					$('.table-progress-shop-id-{{ $shop->shop_id }}').append('<div class="shop-name">{{ $shop->shop_name }}(' + maintenances.length + ')</div>');

					const $table = $('<table class="table table-hover table-striped"></table>');

					let thead  = '<thead>';
						thead += '<tr>';
						thead += '<th>更新日</th>';
						thead += '<th>内容</th>';
						thead += '<th>経過ST</th>';
						thead += '<th>訪問日</th>';
						thead += '</tr>';
						thead += '</thead>';
					$table.append(thead);

					const $tbody = $('<tbody></tbody>');
					let tr;
					maintenances.forEach((maintenance) => {
						let alert = '';
						if ( 'BM承認待ち' === maintenance['progress']['status'] ) {
							alert = 'alert';
						}
						tr += '<tr class="' + alert + '" data-href="{{ url('/maintenance') }}/' + maintenance['maintenance_id'] + '">';
						let created_at = maintenance['created_at'];
						if ( null !== created_at ) {
							created_at = created_at.split(' ');
							created_at = created_at[0].replace(/-/g, '/');
							created_at = created_at.slice(created_at.indexOf('/') + 1);
						}
						tr += '<td>' + created_at + '</td>';
						const order = ellipsis(maintenance['order'], text_limit);
						tr += '<td>' + order + '</td>';
						let progress_id = maintenance['progress_id'];
						const headquarters = status_data_list.find( (data) => data.id === progress_id ).headquarters;
						tr += '<td>' + headquarters + '</td>';
						tr += '<td>-----</td>';
						tr += '</tr>';
					});
					$tbody.append(tr);		
					$table.append($tbody);

					$('.table-progress-shop-id-{{ $shop->shop_id }}').append($table);
					
				}).fail( function() {
				
				}).always( function() {

				});
			@endforeach
		}
	});

	$('.shop-list-progress li').on('click', function() {
		
		const status_id = $('.active .status').data('status-id');
		const shop_id = $(this).data('shop-id');

		const tablesProgress = $('.tables-progress');
		tablesProgress.empty();

		if ( shop_id ) {
			
			url = '{{ url('/api/v1/maintenance') }}?shop_id=' + shop_id;
			if ( status_id ) {
				url += '&status_id=' + status_id;
			} else {
				url += '&status_id=9,10,11,12,13,14,15,16,17,18,19,20,21';
			}
			
			$.ajax({
				url: url,
				type: 'GET',
				cache: false,
				dataType: 'json',
			}).done( function( maintenances ) {
				tablesProgress.append('<div class="table-progress-shop-id-' + shop_id + '"></div>');
				
				const shop_name = $('.active .shop').text();
				$('.table-progress-shop-id-' + shop_id ).append('<div class="shop-name">' + shop_name + '(' + maintenances.length + ')</div>');

				// テーブルの作成
				const $table = $('<table class="table table-hover table-striped"></table>');

				// theadの作成
				let thead  = '<thead>';
					thead += '<tr>';
					thead += '<th>更新日</th>';
					thead += '<th>内容</th>';
					thead += '<th>経過ST</th>';
					thead += '<th>訪問日</th>';
					thead += '</tr>';
					thead += '</thead>';
				$table.append(thead);

				if ( maintenances.length ) {

					// tbodyの作成
					const $tbody = $('<tbody></tbody>');
					let tr;
					maintenances.forEach((maintenance) => {
						let alert = '';
						if ( 'BM承認待ち' === maintenance['progress']['status'] ) {
							alert = 'alert';
						}
						tr += '<tr class="' + alert + '" data-href="{{ url('/maintenance') }}/' + maintenance['maintenance_id'] + '">';
						let created_at = maintenance['created_at'];
						if ( null !== created_at ) {
							created_at = created_at.split(' ');
							created_at = created_at[0].replace(/-/g, '/');
							created_at = created_at.slice(created_at.indexOf('/') + 1);
						}
						tr += '<td>' + created_at + '</td>';
						const order = ellipsis(maintenance['order'], text_limit);
						tr += '<td>' + order + '</td>';
						let progress_id = maintenance['progress_id'];
						const headquarters = status_data_list.find( (data) => data.id === progress_id ).headquarters;
						tr += '<td>' + headquarters + '</td>';
						tr += '<td>-----</td>';
						tr += '</tr>';					
					});
					$tbody.append(tr);		
					$table.append($tbody);

				}
				
				$('.table-progress-shop-id-' + shop_id ).append($table);
				
			}).fail( function() {
				
			}).always( function() {
				
			});
		} else {
			@foreach ($shops as $shop)
				tablesProgress.append('<div class="table-progress-shop-id-{{ $shop->shop_id }}"></div>');
				
				url = '{{ url('/api/v1/maintenance') }}?shop_id={{ $shop->shop_id }}&limit=3';
				if ( status_id ) {
					url += '&status_id=' + status_id;
				} else {
					url += '&status_id=9,10,11,12,13,14,15,16,17,18,19,20,21';
				}
				$.ajax({
					url: url,
					type: 'GET',
					cache: false,
					dataType: 'json',
				})
				.done( function(maintenances) {
					
					$('.table-progress-shop-id-{{ $shop->shop_id }}').append('<div class="shop-name">{{ $shop->shop_name }}(' + maintenances.length + ')</div>');

					const $table = $('<table class="table table-hover table-striped"></table>');

					let thead  = '<thead>';
						thead += '<tr>';
						thead += '<th>更新日</th>';
						thead += '<th>内容</th>';
						thead += '<th>経過ST</th>';
						thead += '<th>訪問日</th>';
						thead += '</tr>';
						thead += '</thead>';
					$table.append(thead);

					const $tbody = $('<tbody></tbody>');
					let tr;
					maintenances.forEach((maintenance) => {
						let alert = '';
						if ( 'BM承認待ち' === maintenance['progress']['status'] ) {
							alert = 'alert';
						}
						tr += '<tr class="' + alert + '" data-href="{{ url('/maintenance') }}/' + maintenance['maintenance_id'] + '">';
						let created_at = maintenance['created_at'];
						if ( null !== created_at ) {
							created_at = created_at.split(' ');
							created_at = created_at[0].replace(/-/g, '/');
							created_at = created_at.slice(created_at.indexOf('/') + 1);
						}
						tr += '<td>' + created_at + '</td>';
						const order = ellipsis(maintenance['order'], text_limit);
						tr += '<td>' + order + '</td>';
						let progress_id = maintenance['progress_id'];
						const headquarters = status_data_list.find( (data) => data.id === progress_id ).headquarters;
						tr += '<td>' + headquarters + '</td>';
						tr += '<td>-----</td>';
						tr += '</tr>';
					});
					$tbody.append(tr);		
					$table.append($tbody);

					$('.table-progress-shop-id-{{ $shop->shop_id }}').append($table);
					
				}).fail( function() {
				
				}).always( function() {

				});
			@endforeach
		}
	});

</script>
@endsection

@section('footer-button')
	<div class="new-request"><a href="{{ url('/maintenance/add') }}"><img src="{{ asset('img/icon_new_request.svg') }}" alt="">新規申請</a></div>
@endsection
