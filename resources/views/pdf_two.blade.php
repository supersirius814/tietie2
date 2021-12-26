<!doctype html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>PDF-two-shop</title>
    <style>
    body {
        font-family: ipag;
        font-size: 10px;
    }
    </style>
  </head>
  <body>
      <div class="container-two">
        <div style="margin-top: 20px; text-align: center;">
            <h1 style="font-size: 27px;">メンテナンス手配完了連絡書</h1>
        </div>

        <div style="padding-top: 20px;">
            <table style=" width: 100%; text-align: center">
                <tr>
                    <td style="text-align: left;">修理お取引先様は</td>
                    <td>株式会社 はま第司</td>
                </tr>
                <tr>
                    <td style="text-align: left;">{{ $partner_name }}&nbsp;<span style="font-size: 14px">様</span></td>
                    <td>{{ $user['name'] }}</td>
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
            または子会社・協力会社の作業員が対応します。<br/>
            (*状況によリお取引先様が変更になる場合もあリます。)
        </p>

        <!-- メンテナンス依頼書 -->
        <div style="border: 1px solid black; padding: 10px; margin-top: 10px;">
            <div style="padding: 7px; font-size: 16px;">
                <table>
                    <tr>
                        <td style="font-size: 10px; width: 130px">■ 内容</td>
                        <td><u>{{ $order_type['type'] }}</u></td>
                    </tr>
                </table>
            </div>

            <div style="margin-top: 10px;">
                <table style="border-spacing: 0px; width: 100%; text-align: center; border: 1px solid black;">
                    <tr>
                        <td rowspan="2" style="width: 100px; border-right: 1px solid #000000">店舗結品先</td>
                        <td rowspan="2">{{ $shop['shop_code'] }}</td>
                        <td rowspan="2">{{ $shop['business_category']['business_category'] }}</td>
                        <td rowspan="2">{{ $shop['shop_name']  }}</td>
                        <td>店第担当者</td>
                    </tr>
                    <tr>
                        <td>{{ $shop['users']['name'] }}</td>
                    </tr>
                </table>
            </div>

            <div style="margin-top: 10px;">
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

            <div style="margin-top: 10px;">
                <table  style="border-spacing: 0px; width: 100%; text-align: center; border: 1px solid black;">
                    <tr>
                        <td  style="width: 100px; border-right: 1px solid #000000; height: 6em">状況</td>
                        <td>{{ $order }}</td>
                    </tr>
                </table>
            </div>
        </div>

        <div style="margin-top: 17px; font-size: 18px">
            <u>上記の件、受付致しました。</u>
        </div>

        <div style="margin-top: 20px;">
            <table style="border-spacing: 0px; border: 1px solid black; width: 300px;">
                <tr>
                    <td style="width: 70px; padding: 7px">受付番号:</td>
                    <td style="text-align: center; padding: 7px">{{ $maintenance_code }}</td>
                </tr>
            </table>
        </div>

        <div style="margin-top: 17px; margin-bottom: 70px;">
            <p>※ 訪問日時は決まリ次第連絡致します。</p>
            <p>※ 場合によっては日程連絡と修理訪問が前後することがあります。</p>
            <p>※ 修理訪問後は必ず修理完了または未完了の報告をお願いします。</p>
        </div>
      </div>
    <style>
        .container-two {
            width: 690px;
            padding: 10px;
            border: 1px solid black;

        }
    </style>
  </body>
</html>