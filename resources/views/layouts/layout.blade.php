<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title')</title>
<!--	<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">-->
	<link rel="stylesheet" href="{{ asset('/css/fontawesome.css') }}">
	<link rel="stylesheet" href="{{ asset('/css/app.css') }}">
	<link rel="stylesheet" href="{{ asset('/css/style.css') }}">
	<script type="text/javascript" src="{{ asset('/js/jquery-3.4.1.min.js') }}"></script>
	<script type="text/javascript" src="{{ asset('/js/app.js') }}"></script>
</head>
<body>
<div class="page-wrapper">
	<div id="loading"><span><img src="/img/load_spiner.svg"></span><span class="text">loading…<span></div>
	<header class="header">
		<div class="header-inner">
			
		
			<div class="shop-logo"></div>
			
			@if ( 'BM' === $role )
				<div class="shop-name">{{ $block_name }}</div>
			@else
				<div class="shop-name">{{ $shop['shop_name'] }}</div>
			@endif

			<div class="hamburger touch-hover" id="js-hamburger">
				<span class="hamburger__line hamburger__line--1"></span>
				<span class="hamburger__line hamburger__line--2"></span>
				<span class="hamburger__line hamburger__line--3"></span>
			</div>

			<nav class="nav">
				<div class="user-name"><span class="icon"><i class="fas fa-user-circle"></i></span>{{ Auth::user()->name }} でログイン中です。</div>
				<ul>
					<li><a href="{{ url('maintenance') }}">メンテナンス一覧</a></li>
					<li><a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">ログアウト</a><form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">{{ csrf_field() }}</form></li>
				</ul>
			</nav>
		
		</div>
	</header>
	
	<main class="main">
		<div class="main-inner">
			<h1 class="page-title">@yield('title')</h1>

			@if ( Request::is('maintenance/add*') )
				<ol class="form-step">
					<li @if ( Request::is('maintenance/add') ) class="is-current" @endif>申請内容</li>
					<li @if ( Request::is('maintenance/add/confirm') ) class="is-current" @endif>確認</li>
					<li @if ( Request::is('maintenance/add/completed') ) class="is-current" @endif>完了</li>
				</ol>
			@endif

			@yield('content')
		</div>
	</main>
	
	<footer class="footer">
		<div class="footer-inner">
			
			@yield('footer-button')
			
		</div>
	</footer>
	
</div><!-- .page-wrapper-->
	
@stack('scripts')
<script type="text/javascript" src="{{ asset('/js/functions.js') }}"></script>
</body>
</html>
