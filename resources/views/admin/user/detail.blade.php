@extends('admin.layout')
@section('title', 'ユーザー詳細')
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
							<th>ユーザーID</th>
							<th>名前</th>
							<th>Email</th>
							<th>所属店舗コード</th>
							<th>所属店舗名</th>
							<th>権限</th>
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
			url: '{{ url('/api/v1/user') }}/{{ $user_id }}',
			type: 'POST',
			cache: false,
			dataType: 'json',
//			data: data,
		})
		.done(function(response) {
			console.log(response);
			let $tr = '';
			$tr += '<tr>';
			$tr += '<td>' + response['user_id'] + '</td>';
			$tr += '<td>' + response['name'] + '</td>';
			$tr += '<td>' + response['email'] + '</td>';
			if ( null !== response['shop'] ) {
				$tr += '<td>' + response['shop']['shop_code'] + '</td>';
				$tr += '<td>' + response['shop']['shop_name'] + '</td>';
			} else {
				$tr += '<td></td>';
				$tr += '<td></td>';
			}
			$tr += '<td>' + response['role']['role_id'] + ' : ' + response['role']['role_name'] + '</td>';
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
