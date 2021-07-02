@extends('admin.layout')
@section('title', 'メンテナンス申請 編集')
@section('content')

<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<div class="card-title"></div>
				<div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                    </div>
                  </div>
                </div>
			</div>
			<div class="card-body table-responsive p-0">
				<table class="table table-head-fixed text-nowrap">
					<thead>
						<tr>
							<th>メンテナンスNo</th>
							<th>ネゴシオメンテナンスNo</th>
							<th>業態コード</th>
							<th>業態名称</th>
							<th>店舗コード</th>
							<th>店舗名</th>
							<th>店舗担当</th>
							<th>依頼区分コード</th>
							<th>依頼区分名</th>
							<th>設備No</th>
							<th>設備名</th>
							<th>大分類コード</th>
							<th>大分類名</th>
							<th>中分類コード</th>
							<th>中分類名</th>
							<th>取引先コード</th>
							<th>取引先名</th>
							<th>依頼内容</th>
							<th>備考</th>
							<th>緊急・重要フラグ</th>
							<th>災害（地震・台風・大雨など）フラグ</th>
							<th>受付連絡FAX送信日時</th>
							<th>予定日</th>
							<th>予定時間</th>
							<th>予定日（再）</th>
							<th>予定時間（再）</th>
							<th>経過ステータス区分コード</th>
							<th>経過ステータス区分名</th>
							<th>原因/修繕内容</th>
							<th>予測費用</th>
							<th>見積金額（税抜）</th>
							<th>完了日</th>
							<th>完了判断者コード</th>
							<th>完了判断者名</th>
							<th>最終ステータス区分コード</th>
							<th>最終ステータス区分名</th>
						</tr>
						<tbody></tbody>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>

<div class=""><a href="{{ url('/maintenance') }}/{{ $shop_code }}/{{ $maintenance_id }}/update">更新する</a></div>
	

<script>
	$(function() {
		$.ajax({
			url: '{{ url('/api/v1/maintenance') }}/{{ $shop_code }}/{{ $maintenance_id }}',
			type: 'POST',
			cache: false,
			dataType: 'json',
//			data: data,
		})
		.done(function(response) {
			console.log(response);
			let $row = '<tr>';
			$row += '<td>' + response['maintenance_id'] + '</td>';
			$row += '<td>' + response['negozio_maintenance_id'] + '</td>';
			$row += '<td>' + response['business_category']['business_category_id'] + '</td>';
			$row += '<td>' + response['business_category']['business_category'] + '</td>';
			$row += '<td>' + response['shop_id'] + '</td>';
			$row += '<td>' + response['shop']['shop_name'] + '</td>';
			$row += '<td>' + response['user']['name'] + '</td>';
			$row += '<td>' + response['order_type_id'] + '</td>';
			$row += '<td>' + response['order_type']['type'] + '</td>';
			$row += '<td>' + response['equipment_id'] + '</td>';
			$row += '<td>' + response['equipment']['equipment_name'] + '</td>';
			$row += '<td>' + response['category']['category_id'] + '</td>';
			$row += '<td>' + response['category']['category_name'] + '</td>';
			$row += '<td>' + response['sub_category']['sub_category_id'] + '</td>';
			$row += '<td>' + response['sub_category']['sub_category_name'] + '</td>';
			$row += '<td>' + response['client_id'] + '</td>';
			$row += '<td>' + response['client']['client_name'] + '</td>';
			$row += '<td>' + response['order'] + '</td>';
			$row += '<td>' + response['remark'] + '</td>';
			$row += '<td>' + response['is_emergency'] + '</td>';
			$row += '<td>' + response['is_disaster'] + '</td>';
			$row += '<td></td>';
			$row += '<td>' + response['scheduled_date'] + '</td>';
			$row += '<td>' + response['scheduled_time'] + '</td>';
			$row += '<td>' + response['rescheduled_date'] + '</td>';
			$row += '<td>' + response['rescheduled_time'] + '</td>';
			$row += '<td>' + response['progress_status_code'] + '</td>';
			$row += '<td>' + response['progress_status']['progress_status'] + '</td>';
			$row += '<td>' + response['cause_repair'] + '</td>';
			$row += '<td>' + response['estimated_cost'] + '</td>';
			$row += '<td>' + response['estimated_amount'] + '</td>';
			$row += '<td>' + response['completed_date'] + '</td>';
			$row += '<td>' + response['judge'] + '</td>';
			$row += '<td></td>';
			$row += '<td>' + response['final_status_code'] + '</td>';
			$row += '<td>' + response['final_status']['final_status'] + '</td>';
			$row += '</tr>';
			$('.table tbody').append($row);
		})
		.fail(function(xhr) {
			
		})
		.always(function() {
			
		});
	});
</script>
@endsection
