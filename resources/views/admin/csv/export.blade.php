@extends('admin.layout')
@section('title', 'CSVエクスポート')

@section('content')

<div class="row mb-5">
	<form action="{{ url('/api/v1/admin/csv/export') }}" method="post">
		<select name="table">
			<option value="users">従業員情報</option>
			<option value="shops">店舗情報</option>
			<option value="districts">ディストリクト情報</option>
			<option value="blocks">ブロック情報</option>
			<option value="clients">お取引先様情報</option>
		</select>
		<button type="submit" class="btn btn-outline-primary btn-sm">エクスポート</button>
	</form>
</div>

@endsection
