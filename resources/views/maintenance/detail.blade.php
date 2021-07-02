@extends('layouts.layout')
@section('title', 'メンテナンス申請 詳細')
@section('content')

<div class="content-detail">

	<div class="maintenance-code"></div>
	
	<form action="" class="form-detail">
		
		<fieldset>
			<legend>状況</legend>
			<table class="table">
				<tr>
					<th>ステータス</th>
					<td class="status"></td>
				</tr>
				<tr class="comment-row">
					<th>コメント</th>
					<td class="comment"></td>
				</tr>
				<tr>
					<th>更新日</th>
					<td class="updated-at"></td>
				</tr>
				<tr>
					<th>更新者</th>
					<td class="entered-by"></td>
				</tr>
			</table>
		</fieldset>
		
		@if ( '一般社員' === $role )
		<fieldset>
			<legend>申請者情報</legend>
			<table class="table">
				<tr>
					<th>申請者コード</th>
					<td class="applicant-code"></td>
				</tr>
				<tr>
					<th>氏名</th>
					<td class="applicant-name"></td>
				</tr>
			</table>
		</fieldset>
		@endif
		
		@if ( 'BM' === $role )
		<fieldset class="shop-info">
			<legend>店舗情報</legend>
			<table class="table">
				<tr>
					<th>店舗コード</th>
					<td class="shop-code"></td>
				</tr>
				<tr>
					<th>店舗名</th>
					<td class="shop-name"></td>
				</tr>
			</table>
		</fieldset>
		@endif
		
		<fieldset>
			<legend>申請内容</legend>

			<table class="table table-request">
				<tbody></tbody>
			</table>
		</fieldset>
		
		@if ( 'BM' === $role )
		<fieldset>
			<legend>申請者情報</legend>
			<table class="table">
				<tr>
					<th>申請者コード</th>
					<td class="applicant-code"></td>
				</tr>
				<tr>
					<th>氏名</th>
					<td class="applicant-name"></td>
				</tr>
			</table>
		</fieldset>
		@endif
		
	</form>

	<!-- コメントブロック -->
	@if ( 'BM' === $role && ('BM承認待ち' === $progress_status || 'BM保留' === $progress_status) )
		<form method="post" id="form-comment" class="form-sendback">
			{{ csrf_field() }}
            <span id="comment-error"></span>
			<label>コメント ※却下・保留・差戻しの際は必ず入力してください
				<textarea class="comment" name="comment" cols="30" rows="10"></textarea>
			</label>
			<input type="hidden" name="entered_by" value="{{ Auth::user()->user_id }}">
		</form>
	@endif
	<!-- /コメントブロック -->

</div><!-- .content-detail -->
	
@endsection

@section('footer-button')
	<button type="button" onClick="history.back()" class="back">戻る</button>

	@if ( 'BM' === $role )
		@if ( 'BM承認待ち' === $progress_status )
			<button type="submit" form="form-comment" formaction="{{ url('/api/v1/maintenance') }}/{{ $maintenance_id }}/put/reject" class="btn-reject">却下</button>
			<button type="submit" form="form-comment" formaction="{{ url('/api/v1/maintenance') }}/{{ $maintenance_id }}/put/suspend" class="btn-suspend">保留</button>
			<button type="submit" form="form-comment" formaction="{{ url('/api/v1/maintenance') }}/{{ $maintenance_id }}/put/sendback" class="btn-sendback">差戻</button>
			<button type="submit" form="form-comment" formaction="{{ url('/api/v1/maintenance') }}/{{ $maintenance_id }}/put/approve" class="btn-approve">承認</button>
		@elseif ( 'BM保留' === $progress_status )
			<button type="submit" form="form-comment" formaction="{{ url('/api/v1/maintenance') }}/{{ $maintenance_id }}/put/reject" class="btn-reject">却下</button>
			<button type="submit" form="form-comment" formaction="{{ url('/api/v1/maintenance') }}/{{ $maintenance_id }}/put/sendback" class="btn-sendback">差戻</button>
			<button type="submit" form="form-comment" formaction="{{ url('/api/v1/maintenance') }}/{{ $maintenance_id }}/put/approve" class="btn-approve">承認</button>
		@endif
	@endif
		
	@if ( '一般社員' == $role ) 
			<form method="post" id="form-update">
				{{ csrf_field() }}
			</form>
		@if ( 'BM却下' === $progress_status )
			<button type="submit" form="form-update" formaction="{{ url('/api/v1/maintenance') }}/{{ $maintenance_id }}/put/delete" class="btn-delete">取り下げ</button>
		@elseif ( 'BM差戻し' === $progress_status || '本部差戻し' === $progress_status ) 
			<button type="submit" form="form-update" formaction="{{ url('/api/v1/maintenance') }}/{{ $maintenance_id }}/put/delete" class="btn-delete">取り下げ</button>
			<button type="submit" form="form-update" formaction="{{ url('maintenance') }}/{{ $maintenance_id }}/edit" class="btn-edit">編集</button>
		@endif
	@endif

@endsection

