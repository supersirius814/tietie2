<!doctype html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>PDF-one-partner</title>
    <style>
    body {
        font-family: ipag;
        font-size: 10px;
    }
    </style>
  </head>
  <body>
      <div class="container">
        <div>
            <table>
                <tr>
                    <td style="padding: 5px 20px; border: 1px solid #000000; font-size: 13px">{{ $order_type['type'] }}</td>
                </tr>
            </table>
        </div>
        <div style="padding-left: 550px;">
            <table style="padding: 5px 7px; border: 1px solid #000000;"> 
                <tr>
                    <td>受付番号:</td>
                    <td>{{ $maintenance_code }}</td>
                </tr>
            </table>
        </div>

        <div style="padding-top: 20px;">
            <table style=" width: 100%; text-align: center">
                <tr>
                    <td colspan="2">{{ $partner_name }}</td>
                    <td>請求先: 
                        @if($accounting_info && count($accounting_info))
                                {{ print_r($accounting_info[0]['partner_name']) }}
                        @endif
                    </td>
                </tr>
                <tr>
                    <td>TEL: {{ $TEL }}</td>
                    <td>FAX: {{ $FAX }}</td>
                    <td>{{ $user['name']  }}</td>
                </tr>
            </table>
        </div>

        <div style="padding-top: 20px; padding-left: 450px;">
            <table style="width: 100%;">
                <tr>
                    <td style="text-align: right">〒 {{ $shop['business_category']['postal_code'] }}</td>
                    <td>{{ $shop['business_category']['address1'] }}<br/>
                        {{ $shop['business_category']['address2'] }}</td>
                </tr>
                <tr>
                    <td style=" text-align: right">TEL:</td>
                    <td>{{ $shop['business_category']['tel'] }}</td>
                </tr>
                <tr>
                    <td style=" text-align: right">FAX:</td>
                    <td>{{ $shop['business_category']['fax'] }}</td>
                </tr>
            </table>
        </div>
        
        <!-- red descriptions -->
        <p>
            平素より弊社メンテナンスにご協力頂き有難うございます。<br/>
            早速です力圷記の内容通り、早急に修毋要となりましたので、宜しくお願い致します。
        </p>
        <p>
            <table style="border-spacing: 0px;">
                <tr>
                    <td style="padding: 7px; border: 1px solid #000000; ">尚、修理代が50,000円以上になる場合には連絡及びお見積りをお願いします。</td>
                </tr>
            </table>
        </p>

        <!-- メンテナンス依頼書 -->
        <div style="border: 1px solid black; padding: 10px; margin-top: 10px;">
            <div style="border: 1px solid black; text-align: center; padding: 7px; font-size: 20px;">メンテナンス依頼書</div>
            <div style="margin-top: 5px;">
                <table style="border-spacing: 0px; width: 100%; text-align: center; border: 1px solid black;">
                    <tr>
                        <td rowspan="2" style="width: 100px; border-right: 1px solid #000000">店舗結品先</td>
                        <td rowspan="2">{{ $shop['shop_code'] }}</td>
                        <td rowspan="2">{{ $shop['business_category']['business_category'] }}</td>
                        <td rowspan="2">{{ $shop['shop_name']  }}</td>
                        <td>店第担当者</td>
                    </tr>
                    <tr>
                        <td>
                        {{ $shop['users']['name'] }}
                        </td>
                    </tr>
                </table>
            </div>

            <div style="margin-top: 5px;">
                <table style="border-spacing: 0px; width: 100%; text-align: center; border: 1px solid black;">
                    <tr>
                        <td style="width: 100px; border-right: 1px solid #000000">住所</td>
                        <td>{{ $shop['shop_address'] }}</td>
                    </tr>
                </table>
            </div>

            <div style="margin-top: 5px;">
                <table style="border-spacing: 0px; width: 357px; text-align: center; border: 1px solid black;">
                    <tr>
                        <td style="width: 100px; border-right: 1px solid #000000">電話番号</td>
                        <td>{{ $shop['shop_phone_number'] }}</td>
                    </tr>
                </table>
            </div>

            <div style="margin-top: 5px;">
                <table style="border-spacing: 0px; width: 100%; text-align: center; border: 1px solid black;">
                    <tr>
                        <td rowspan="2" style="width: 100px; border-right: 1px solid #000000">修理対象</td>
                        <td rowspan="2" style="width: 250px; border-right: 1px solid #000000">{{ $equipment }}</td>
                        <td style="border-right: 1px solid #000000">メーカー</td>
                        <td>{{ $manufacturer }}</td>
                    </tr>
                    <tr>
                        <td style="border-right: 1px solid #000000;  border-top: 1px solid #000000;">型番</td>
                        <td style="border-top: 1px solid #000000;">{{ $model_number }}</td>
                    </tr>
                </table>
            </div>
            <div style="margin-top: 5px;">
                <table  style="border-spacing: 0px; width: 100%; text-align: center; border: 1px solid black;">
                    <tr>
                        <td  style="width: 100px; border-right: 1px solid #000000; height: 6em">状況</td>
                        <td>{{ $order }}</td>
                    </tr>
                </table>
            </div>
        </div>

        <div style="border: 1px solid black; padding: 10px; margin-top: 10px;">
            <div style="margin-top: 10px;">
                <table style="width: 100%; text-align: center; font-size: 16px">
                    <tr>
                        <td rowspan="2">お取引先様</td>
                        <td rowspan="2">→</td>
                        <td rowspan="2">{{ $partner_name }}</td>
                        <td style="font-size: 10px;">FAX</td>
                    </tr>
                    <tr>
                        <td style="font-size: 10px;">{{ $FAX }}</td>
                    </tr>
                </table>
            </div>

            <div style="margin-top: 7px;">
                <table style="border-spacing: 0px; width: 100%;">
                    <tr>
                        <td colspan="2">
                            ※ 店舗訪問日時を本日中にご返送下さい。
                        </td>
                        <td rowspan="2" style="border: 1px solid #000000;">{{ $remark }}</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #000000; width: 100px;">修理・納品予定日</td>
                        <td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; width: 250px;">
                            @if($visit_schedule_date)
                                {{ date('Y/m/d', strtotime($visit_schedule_date)) }}
                            @endif
                        </td>
                    </tr>
                </table>
            </div>

            <hr style="border: 1px dashed #000000; margin-top: 8px"/>

            <div style="margin-top: 7px">
                <table>
                    <tr>
                        <td style="border: 1px solid #000000; padding: 5px">メンテナンス完了報告書</td>
                        <td>理担当者様店にて記入 → {{ $partner_name }}</td>
                    </tr>
                </table>
            </div>

            <div style="margin-top: 7px;">
                <p>※ 修理後、内容記入。店確認をとリFAXして下さい。</p>
                <p>※ 作業報告および写真の提出をお願いします。書類確認できない場合は、お支払いできないことがあります。</p>
            </div>

            <!-- 完了日 -->
            <div style="margin-top: 7px;">
                <table style="border-spacing: 0px; width: 100%; text-align: center; border: 1px solid black;">
                    <tr>
                        <td style="border-right: 1px solid #000000; width: 100px;">完了日</td>
                        <td style="border-right: 1px solid #000000; width: 250px;">{{ $completed_date }}</td>
                        <td style="border-right: 1px solid #000000; width: 100px;">見積額</td>
                        <td>
                            @if($accounting_info && count($accounting_info))
                                    {{ print_r($accounting_info[0]['unincluding_price']) }}
                            @endif
                        </td>
                    </tr>
                </table>
            </div>

            <div style="margin-top: 7px;">
                <table style="border-spacing: 0px; width: 100%; text-align: center; border: 1px solid black;">
                    <tr>
                        <td style="border-right: 1px solid #000000; width: 100px;">再修理</td>
                        <td style="border-right: 1px solid #000000; width: 250px;">無・有</td>
                        <td style="border-right: 1px solid #000000; width: 100px;">現状</td>
                        <td>@if($progress)
                                {{ print_r($progress['status']) }}
                            @endif</td>
                    </tr>
                </table>
            </div>

            <div style="margin-top: 7px;">
                <table style="border-spacing: 0px; width: 100%; text-align: center; border: 1px solid black;">
                    <tr>
                        <td style="border-right: 1px solid #000000; width: 100px;">内容・経過</td>
                        <td style="border-right: 1px solid #000000; width: 250px;">
                            @if($maintenance_progress && count($maintenance_progress))
                                {{ print_r($maintenance_progress[0]['comment']) }}
                            @endif
                        </td>
                        <td style="border-right: 1px solid #000000;">担当者サイン</td>
                        <td>店舗確認サイン</td>
                    </tr>
                </table>
            </div>
        </div>
      </div>
  <style>
        .container {
            width: 690px;
        }
    </style>
  </body>
</html>