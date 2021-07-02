@extends('layouts.layout')
@section('title', '新規メンテナンス申請')
@section('content')

<form action="{{ url('/api/v1/maintenance/post') }}" method="post" enctype="multipart/form-data" id="form-confirm" class="form-confirm">
	{{ csrf_field() }}
	<fieldset>
		<legend>申請者情報</legend>
		
		<table class="table">
			<tr>
				<th>店舗コード</th>
				<td>{{ $shop['shop_code'] }}</td>
			</tr>
			<tr>
				<th>店舗名</th>
				<td>{{ $shop['shop_name'] }}店</td>
			</tr>
			<tr>
				<th>申請者コード</th>
				<td>{{ Auth::user()->staff_id }}</td>
			</tr>
			<tr>
				<th>申請者氏名</th>
				<td>{{ Auth::user()->name }}</td>
			</tr>
		</table>
	</fieldset>
	
	<fieldset>
		<legend>申請内容</legend>
		
		<input type="hidden" name="business_category_id" value="{{ $form['business_category_id'] }}">
		<input type="hidden" name="shop_id" value="{{ $form['shop_id'] }}">
		<input type="hidden" name="applicant_id" value="{{ $form['applicant_id'] }}">
		<input type="hidden" name="equipment" value="{{ $form['equipment'] }}">
		<input type="hidden" name="manufacturer" value="{{ $form['manufacturer'] }}">
		<input type="hidden" name="model_number" value="{{ $form['model_number'] }}">
		<input type="hidden" name="when" value="{{ $form['when'] }}">
		<input type="hidden" name="situation" value="{{ $form['situation'] }}">
		<input type="hidden" name="order_type_id" value="{{ $form['order_type_id'] }}">
		<input type="hidden" name="order_reason_ids" value="{{ $order_reason_ids }}">
		<input type="hidden" name="order_type_other_text" value="{{ $form['order_type_other_text'] }}">
		@foreach ($images as $image)
			<input type="hidden" name="image_{{$loop->iteration}}" value="{{ $image }}">
		@endforeach
				
		<div class="mb-4">何が
			<p class="read-only">{{ $form['equipment'] }}</p>
		</div>
		
		<div class="mb-4">メーカー名
			<p class="read-only">{{ $form['manufacturer'] }}</p>
		</div>
		
		<div class="mb-4">型式・品番
			<p class="read-only">{{ $form['model_number'] }}</p>
		</div>
				
		<div class="mb-4">いつから
			<p class="read-only">{{ $form['when'] }}</p>
		</div>
		
		<div class="mb-4">どんな状態
			<p class="read-only">{{ $form['situation'] }}</p>
		</div>
		
		<div class="mb-4">どうするか
            @if ($form['order_type'] === '部品を送ってほしい')
                <p class="read-only">{{ $form['order_type'] }}（理由：@foreach ($reasons as $reason)<span class="reason">{{ $reason }}</span>@endforeach）</p>
            @elseif ($form['order_type'] === 'その他')
                <p class="read-only">{{ $form['order_type_other_text'] }}</p>
            @else
                <p class="read-only">{{ $form['order_type'] }}</p>
            @endif
			
		</div>
        
		@foreach ($images as $image)
			<div class="my-2">写真{{ $loop->iteration }}@if ($loop->iteration === 1)（全体）@elseif ($loop->iteration === 2)（細部）@elseif ($loop->iteration === 3)（型番）@endif
				<div class="text-center"><img src="{{ asset('img/tmp/') }}/{{ $image }}" alt="" style="max-width:100%; height:auto;"></div>
			</div>
		@endforeach
		
	</fieldset>
</form>
@endsection

@section('footer-button')
	<button type="button" class="back">戻って編集</button>
	<button type="submit" form="form-confirm" class="btn-confirm">この内容で<br>申請する</button>
@endsection

@push('scripts')
<script>
	$(function() {
		$('button[type="button"].back').on("click",function(){
			location.href = document.referrer;
		});
		$('form').submit(function () {
			$('.btn-confirm').prop('disabled', true);
			$('#loading').fadeIn();
		});
	});
</script>
@endpush
