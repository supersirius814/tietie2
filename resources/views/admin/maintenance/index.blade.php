@extends('admin.layout')
@section('title', 'メンテナンス情報一覧')
@section('content')

@if (session('flash_message'))
	<div class="flash_message">
		{{ session('flash_message') }}
	</div>
@endif

<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<div class="card-title maintenance-status">
					<!-- <a href="#">承認済み()</a>
					<a href="#">承認待ち()</a>
					<a href="#">差戻し()</a>
					<span>緊急・重要災害</span>
					<span>（地震・台風・大雨など）</span> -->
				</div>
				<div class="card-tools">
                  <div class="input-group input-group-sm">
					<select name="business_category" class="select-business_category mr-1 select2">
						<option value="0">全業態</option>
						@foreach ($business_categories as $business_category)
							<option value="{{ $business_category->business_category_id }}">{{ $business_category->business_category }}</option>
						@endforeach
					</select>
					<select name="shop" class="select-shop mr-1 select2">
						<option value="">---</option>
						<?php
						/*
						@foreach ($shops as $shop)
							<option value="{{ $shop->shop_id }}">{{ $shop->shop_name }}</option>
						@endforeach
						*/
						?>
					</select>

					<button type="button" class="btn btn-default search">検索</button>

<!--
					<input type="text" name="table_search" class="form-control float-right" placeholder="Search">

					<div class="input-group-append">
					  <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
					</div>
