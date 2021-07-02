@extends('admin.layout')
@section('title', 'お取引先様情報')
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
							<th>お取引先様コード</th>
							<th>お取引先様名</th>
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
			url: '{{ url('/api/v1/admin/clients') }}',
			type: 'POST',
			cache: false,
			dataType: 'json',
//			data: data,
		})
		.done(function(response) {
			console.log(response);
			let $tr = '';
			for ( let i = 0; i < response.length; i++ ) {
				$tr += '<tr>';
				$tr += '<td>' + response[i]['client_code'] + '</td>';
//				$tr += '<td><a href="{{ url('/admin/client') }}/' + response[i]['id'] + '">' + response[i]['client_name'] + '</a></td>';
				$tr += '<td>' + response[i]['client_name'] + '</td>';
				$tr += '</tr>';
			}
			$('.table tbody').append($tr);
		})
		.fail(function(xhr) {
			
		})
		.always(function() {
			
		});
	});
</script>

@endsection
