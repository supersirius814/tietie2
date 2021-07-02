@extends('mail.common')

@section('content')

<p>{{ $data['shop_code'] }} {{ $data['shop_name'] }}店より<br>
メンテナンス申請の再申請が届いています。</p>

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
		<th>ステータス</th>
		<td>{{ $data['progress_status'] }}</td>
	</tr>
	<tr>
		<th>担当BM</th>
		<td>
            @foreach ($data['BM'] as $BM)
                @if ($loop->first)
                    {{ $BM->name }}
                @else
                    ・{{ $BM->name }}
                @endif
            @endforeach
        </td>
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
		<th>状態</th>
		<td>{{ $data['situation'] }}</td>
	</tr>
	<tr>
		<th>どうする</th>
		<td>{{ $data['order_type'] }}</td>
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