-->
                  </div>
                </div>
			</div>
			<div class="card-body table-responsive p-0" style="max-height: 80vh;">
				<table class="table table-head-fixed table-hover table-index text-nowrap">
					<thead>
						<tr>
							<th>ID</th>
							<th>メンテナンスNo</th>
							<!-- <th>承認状況</th> -->
							<th>業態</th>
							<th>店舗名</th>
							<th>申請者</th>
							<th>依頼区分</th>
							<th>設備名</th>
							<th>経過ステータス</th>
							<th>完了日</th>
							<th>申請日</th>
							<th>アクション</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<div class="spinner text-center">
					<div class="spinner-border text-primary my-5" role="status"><span class="sr-only">Loading...</span></div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	let business_category_list = [];
	let progress_list = [];
	$(function() {
		let url = '';

		//業態リスト取得
		url = '{{ url('/api/v1/business_category') }}';
		ajaxRequest(url)
		.then(response => {
			for ( let i = 0; i < response.length; i++ ) {
				business_category_list[response[i]['business_category_id']] = response[i];
			}
			console.log(business_category_list);
		})
		.catch(error => {
			console.error(error);
			console.log("業態リスト取得エラー");
			console.log("リクエストurl::"+url);
		});

		//経過ステータスリスト取得
		url = '{{ url('/api/v1/progress') }}';
		ajaxRequest(url)
		.then(response => {
			for ( let i = 0; i < response.length; i++ ) {
				progress_list[response[i]['progress_id']] = response[i]['status'];
			}
			console.log(progress_list);
		})
		.catch(error => {
			console.error(error);
			console.log("経過ステータスリスト取得エラー");
			console.log("リクエストurl::"+url);
		});

		//初回メンテナンスリスト取得
		url = '{{ url('/api/v1/maintenance?limit=300') }}';
		ajaxRequest(url)
		.then(response => {
			console.log(response);
			let $table = $('.table tbody');
			let $lastTr = '';
			let $td = '';
			makeMaintenanceTableBody(response);

		})
		.catch(error => {
			console.error(error);
			console.log("初回メンテナンスリスト取得エラー");
			console.log("リクエストurl::"+url);
		});


		//経過ステータス更新
		$(document).on("click",'button.update',function(){
			let maintenance_id = $(this).data('id');
			let selected_progress = $('#progress_'+maintenance_id).val();
			let $buttonObj = $(this);
			$buttonObj.removeClass("btn-primary");
			$buttonObj.html('<div class="spinner-border text-primary" role="status" style="width: 1rem; height: 1rem;"><span class="sr-only">Loading...</span></div>');
			param = {'selected_progress':selected_progress};
			url = '{{ url('/api/v1/maintenance') }}/' + maintenance_id + '/put/update';
			ajaxRequest(url,param,false)
			.then(response => {
				console.log("通信成功");
				console.log(response);
				if('success' == response.progress_update){
					if(response.url){
						$('.content').prepend('<div class="flash_message" id="flash_message_'+maintenance_id+'">ID:'+maintenance_id+'の経過ステータスを更新しました。2秒後にリロードします。</div>');
					}else{
						$('.content').prepend('<div class="flash_message" id="flash_message_'+maintenance_id+'">ID:'+maintenance_id+'の経過ステータスを更新しました。</div>');
					}
				}else{
					$('.content').prepend('<div class="flash_message error" id="flash_message_'+maintenance_id+'">ID:'+maintenance_id+'の経過ステータス更新時にエラー【'+response.message+'】</div>');
				}
				setTimeout(function(){ $('#flash_message_'+maintenance_id).fadeOut().queue(function() {
					this.remove();
					if(response.url){
						location.href = response.url;
					}
				}); }, 2000);

				console.log($buttonObj);
				$buttonObj.addClass("btn-primary");
				$buttonObj.html("変更");
			})
			.catch(error => {
				console.error(error);
				console.log("経過ステータス更新エラー");
				console.log("リクエストurl::"+url);
			});

		});

		//業態別ショップリスト更新
		$('.select-business_category').on("change",function(){
			let business_category_id = $(this).val();
			param = {'business_category_id':business_category_id};
			url = '{{ url('/api/v1/shops') }}';
			ajaxRequest(url,param)
			.then(response => {
				console.log(response);
				if ( 0 < response.length && 0 != business_category_id) {
					$('.select-shop option').remove(); //option remove
					let $td = '<option value="0">全店舗</option>';
					for ( let i = 0; i < response.length; i++ ) {
						$td += '<option value="'+response[i]["shop_id"]+'">'+response[i]["shop_name"]+'</option>';
					}
					$('.select-shop').html($td);
				}else{
					$('.select-shop option').remove(); //option remove
					$('.select-shop').html('<option value="">---</option>');
				}

				$('.select2').select2({
					language: "ja", //日本語化
					theme: 'bootstrap4',
				});

			})
			.catch(error => {
				console.error(error);
				console.log("初回メンテナンスリスト取得エラー");
				console.log("リクエストurl::"+url);
			});

		});

		//メンテナンスリスト絞り込み
		$('.search').click(function() {
			let $tableRow = $('.table tbody tr');
			$tableRow.remove();

			$('.spinner').html('<div class="spinner-border text-primary" role="status"><span class="sr-only">Loading...</span></div>');

			let business_category_id = $('.select-business_category').val();
			let shop_id = $('.select-shop').val();
			let status = '';

			let param = {
				'action':"search",
				'business_category_id':business_category_id,
				'shop_id':shop_id,
				'status':status
						};
						console.log(param);
			let url = '{{ url('/api/v1/maintenance') }}';
			console.log(shop_id);
			if(0 != shop_id){
				url += "?shop_id="+shop_id;
			}
			console.log(url);
			$.ajax({
				url: url,
				type: 'POST',
				cache: false,
				dataType: 'json',
				data: param,
			})
			.done(function(response) {
				console.log(response);
				if ( 0 < response.length ) {
					makeMaintenanceTableBody(response);
				} else {
					console.log('データなし');
					$('.spinner-border').remove();
					$('.spinner').html('メンテナンスデータはありません');
				}
			})
			.fail(function(xhr) {

			})
			.always(function() {

			});
		});

	});

	//セレクトボックス検索機能
	$(function() {
		$('.select2').select2({
			language: "ja", //日本語化
			theme: 'bootstrap4',
		});
	});

	//
	function makeMaintenanceTableBody(maintenance){

		let $table = $('.table tbody');
		let $lastTr = '';
		let $td = '';

		for ( let i = 0; i < maintenance.length; i++ ) {
			$table.append('<tr>');
			$lastTr = $('.table tr').last();

			$td = '<td>' + maintenance[i]['maintenance_id'] + '</td>';
			if ( null === maintenance[i]['maintenance_code'] ) {
				$td += '<td>- - - - - - - - - -</td>';
			} else {
				$td += '<td>' + maintenance[i]['maintenance_code'] + '</td>';
			}
			// $td += '<td>' + maintenance[i]['progress']['status'] + '</td>';
			$td += '<td>' + maintenance[i]['shop']['business_category']['business_category'] + '</td>';
			$td += '<td>' + maintenance[i]['shop']['shop_name'] + '</td>';
			$td += '<td>' + maintenance[i]['user']['name'] + '</td>';
			$td += '<td>' + maintenance[i]['order_type']['type'] + '</td>';
			$td += '<td>' + maintenance[i]['equipment'] + '</td>';
			$td += '<td>';
			$td += '<select class="" id="progress_'+ maintenance[i]['maintenance_id'] +'">';
			$td += '<optgroup label="ステータス">';
			for ( let j = 1; j < progress_list.length; j++ ) {
				$td += '<option value="'+j+'"';
				if(maintenance[i]['progress']['status'] == progress_list[j]){
					$td +=' selected';
				}
				$td +='>'+progress_list[j]+'</option>';
			}
			$td += '</optgroup>';
			$td += '<optgroup label="消去">';
			$td += '<option value="9999">取下げ</option>';
			$td += '</optgroup>';
			$td += '</select>';
			$td += '</td>';
			if ( null === maintenance[i]['completed_date'] ) {
				$td += '<td>- - - - - - - - - -</td>';
			} else {
				$td += '<td>' + maintenance[i]['completed_date'] + '</td>';
			}
			$td += '<td>' + maintenance[i]['created_at'] + '</td>';
			$td += '<td><button type="button" data-id="'+maintenance[i]['maintenance_id']+'" class="btn btn-sm btn-primary update">変更</button></td>';
			$lastTr.append($td);
			$('.spinner-border').remove();

		}

		return true;
	}
</script>
@endsection