@push('scripts')
<script type="text/javascript" src="{{ asset('/js/jquery.validate.min.js') }}"></script>
<script>
	$(function() {
		$.ajax({
			url: "{{ url('/api/v1/maintenance') }}/{{ $maintenance_id }}",
			type: 'GET',
			cache: false,
			dataType: 'json',
		})
		.done(function(maintenance) {
			console.log('申請詳細', maintenance);
			
			$('.maintenance-code').text('No. ' + maintenance['maintenance_code']);
			
			$('.status').text(maintenance['progress']['status']);
			
			const maintenance_progress = maintenance['maintenance_progress'];
			console.log(maintenance_progress.length);
			if ( maintenance_progress.length ) {
				const latest = maintenance_progress.slice(-1)[0];
				console.log(latest);
				$('.updated-at').text(latest['updated_at']);
				$('.entered-by').text(latest['entered_by']['name']);
				if(latest['comment']){

					$('.comment-row .comment').text(latest['comment']);

				}else{
					$('.comment-row').css('display',"none");
				}
			}else{
				$('.comment-row').css('display',"none");
			}
			
			$('.shop-info .shop-code').text(maintenance['shop']['shop_code']);
			$('.shop-info .shop-name').text(maintenance['shop']['shop_name'] + '店');
			
			let row = '<tr>';
			row += '<th>何が</th>';
			row += '<td>' + maintenance['equipment'] + '</td>';
			row += '</tr>';
			row += '<tr>';
			row += '<th>メーカー名</th>';
			if ( null !== maintenance['manufacturer'] ) {
				row += '<td>' + maintenance['manufacturer'] + '</td>';
			} else {
				row += '<td>不明</td>';
			}
			row += '</tr>';
			row += '<tr>';
			row += '<th>型式・品番</th>';
			if ( null !== maintenance['model_number'] ) {
				row += '<td>' + maintenance['model_number'] + '</td>';
			} else {
				row += '<td>不明</td>';
			}
			row += '</tr>';
			row += '<tr>';
			row += '<th>いつから</th>';
			row += '<td>' + maintenance['when'] + '</td>';
			row += '</tr>';
			row += '<tr>';
			row += '<th>どんな状態</th>';
			row += '<td>' + maintenance['situation'] + '</td>';
			row += '</tr>';
			row += '<tr>';
			row += '<th>どうする</th>';
            
            const order_type = maintenance['order_type']['type'];
            if ( '発注依頼' === order_type ) {
                let reasons = '';
                maintenance['order_reasons'].forEach( order_reason => {
                   reasons += '<span class="reason">' + order_reason['reason'] + '</span>';
                });
                                                     
                row += '<td>' + order_type + '（理由：' + reasons +  ')</td>';
            } else if ( 'その他' === order_type ) {
                row += '<td>' + maintenance['order_type_other_text'] + '</td>';
            } else {
                row += '<td>' + order_type + '</td>';
            }
			
			row += '</tr>';
			maintenance['maintenance_images'].forEach((image, index) => {
				index++;
				row += '<tr>';
				if ( 1 === index ) {
					row += '<th>写真' + index + '<br>（全体）</th>';
				} else if ( 2 === index ) {
					row += '<th>写真' + index + '<br>（細部）</th>';
				} else if ( 3 === index ) {
					row += '<th>写真' + index + '<br>（型番）</th>';
				} else {
					row += '<th>写真' + index + '</th>';
				}
				row += '<td><img src="{{ url("maintenance/image/$maintenance_id") }}/' + image['file_name'] + '"></td>';
				row += '</tr>';
			});
			$('.table-request tbody').append(row);
			
			$('.applicant-code').text(maintenance['user']['staff_id']);
			$('.applicant-name').text(maintenance['user']['name']);
		})
		.fail(function(xhr) {
			
		})
		.always(function() {
			
		});
		
		$('button[type="submit"]').on('click', function() {

            $(this).toggleClass('on');
            
            if ( $(this).hasClass('btn-reject') || $(this).hasClass('btn-suspend') || $(this).hasClass('btn-sendback') ) {
                                
                $('#form-comment').validate({
                    rules: {
                        comment: {
                            required: true
                        },
                    },
                    messages: {
                        comment: {
                            required: "入力してください"
                        },
                    },
                    errorElement: 'span',
                    errorPlacement: function (error, element) {
                        error.addClass('invalid-feedback');
                        if (element.attr("name") == "comment" ) {
                            error.appendTo("#comment-error");
                        } else {
                            element.before(error);
                        }
                    },
                });
                
                if ( $('#form-comment').valid() ) {
                    
                    $('button[type="submit"]').prop('disabled', true);

                    if($(this).hasClass('btn-reject')){
                        txt = "申請を却下します。";
                    }

                    if($(this).hasClass('btn-suspend')){
                        txt = "申請を保留します。";
                    }

                    if($(this).hasClass('btn-sendback')){
                        txt = "申請を差戻します。";
                    }

                    if(txt){
                        if(!confirm(txt+'\nよろしいですか？')) {
                            $(this).toggleClass('on');
                            $('button[type="submit"]').prop('disabled', false);
                            return false;
                        };            				
                    }

                    $('#loading').fadeIn();
                    var target = $(this).attr('form');
                    var action = $(this).attr('formaction');
                    $('#'+target).attr('action',action);
            		$('#'+target).submit();
                }
                
            } else {
                
                $('button[type="submit"]').prop('disabled', true);
                
                if($(this).hasClass('btn-delete')){
                    txt = "申請を取り下げます。";
                }
                if($(this).hasClass('btn-approve')){
                    txt = "申請を承認します。";
                }
                if($(this).hasClass('btn-edit')){
                    txt = "";
                }

                if(txt){
                    if(!confirm(txt+'\nよろしいですか？')) {
                        $(this).toggleClass('on');
                        $('button[type="submit"]').prop('disabled', false);
                        return false;
                    };
                }
                
                $('#loading').fadeIn();
                var target = $(this).attr('form');
                var action = $(this).attr('formaction');
//                console.log(target);
//                console.log(action);

                $('#'+target).attr('action',action);
                $('#'+target).submit();
            }
            
		});
        
	});
</script>
@endpush
