@extends('admin.layout')
@section('title', 'ユーザー一覧')
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
				<table class="table table-head-fixed text-nowrap table-hover">
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
			url: '{{ url('/api/v1/users') }}',
			type: 'POST',
			cache: false,
			dataType: 'json',
//			data: data,
		})
		.done(function(response) {
			console.log(response);
			let $tr = '';
			for ( let i = 0; i < response.length; i++ ) {
				$tr += '<tr data-href="{{ url('admin/user') }}/' + response[i]['user_id'] + '">';
				$tr += '<td>' + response[i]['user_id'] + '</td>';
				$tr += '<td>' + response[i]['name'] + '</td>';
				$tr += '<td>' + response[i]['email'] + '</td>';
				if ( null !== response[i]['shop'] ) {
					$tr += '<td>' + response[i]['shop']['shop_code'] + '</td>';
					$tr += '<td>' + response[i]['shop']['shop_name'] + '</td>';
				} else {
					$tr += '<td></td>';
					$tr += '<td></td>';
				}
				$tr += '<td>' + response[i]['role']['role_id'] + ' : ' + response[i]['role']['role_name'] + '</td>';
				$tr += '</tr>';
			}
			$('.table tbody').append($tr);
		})
		.fail(function(xhr) {
			
		})
		.always(function() {
			
		});
		
		$(document).on('click', 'tr[data-href]', function(e) {
			if ( !$(e.target).is('a') ) {
				window.location = $(e.target).closest('tr').data('href');
			}
		});
		
	});
</script>
@endsection
