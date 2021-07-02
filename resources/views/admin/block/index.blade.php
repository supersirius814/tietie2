@extends('admin.layout')
@section('title', 'ブロック情報')
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
							<th>ブロックコード</th>
							<th>ブロック名</th>
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
			url: '{{ url('/api/v1/admin/blocks') }}',
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
				$tr += '<td>' + response[i]['block_id'] + '</td>';
				$tr += '<td>' + response[i]['block_name'] + '</td>';
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
