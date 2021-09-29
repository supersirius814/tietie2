@extends('layouts.layout')

@section('title', '新規メンテナンス申請')

@section('content')

<form autocomplete="off" action="{{ url('/maintenance/add/confirm') }}" method="post" enctype="multipart/form-data" id="form-add" class="form-add">
	{{ csrf_field() }}
	<fieldset>
		<legend>申請内容</legend>

		<input type="hidden" name="business_category_id" value="{{ Auth::user()->business_category_id }}">
		<input type="hidden" name="role_id" value="{{ Auth::user()->role_id }}">
		<input type="hidden" name="applicant_id" value="{{ Auth::user()->user_id }}">
		
		@if ( $role === 'BM' )
			@if ($errors->has('shop_id'))
				<span class="invalid-feedback" role="alert">
					<strong>{{ $errors->first('shop_id') }}</strong>
				</span>
			@endif
			<label class="mb-4">店舗 <span class="badge badge-danger">必須</span>
				<select name="shop_id" id="">
					<option value="">選択してください</option>
					@foreach ( $shops as $shop )
						<option value="{{ $shop['shop_id'] }}" @if ( session('form.shop_id') == $shop['shop_id'] ) selected @endif>{{ $shop['shop_name'] }}</option>
					@endforeach
				</select>
			</label>
		@else
			<input type="hidden" name="shop_id" value="{{ Auth::user()->shop_id }}">
		@endif
		
		@if ($errors->has('applicant_name'))
			<span class="invalid-feedback" role="alert">
				<strong>{{ $errors->first('applicant_name') }}</strong>
			</span>
		@endif
		<label class="mb-4">申請者 <span class="badge badge-danger">必須</span>
            @if ( $role === 'BM' )
    			<input type="text" name="applicant_name" value="{{ Auth::user()->name }}">
            @else
    			<input type="text" name="applicant_name" value="{{ session('form.applicant_name') }}">
            @endif
		</label>

		@if ($errors->has('equipment'))
			<span class="invalid-feedback" role="alert">
				<strong>{{ $errors->first('equipment') }}</strong>
			</span>
		@endif
		<label class="mb-4">何が <span class="badge badge-danger">必須</span>
			<input type="text" name="equipment" value="{{ session('form.equipment') }}">
		</label>

		@if ($errors->has('manufacturer'))
			<span class="invalid-feedback" role="alert">
				<strong>{{ $errors->first('manufacturer') }}</strong>
			</span>
		@endif
		<label class="mb-4">メーカー名 <span class="badge badge-danger">必須</span>
			<input type="text" name="manufacturer" value="{{ session('form.manufacturer') }}" class="mt-1">
		</label>

		@if ($errors->has('model_number'))
			<span class="invalid-feedback" role="alert">
				<strong>{{ $errors->first('model_number') }}</strong>
			</span>
		@endif
		<label class="mb-4">型式・品番 <span class="badge badge-danger">必須</span>
			<input type="text" name="model_number" value="{{ session('form.model_number') }}" class="mt-1">
		</label>

		@if ($errors->has('when'))
			<span class="invalid-feedback" role="alert">
				<strong>{{ $errors->first('when') }}</strong>
			</span>
		@endif
		<label class="mb-4">いつから <span class="badge badge-danger">必須</span>
			<input type="text" name="when" value="{{ session('form.when') }}" class="mt-1">
		</label>

		@if ($errors->has('first_handling'))
			<span class="invalid-feedback" role="alert">
				<strong>{{ $errors->first('first_handling') }}</strong>
			</span>
		@endif
		<label class="mb-4">初期対応 <span class="badge badge-danger">必須</span>
			<textarea name="first_handling" cols="30" rows="10" class="mt-1">{{ session('form.first_handling') }}</textarea>
		</label>

		@if ($errors->has('situation'))
			<span class="invalid-feedback" role="alert">
				<strong>{{ $errors->first('situation') }}</strong>
			</span>
		@endif
		<label class="mb-4">どんな状態 <span class="badge badge-danger">必須</span>
			<textarea name="situation" cols="30" rows="10" class="mt-1">{{ session('form.situation') }}</textarea>
		</label>

		<div class="mb-4">どうするか <span class="badge badge-danger">必須</span> <span id="order-type-error"></span>
			<label class="px-3 mt-1"><input type="radio" name="order_type_id" value="1" {{ session('form.order_type_id') === '1' ? 'checked' : '' }}>修理をしてほしい</label>
			<label class="px-3"><input type="radio" name="order_type_id" value="2" {{ session('form.order_type_id') === '2' ? 'checked' : '' }} id="order-type-order">部品を送ってほしい</label>
            <div id="order-reasons" class="order-reasons px-5">
                <div>発注理由 <span class="badge badge-danger">必須</span> <span id="order-reason-error"></span></div>
                <div class="px-1">
                    @foreach ( $order_reasons as $order_reason )
                        <label class="px-2 mt-1"><input type="checkbox" name="order_reason_ids[]" value="{{ $order_reason->order_reason_id }}" @if ( session()->has('form.order_reason_ids') && in_array( $order_reason->order_reason_id, session('form.order_reason_ids') ) ) checked @endif> {{ $order_reason->reason }}</label>
                    @endforeach
                </div>
            </div>
			<label class="px-3"><input type="radio" name="order_type_id" value="3" {{ session('form.order_type_id') === '3' ? 'checked' : '' }}>調査してほしい</label>
			<label class="px-3"><input type="radio" name="order_type_id" value="4" {{ session('form.order_type_id') === '4' ? 'checked' : '' }} id="order-type-other">その他<input type="text" name="order_type_other_text" value="{{ session('form.order_type_other_text') }}" id="order-type-other-text" class="order-type-other-text"></label>
            
		</div>

		@php
			$i = 0;
			$j = 1;
		@endphp
		@if ( count($errors) > 0 && old('hidden_image.'.$i) )
			@while ( old('hidden_image.'.$i) )
				<div class="mb-4">写真{{ $j }} <span class="badge badge-danger">必須</span>
					@if ($j === 1)全体の写真を写してください
					@elseif ($j === 2)細部の写真を写してください
					@elseif ($j === 3)型番の写真を写してください
					@endif
					@if ($errors->has('image_'.$j))
						<div>
							<span class="invalid-feedback" role="alert">
								<strong>{{ $errors->first('image_'.$j) }}</strong>
							</span>
						</div>
					@endif
					<div class="pl-3 my-2"><input type="file" name="image_{{ $j }}" class="image" accept="image/jpeg"></div>
					<div class="w-75 mx-auto text-center">
						<img src="{{ old('hidden_image.'.$i) }}" id="preview-image_{{$j}}" class="preview" alt="プレビュー画像{{$j}}">
						<input type="hidden" name="hidden_image[]" value="{{ old('hidden_image.'.$i) }}">
					</div>
				</div>
				@php
					$i++;
					$j++;
				@endphp
			@endwhile			
		@else
			@for ( $i = 1; $i <= 3; $i++ )
				<div class="mb-4">写真{{ $i }} <span class="badge badge-danger">必須</span>
					@if ($i === 1)全体の写真を写してください
					@elseif ($i === 2)細部の写真を写してください
					@elseif ($i === 3)型番の写真を写してください
					@endif
					@if ($errors->has('image_'.$i))
						<div>
							<span class="invalid-feedback" role="alert">
								<strong>{{ $errors->first('image_'.$i) }}</strong>
							</span>
						</div>
					@endif
					<div class="pl-3 my-2"><input type="file" name="image_{{ $i }}" class="image" accept="image/jpeg"></div>
					<div class="w-75 mx-auto text-center">
						<img src="{{ asset('img/sample_image_'.$i.'.png') }}" id="preview-image_{{ $i }}" class="preview" alt="プレビュー画像{{ $i }}">
						<canvas id="canvas_image_{{ $i }}" class="canvas" hidden></canvas>
					</div>
				</div>
			@endfor
		@endif
		<button type="button" class="btn btn-sm btn-add-img">+写真追加</button>

	</fieldset>
	
