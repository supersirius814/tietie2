@extends('layouts.layout')
@section('title', 'メンテナンス申請 編集')
@section('content')

<div class="content-edit">
    
    <div class="maintenance-code">{{ $maintenance->maintenance_code }}</div>
	
	<form action="{{ url('/api/v1/maintenance') }}/{{ $maintenance_id }}/put/update" method="post" enctype="multipart/form-data" id="form-update" class="form-update">
		{{ csrf_field() }}

		<legend>申請内容</legend>
		<input type="hidden" name="entered_by" value="{{ Auth::user()->user_id }}">
		
		@if ($errors->has('equipment'))
			<span class="invalid-feedback" role="alert">
				<strong>{{ $errors->first('equipment') }}</strong>
			</span>
		@endif
		<label class="mb-4">何が <span class="badge badge-danger">必須</span>
			<input type="text" name="equipment" value="{{ $maintenance->equipment }}" class="equipment">
		</label>

		@if ($errors->has('manufacturer'))
			<span class="invalid-feedback" role="alert">
				<strong>{{ $errors->first('manufacturer') }}</strong>
			</span>
		@endif
		<label class="mb-4">メーカー名 <span class="badge badge-danger">必須</span>
			<input type="text" name="manufacturer" value="{{ $maintenance->manufacturer }}" class="mt-1 manufacturer">
		</label>
		
		@if ($errors->has('model_number'))
			<span class="invalid-feedback" role="alert">
				<strong>{{ $errors->first('model_number') }}</strong>
			</span>
		@endif
		<label class="mb-4">型式・品番 <span class="badge badge-danger">必須</span>
			<input type="text" name="model_number" value="{{ $maintenance->model_number }}" class="mt-1 model_number">
		</label>

		@if ($errors->has('when'))
			<span class="invalid-feedback" role="alert">
				<strong>{{ $errors->first('when') }}</strong>
			</span>
		@endif
		<label class="mb-4">いつから <span class="badge badge-danger">必須</span>
			<input type="text" name="when" value="{{ $maintenance->when }}" class="mt-1 when">
		</label>

		@if ($errors->has('situation'))
			<span class="invalid-feedback" role="alert">
				<strong>{{ $errors->first('situation') }}</strong>
			</span>
		@endif
		<label class="mb-4">どんな状態 <span class="badge badge-danger">必須</span>
			<textarea name="situation" cols="30" rows="10" class="mt-1 situation">{{ $maintenance->situation }}</textarea>
		</label>

		<div class="mb-4 order-type-block">どうするか <span class="badge badge-danger">必須</span>
			<label class="pl-3 mt-1"><input type="radio" name="order_type_id" value="1" @if ($maintenance->order_type_id === 1) checked @endif>修理をしてほしい</label>
			<label class="pl-3"><input type="radio" name="order_type_id" value="2" @if ($maintenance->order_type_id === 2) checked @endif id="order-type-order">部品を送ってほしい</label>
            <div id="order-reasons" class="order-reasons px-5">
                <div>発注理由 <span class="badge badge-danger">必須</span> <span id="order-reason-error"></span></div>
                <div class="px-1">
                    @foreach ( $order_reasons as $order_reason )
                        <label class="px-2 mt-1"><input type="checkbox" name="order_reason_ids[]" value="{{ $order_reason->order_reason_id }}" @if ( in_array( $order_reason->order_reason_id, $order_reason_ids ) ) checked @endif> {{ $order_reason->reason }}</label>
                    @endforeach
                </div>
            </div>
			<label class="pl-3"><input type="radio" name="order_type_id" value="3" @if ($maintenance->order_type_id === 3) checked @endif>調査してほしい</label>
			<label class="pl-3"><input type="radio" name="order_type_id" value="4" @if ($maintenance->order_type_id === 4) checked @endif id="order-type-other">その他 <input type="text" name="order_type_other_text" value="{{ $maintenance->order_type_other_text }}" id="order-type-other-text" class="order-type-other-text"></label>
		</div>

		@foreach( $images as $image )
		
			<div class="mb-4 maintenance-image-block">写真{{ $loop->iteration }}
				@if ( $loop->index < 3 ) <span class="badge badge-danger">必須</span> @endif
				@if ( $loop->iteration === 1 ) 全体の写真を写してください @endif
				@if ( $loop->iteration === 2 ) 細部の写真を写してください @endif
				@if ( $loop->iteration === 3 ) 型番の写真を写してください @endif
				<input type="hidden" name="maintenance_image_id_image_{{ $loop->iteration }}" value="{{ $image->maintenance_image_id }}">
				<input type="hidden" name="image_{{ $loop->iteration }}" value="{{ $image->file_name }}" class="file-name">
				<div class="mt-2 w-75 mx-auto text-center"><img src="{{ url("maintenance/image/$maintenance_id/$image->file_name") }}" id="preview-image_{{ $loop->iteration }}" class="preview" alt="メンテナンス申請画像"></div>
				<button type="button" class="btn-delete-img"><i class="fas fa-times"></i></button>
			</div>
		
		@endforeach
		
		<button type="button" class="btn btn-sm btn-add-img">+写真追加</button>
	
	</form>
		
</div>

@endsection

