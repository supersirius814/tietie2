@extends('layouts.layout')
@section('title', '店舗一覧')
@section('content')

<ul class="list-group shop-list"></ul>

<script>
	$(function() {
		$.ajax({
			url: '{{ url('/api/v1/shop') }}',
			type: 'POST',
			cache: false,
			dataType: 'json',
//			data: data,
		})
		.done(function(response) {
			console.log(response);
			let $shops = '';
			for ( let i = 0; i < response.length; i++ ) {
				$shops += '<li class="list-group-item"><a href="{{ url('/maintenance')}}/' + response[i]['shop_id'] + '">' + response[i]['shop_name'] + '</a></li>'
			}
			$('.shop-list').append($shops);
		})
		.fail(function(xhr) {
			
		})
		.always(function() {
			
		});
	});
</script>
@endsection
