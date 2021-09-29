@extends('layouts.app')
@section('title', 'ログイン | メンテナンス申請システム')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">ログイン</div>
                @if (App::environment('production'))
                    プレ環境で動作中
                @elseif (App::environment('staging'))
                    ステージング環境で動作中
                @else
                    ローカル環境で動作中
                @endif

                <div class="card-body">
										
					@if (session()->has('error_msg'))
						<div class="alert alert-danger alert-dismissible">{!! session('error_msg') !!}</div>
					@endif
					
                    <form method="POST" name="loginForm" action="{{ route('login') }}">
                        {{ csrf_field() }}

                        <div class="form-group row">
                            <label for="business_type" class="col-md-4 col-form-label text-md-right">業態</label>

                            <div class="col-md-6">
								<select name="business_category" id="business_category" class="form-control{{ $errors->has('business_category') ? ' is-invalid' : '' }}">
									<option value="">選択してください</option>
									@foreach ( $business_categories as $business_category )
										<option value="{{ $business_category['business_category_id'] }}" @if ( old('business_category') == $business_category['business_category_id']) selected @endif>{{ $business_category['business_category'] }}</option>
									@endforeach
								</select>

                                @if ($errors->has('business_category'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('business_category') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="staff_id" class="col-md-4 col-form-label text-md-right">従業員コード</label>

                            <div class="col-md-6">
                                <input id="staff_id" type="tel" style="ime-mode: inactive" pattern="\d*" class="form-control{{ $errors->has('staff_id') ? ' is-invalid' : '' }}" name="staff_id" value="{{ old('staff_id') }}" autocomplete="id" autofocus>

                                @if ($errors->has('staff_id'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('staff_id') }}</strong>
                                    </span>
                                @endif
                            </div>
                            
                            <div class="col-md-6 offset-md-4 mt-2" style="font-size: 90%;">店舗の方は店舗コードの頭に「00」を付け<br>
                                ６桁入力してください<br>例：店舗コード：1234<br>　　　　　　↓<br>　　従業員コード：001234</div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="shop_code" class="col-md-4 col-form-label text-md-right">店舗コード</label>

                            <div class="col-md-6">
                                <input id="shop_code" type="tel" style="ime-mode: inactive" pattern="\d*" class="form-control{{ $errors->has('shop_code') ? ' is-invalid' : '' }}" name="shop_code" value="{{ old('shop_code') }}" autocomplete="id" autofocus>

                                @if ($errors->has('shop_code'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('shop_code') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>


<!--						<input id="password" type="hidden" class="form-control" name="password" value="aaaa">-->

						@if (session()->has('canLogin'))
							<input type="hidden" id="canLogin" name="canLogin" value="true">
						@endif
						
                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4 text-right">
                                <button type="submit" class="btn btn-primary">
                                    ログイン
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function(event) { 
        let cookies = document.cookie;
        let business_category_id = getCookie(cookies,'business_category_id');
        let $business_category = document.getElementById("business_category");

        if(business_category_id){
            setSelectedIndex($business_category, business_category_id);
        }
    });
    function setSelectedIndex(s, v) {
        for ( var i = 0; i < s.options.length; i++ ) {
            s.options[i].selected = true;
            s.selectedIndex = i;
            if ( s.options[i].value == v ) {
                return;
            }
        }
    }
    function getCookie(cookies, name){
        let c = new RegExp(name + "=[^;]+").exec(cookies);
        return c ? c[0].replace(name + '=', ''): null;
    }

</script>
@if (session()->has('canLogin'))
<script>
	const inputCanLogin = document.getElementById('canLogin');
	let shopName = '';
	@if (session()->has('shop_name'))
		shopName = '{{ session('shop_name') }}店\n';
	@endif
	const submit = window.confirm(shopName + '{{ session('staff_name') }} でログインします。\nよろしいですか？');
	if ( submit ) {
		inputCanLogin.value = true;
		document.loginForm.submit();
	} else {
		inputCanLogin.value = false;
	}
</script>
@endif
@endsection
