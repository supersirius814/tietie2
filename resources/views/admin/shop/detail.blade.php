@extends('admin.layout')
@section('title', '店舗詳細')
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
			<div class="card-body table-responsive p-0" style="max-height: 80vh;">
				<table class="table table-head-fixed text-nowrap">
					<thead>
						<tr>
							<th>店舗コード</th>
							<th>店舗名</th>
							<th>業態</th>
							<th>住所</th>
							<th>電話番号</th>
							<th>FAX番号</th>
							<th>開店日</th>
						</tr>
						<tbody></tbody>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		$.ajax({
			url: '{{ url('/api/v1/shops') }}/{{ $shop_code }}',
			type: 'POST',
			cache: false,
			dataType: 'json',
//			data: data,
		})
		.done(function(response) {
			console.log(response);
			let $tr = '';
			$tr += '<tr>';
			$tr += '<td>' + response['shop_code'] + '</td>';
			$tr += '<td>' + response['shop_name'] + '</td>';
			$tr += '<td>' + response['business_category']['business_category'] + '</td>';
			$tr += '<td>' + response['shop_address'] + '</td>';
			$tr += '<td>' + response['shop_phone_number'] + '</td>';
			$tr += '<td>' + response['shop_fax_number'] + '</td>';
			if (null === response['shop_open_date']) {
				$tr += '<td></td>';
			} else {
				$tr += '<td>' + response['shop_open_date'] + '</td>';				
			}
			$tr += '</tr>';
			$('.table tbody').append($tr);
		})
		.fail(function(xhr) {
			
		})
		.always(function() {
			
		});
	});
</script>
@endsection
