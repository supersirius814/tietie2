@extends('mail.common')

@section('content')

<!-- BM用 -->
@if (isset($data['shops']))
    <p>{{ $data['now'] }}現在<br>
        次の担当店舗からのメンテナンス申請が、{{ $data['hours'] }}時間以上承認待ちになっています。</p>
    
    @if ($data['type'] === '申請処理状況通知')
        <p>内容を確認の上、早めの対応をお願いします。</p>
    @else
        <p>至急内容を確認の上、対応をお願いします。</p>
    @endif
        @foreach ( $data['shops'] as $shop )
            ・{{ $shop['shop_name'] }}店　{{ $shop['backlogged_maintenance_count'] }}件<br>
        @endforeach
@endif
<!-- /BM用 -->

<!-- DM・本部用 -->
@if (isset($data['blocks']))
    <p>{{ $data['now'] }}現在<br>
        次の各ブロックのメンテナンス申請が{{ $data['hours'] }}時間以上BM承認待ちステータスから更新されていません。</p>
    @foreach ( $data['blocks'] as $block )
        ・{{ $block['block_name'] }}　{{ $block['backlogged_maintenance_count'] }}件<br>
    @endforeach
    
    @if ($data['type'] === '申請処理状況通知')
        <p>各ブロックマネージャーに状況確認を行ってください。</p>
    @else
        <p>至急、各ブロックマネージャーに状況確認を行ってください。</p>
    @endif
@endif
<!-- /DM・本部用 -->

<p>システムログインはこちらから <a href="{{ secure_url('/') }}">{{ secure_url('/') }}</a></p>

@endsection