@section('footer-button')
	<button type="button" onClick="history.back()" class="back">戻る</button>
	<button type="submit" form="form-update" class="btn-update">保存して再申請</button>
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
//                    $('#order-reason-error').remove();
                }
                
                if ($('#order-type-other').prop('checked')) {
                    $('#order-type-other-text').show();
                } else {
                    $('#order-type-other-text').val('').hide();
                    $('#order-type-other-text-error').remove();
                }
                
            });
            
            //写真削除
			$(document).on('click', '.btn-delete-img', function() {
				const imageId = $(this).siblings().children('img').attr('id');
				const inputName = imageId.split('-')[1];
				const inputHtml = '<div class="pl-3 my-2"><input type="file" name="' + inputName + '" class="image" accept="image/jpeg"></div>'		
				$(this).siblings('div').before(inputHtml).remove();
//				$(this).siblings('.file-name').val('');
				$(this).siblings('.file-name').remove();
				$(this).remove();
			});

            //写真選択時プレビュー表示
			$(document).on('change', '.image', function(e) {
				const file  = e.target.files[0];
                const input = $(this);
                
                if ( !file ) { // 一旦ファイル選択後、再びファイルを選択し直す時に何も選択しなかった場合
                    input.parent().next().remove();
                    return;
                }

				// 画像ファイルかチェック
				if ( file['type'] != 'image/jpeg' && file['type'] != 'image/png' && file['type'] != 'image/gif' ) {
					alert('画像ファイルを選択してください');
					input.val('');
                    return;
				}
                    
                const inputName = input.attr('name');

                input.parent().next().remove();

                const fr = new FileReader();
                fr.onload = function() {

                    const image = new Image();
                    image.onload = function() {

                        input.parent().after('<div class="w-75 mx-auto text-center"><canvas id="' + inputName + '" class="canvas" hidden></canvas></div>');

                        const w = 750;
                        const ratio = w / image.width;
                        const h = image.height * ratio;
                        const canvas = $('#' + inputName);
                        canvas.attr('width', w);
                        canvas.attr('height', h);

                        const ctx = canvas[0].getContext('2d');
                        ctx.drawImage(image, 0, 0, w, h);

                        const originalBinary = canvas[0].toDataURL('image/jpeg');

                        const preview = '<img src="' + originalBinary + '" id="preview-' + inputName + '" class="preview" alt="メンテナンス申請プレビュー画像">';
                        input.parent().next().append(preview);

                        const originalBlob = base64ToBlob(originalBinary);
                        if ( originalBlob['size'] < 8000 ) {
                            input.val('');
                            alert('エラーが発生しました。\nもう一度ファイルを選択してください。');
                            input.parent().next().remove();
                        }
                    }
                    image.src = fr.result;

                };
                fr.readAsDataURL(file);
		
			});

			$('.btn-add-img').on('click', function() {
				let i = $('.maintenance-image-block').length + 1;
				let html  = '<div class="mb-4 maintenance-image-block">写真' + i + ' 追加の写真を写してください';
					html += '<div class="pl-3 my-2"><input type="file" name="image_' + i + '" class="image" accept="image/jpeg"></div>';
					html += '</div>';
				$(this).before(html);
			});

			$('#form-update').validate({
				rules: {
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
					situation: {
						required: true
					},
					order_type_id: {
						required: true
					},
                     'order_reason_ids[]': {
                        required: '#order-type-order:checked',
                    },
                    order_type_other_text: {
                        required: '#order-type-other:checked',
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
				},
				messages: {
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
                        required: '入力してください',
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
				},
				errorElement: 'span',
				errorPlacement: function (error, element) {
					error.addClass('invalid-feedback');
                    if (element.attr("name") == "order_reason_ids[]" ) {
                        error.appendTo("#order-reason-error");
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
					$('.btn-update').prop('disabled', true);
					$('#loading').fadeIn();

					let formData = new FormData(form);
//					for ( let value of formData.entries() ) {
//						console.log(value);
//					}

					const canvasLength = $('.canvas').length;

					if ( canvasLength ) {
						$('.canvas').each(function() {
							const canvasImage    = $(this).get(0);
							const inputName      = $(this).attr('id');
							const originalBinary = canvasImage.toDataURL('image/jpeg');
							const originalBlob   = base64ToBlob(originalBinary);
							let uploadBlob       = originalBlob;
							
							if ( 2000000 <= originalBlob['size'] ) {
								const capacityRatio = 2000000 / originalBlob['size'];
								const processingBinary = canvasImage.toDataURL('image/jpeg', capacityRatio);
								uploadBlob = base64ToBlob(processingBinary);
							}
							
							const uploadFile = $('input[name="' + inputName + '"]').prop('files')[0];
							const fileName = uploadFile['name'];
							
							formData.set(inputName, uploadBlob, fileName);
						});
					}
//					for ( let value of formData.entries() ) {
//						console.log(value);
//					}
					
					$.ajax({
						url: '{{ url('/api/v1/maintenance') }}/{{ $maintenance_id }}/put/update',
						type: 'POST',
						cache: false,
						dataType: 'json',
						processData: false,
						contentType: false,
						data: formData,
					})
					.done(function(response) {
						window.location.href = response.url;
					})
					.fail(function(xhr) {
						
					})
					.always(function() {
						
					});
					
					return false;
					
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
			
		});
	</script>
@endpush
