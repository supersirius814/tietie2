@extends('mail.common')

@section('content')

<p>{{ $data['shop_code'] }} {{ $data['shop_name'] }}店のメンテナンス申請が承認されました。</p>

<p>問合せ中へのステータス変更はこちら→  <a href="{{ url('api/v1/maintenance/'.$data['maintenance_id'].'/changeprogress?progress_id=22') }}">問合せ中</a></p>
<p>本部差戻しへのステータス変更はこちら→  <a href="{{ url('api/v1/maintenance/'.$data['maintenance_id'].'/changeprogress?progress_id=7') }}">本部差戻し</a></p>
<p>依頼済みへのステータス変更はこちら→  <a href="{{ url('api/v1/maintenance/'.$data['maintenance_id'].'/changeprogress?progress_id=10') }}">依頼済み</a></p>

<table>
	<thead>
    <tr>
        <th></th>
        <th style="text-align: center;">内容</th>
    </tr>
	</thead>
	<tbody>
	<tr>
		<th>メンテNo.</th>
		<td>{{ $data['maintenance_code'] }}</td>
	</tr>
	<tr>
		<th>状態</th>
		<td>{{ $data['situation'] }}</td>
	</tr>
	<tr>
		<th>何が</th>
		<td>{{ $data['equipment'] }}</td>
	</tr>
	<tr>
		<th>メーカー名</th>
		<td>{{ $data['manufacturer'] }}</td>
	</tr>
	<tr>
		<th>型式・品番</th>
		<td>{{ $data['model_number'] }}</td>
	</tr>
	<tr>
		<th>いつから</th>
		<td>{{ $data['when'] }}</td>
	</tr>
	<tr>
		<th>どうする</th>
		<td>{{ $data['order_type'] }}</td>
	</tr>
	<tr>
		<th>ステータス</th>
		<td>
		@if ( '本部受付前' === $data['progress_status'] )
			BM承認済（本部受付前）
		@else
			{{ $data['progress_status'] }}
		@endif
		</td>
	</tr>
	<tr>
		<th>コメント</th>
		<td>{{ $data['comment'] }}</td>
	</tr>
	<tr>
		<th>更新者</th>
		<td>{{ $data['updater']->name }}<br>{{ $data['updater']->email }}</td>
	</tr>
	</tbody>
</table>
<table>
	<tr>
		<th>申請者 氏名</th>
		<td>{{ $data['applicant_user']->name }}</td>
	</tr>
</table>
@endsection