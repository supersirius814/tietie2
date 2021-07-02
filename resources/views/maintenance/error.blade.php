@extends('layouts.layout')

@section('title', $page_title)

@section('content')

<div class="pt-4 text-center">
	<p>{{ $text }}</p>
	<div class="mt-5"><a href="{{ url('maintenance') }}" class="btn btn-primary">メンテナンス一覧へ</a></div>
</div>

@endsection