</form>

@endsection

@section('footer-button')
	<button type="button" onClick="history.back()" class="back">戻る</button>
	<button type="submit" form="form-add" class="btn-confirm">入力内容を<br>確認する</button>
@endsection

@push('scripts')
    <script type="text/javascript" src="{{ asset('/js/jquery.validate.min.js') }}"></script>
    <script>
		$(function() {
            
            //「発注理由」＆「その他」入力欄表示
            if ($('#order-type-order').prop('checked')) {
                $('#order-reasons').show();
            }
            if ($('#order-type-other').prop('checked')) {
                $('#order-type-other-text').show();
            }
            $('input[name="order_type_id"]').change(function () {
                
                if ($('#order-type-order').prop('checked')) {
                    $('#order-reasons').show();
                } else {
                    $('input[name="order_reason_ids[]"]').prop('checked', false);
                    $('#order-reasons').hide();
                }
                
                if ($('#order-type-other').prop('checked')) {
                    $('#order-type-other-text').show();
                } else {
                    $('#order-type-other-text').val('').hide();
                    $('#order-type-other-text-error').remove();
                }
                
            });
            
            //写真選択時プレビュー表示
			$(document).on('change', '.image', function(e) {

				const file      = e.target.files[0];
                const input     = $(this);
                const inputName = input.attr('name');
                const preview   = $('#preview-' + inputName);
                
                // ファイル選択後に選び直す際何も選ばずキャンセルすると前のプレビューが残ったままになるのでリセット入れとく
                if ( !file ) {
                    if ( inputName === 'image_1' || inputName === 'image_2' || inputName === 'image_3' ) {
                        let imgName = 'sample_' + inputName + '.png';
                        preview.attr('src', '{!! asset("img/'+imgName+'") !!}');
                    } else {
                        preview.attr('src', '{{ asset('img/sample.png') }}');
                    }
                    return;
                }

				// 画像ファイルかチェック
				if ( file['type'] != 'image/jpeg' && file['type'] != 'image/png' && file['type'] != 'image/gif' ) {
					alert('画像ファイルを選択してください');
					input.val('');
                    return;
				}
                    
                const fr  = new FileReader();
                fr.onload = function() {

                    // リサイズしてcanvasに描画
                    const image  = new Image();

                    image.onload = function() {

                        const w      = 750;
                        const ratio  = w / image.width;
                        const h      = image.height * ratio;
                        const canvas = $('#canvas_' + inputName);
                        canvas.attr('width', w);
                        canvas.attr('height', h);

                        const ctx = canvas[0].getContext('2d');
                        ctx.drawImage(image, 0, 0, w, h);

//                        console.log('元のサイズ： ' + file['size']);

                        const originalBinary = canvas[0].toDataURL('image/jpeg');

                        preview.attr('src', originalBinary); // canvasの画像をプレビューに表示

                        const originalBlob = base64ToBlob(originalBinary);

//                        console.log('リサイズ後のサイズ： ' + originalBlob['size']);

                        // 画像真っ黒状態のチェック 真っ黒だと容量が極端に小さい(8000byte未満)
                        if ( originalBlob['size'] < 8000 ) {
                            input.val('');
                            alert('エラーが発生しました。\nもう一度ファイルを選択してください。');
                            if ( inputName === 'image_1' || inputName === 'image_2' || inputName === 'image_3' ) {
                                let imgName = 'sample_' + inputName + '.png';
                                preview.attr('src', '{!! asset("img/'+imgName+'") !!}');
                            } else {
                                preview.attr('src', '{{ asset('img/sample.png') }}');
                            }
                        }
                    }

                    image.src = fr.result; // canvasで使用するための画像読み込み
                };

                fr.readAsDataURL(file); // input(type='file')タグで選択された画像の読み込み、resultにDataURLの文字列が入る

			});
			
            //写真追加
			i = 4;
			$('.btn-add-img').on('click', function() {
				let html  = '<div class="mb-4">写真' + i + ' 追加の写真を写してください';
					html += '<div class="pl-3 my-2"><input type="file" name="image_' + i + '" class="image" accept="image/jpeg"></div>';
					html += '<div class="w-75 mx-auto text-center">';
					html += '<img src="{{ asset('img/sample.png') }}" id="preview-image_' + i + '" class="preview" alt="プレビュー画像' + i + '">';
					html += '<canvas id="canvas_image_' + i + '" class="canvas" hidden></canvas>';
					html += '</div>';
					html += '</div>';
				$(this).before(html);
				i++;
			});

		});
		
		$('#form-add').validate({
			rules: {
				applicant_name: {
					required: true
				},
				equipment: {
					required: true
				},
				manufacturer: {
					required: true
				},
				model_number: {
					required: true
				},
				when: {
					required: true
				},
				first_handling: {
					required: true
				},
				situation: {
					required: true
				},
				order_type_id: {
					required: true
				},
                'order_reason_ids[]': {
                    required: '#order-type-order:checked'
                },
                order_type_other_text: {
                    required: '#order-type-other:checked'
                },
				image_1: {
					required: true
				},
				image_2: {
					required: true
				},
				image_3: {
					required: true
				},
                @if ( $role === 'BM' )
                shop_id: {
                    required: true
                },
                @endif
			},
			messages: {
				applicant_name: {
					required: "入力してください"
				},
				equipment: {
					required: "入力してください"
				},
				manufacturer: {
					required: "入力してください"
				},
				model_number: {
					required: "入力してください"
				},
				when: {
					required: "入力してください"
				},
				first_handling: {
					required: "入力してください"
				},
				situation: {
					required: "入力してください"
				},
				order_type_id: {
					required: "選択してください"
				},
				'order_reason_ids[]': {
					required: "選択してください"
				},
                order_type_other_text: {
                    required: '入力してください'
                },
				image_1: {
					required: "選択してください"
				},
				image_2: {
					required: "選択してください"
				},
				image_3: {
					required: "選択してください"
				},
                @if ( $role === 'BM' )
                shop_id: {
                    required: "選択してください"
                },
                @endif
			},
			errorElement: 'span',
			errorPlacement: function (error, element) {
				error.addClass('invalid-feedback');
                if (element.attr("name") == "order_reason_ids[]" ) {
                    error.appendTo("#order-reason-error");
                } else if ( element.attr("name") == "order_type_id" ) {
                    error.appendTo("#order-type-error");
                } else {
                    element.before(error);
                }
			},
			highlight: function (element, errorClass, validClass) {
				$(element).addClass('is-invalid');
			},
			unhighlight: function (element, errorClass, validClass) {
				$(element).removeClass('is-invalid');
			},
			submitHandler: function(form) {
                
                const $btnConfirm = $('.btn-confirm');
                const $loading    = $('#loading');
				
				$btnConfirm.prop('disabled', true);
				$loading.fadeIn();
				let formData = new FormData(form);
				let i = 1;
                $('.image').each(function() {

                    const input     = $(this);
                    const inputName = input.attr('name');
                    
                    formData.delete(inputName); // ファイルが無くてもinputがあればformDataに入ってくるので一旦削除
                        
                    if ( input[0].files[0] ) { // ファイルがあるかチェック
                        
						// canvasを取得
						const canvasImage = $('#canvas_' + inputName).get(0);
                        
						// canvasからデータをDataURLで取得
						const originalBinary = canvasImage.toDataURL('image/jpeg');

						// blobに変換
						const originalBlob = base64ToBlob(originalBinary);

						//blobデータをアップロード用blobに設定
						let uploadBlob = originalBlob;

						//blobデータ容量が2MB以上かチェック
						if ( 2000000 <= originalBlob['size'] ) {
							//2MB以下に落とす
							const capacityRatio = 2000000 / originalBlob['size'];
							const processingBinary = canvasImage.toDataURL('image/jpeg', capacityRatio);
							uploadBlob = base64ToBlob(processingBinary);
						}

						// ファイル名取得
						const uploadFile = input.prop('files')[0];
						const fileName   = uploadFile['name'];
						
						// formDataに追加
						formData.set('image_' + i, uploadBlob, fileName);
                        i++;
						
						//formにinput追加
//						const fileOfBlob = new File([uploadBlob], fileName, {type: 'image/jpeg'});
//						const input      = document.createElement('input');
//						input.type       = 'file';
//						input.files      = createFileList(fileOfBlob);
//						input.name       = 'image_' + i;
//						input.hidden     = true;
//						form.append(input);
                    }
                });

//				for (let value of formData.entries()) { 
//					console.log(value); 
//				}
				
                $.ajax({
                    url: '{{ url('check-server-communication') }}',
                    type: 'GET',
                })
                .done(function() {
                    $.ajax({
                        url: '{{ url('/maintenance/add/confirm') }}',
                        type: 'POST',
                        cache: false,
                        dataType: 'json',
                        processData: false,
                        contentType: false,
                        data: formData,
                    })
                    .done(function(response) {
//                        console.log(response);
                        $btnConfirm.prop('disabled', false);
                        window.location.href = response.url;
                    })
                    .fail(function(xhr) {
                        console.log(xhr);
                    });
                })
                .fail(function(xhr) {
//                    console.log(xhr);
                    alert('通信エラーが発生しました。\nWi-Fi電波が届く場所へ移動して再度お試しください。');
                    $btnConfirm.prop('disabled', false);
                    $loading.fadeOut();
                });
            
				return false;

//				form.submit();

			}
		});

		function base64ToBlob(base64) {
			var base64Data = base64.split(',')[1], // Data URLからBase64のデータ部分のみを取得
				  data = window.atob(base64Data), // base64形式の文字列をデコード
				  buff = new ArrayBuffer(data.length),
				  arr = new Uint8Array(buff),
				  blob,
				  i,
				  dataLen;
			// blobの生成
			for (i = 0, dataLen = data.length; i < dataLen; i++) {
				arr[i] = data.charCodeAt(i);
			}
			blob = new Blob([arr], {type: 'image/jpeg'});
			return blob;
		}
		
		//▼▼▼▼▼ここから追加▼▼▼▼▼
		function createFileList(a) {
				a = [].slice.call(Array.isArray(a) ? a : arguments)
			console.log('a:' + a);
				for (var c, b = c = a.length, d = !0; b-- && d;) d = a[b] instanceof File
			console.log('c:' + c);
				if (!d) throw new TypeError('expected argument to FileList is File or array of File objects')
			b = (new ClipboardEvent('')).clipboardData;
			console.log(b); // null
			b = new DataTransfer;
			console.log(b); // TypeError: Illegal constructor
				for (b = (new ClipboardEvent('')).clipboardData || new DataTransfer; c--;) b.items.add(a[c])
			console.log(b);
				return b.files
		}
		//▲▲▲▲▲ここまで追加▲▲▲▲▲

	</script>
@endpush