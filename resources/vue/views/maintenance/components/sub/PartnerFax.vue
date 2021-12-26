<template>
    <div>
        
        <el-row :gutter="15">
            <el-col :span="7">
                <button  class="fax-cls-orderType">{{ detail.order_type.type }}</button>
            </el-col>
            <el-col :span="10" :offset="7" class="fax-cls-mainCode">
                <el-row :gutter="15" style="border: 1px solid #000000; padding: 5px; margin-top: 10px">
                    <el-col :span="11">
                        受付番号:
                    </el-col>
                    <el-col :span="13">
                        {{ detail.maintenance_code }}
                    </el-col>
                </el-row>
            </el-col>
        </el-row>

        <el-row :gutter="20">
            <!-- 取引先情報 information display -->
            <el-col :span="14" align="middle">
                <el-row style="font-size: 16px; font-weight: 600; ">
                    <!-- margin-bottom: 100px -->
                    {{ detail.partner_name }}
                </el-row>
                <el-row :gutter="15" style="font-size: 12px;">
                    <el-col :span="12">
                        TEL: {{ detail.TEL }}
                    </el-col>
                    <el-col :span="12">
                        FAX: {{ detail.FAX }}     
                    </el-col>
                </el-row>
            </el-col>

            <!-- 担当者名（ログインユーザー名） & business_categoryテーブルから取得 -->
            <el-col :span="10">
                <el-row>請求先: {{ computedAccounting_Name(detail.accounting_info) }}</el-row>
                <el-row>
                    <el-col :span="14" align="middle">
                        {{ detail.user.name }}
                    </el-col>
                </el-row>
                <el-row :gutter="10" style="margin-top: 20px">
                    <!-- style="margin-top: 50px" -->
                    <el-col :span="12" style="text-align: right">
                        〒 {{ detail.shop.business_category.postal_code }}
                    </el-col>
                    <el-col :span="12">
                        {{ detail.shop.business_category.address1 }}<br/>
                        {{ detail.shop.business_category.address2 }}
                    </el-col>
                </el-row>
                <el-row :gutter="10" style="font-weight: bold">
                    <el-col :span="12" style="text-align: right;">
                        <el-row>TEL:</el-row>
                        <el-row>FAX:</el-row>
                    </el-col>
                    <el-col :span="12">
                        <el-row>{{ detail.shop.business_category.tel }}</el-row>
                        <el-row>{{ detail.shop.business_category.fax }}</el-row>
                    </el-col>
                </el-row>
            </el-col>
        </el-row>

        <!-- red descriptions -->
        <el-row>
            <el-row>
                平素より弊社メンテナンスにご協力頂き有難うございます。<br/>
                早速です力圷記の内容通り、早急に修毋要となりましたので、宜しくお願い致します。
            </el-row>
            <el-row>
                <button style="padding: 7px; background-color: white; border: 1px solid black;">尚、修理代が50,000円以上になる場合には連絡及びお見積りをお願いします。</button>
            </el-row>
        </el-row>

        <!-- メンテナンス依頼書 -->
        <el-row style="border: 1px solid black; padding: 10px;">
            <el-row style="border: 1px solid black; text-align: center; padding: 7px; font-size: 20px;">メンテナンス依頼書</el-row>

            <!-- 店舗結品先 -->
            <el-row :gutter="10" style="margin-right: 0px; margin-left: 0px">
                <table  class="fax-detail-table">
                    <tr>
                        <td rowspan="2" style="width: 15%; border-right: 1px solid #000000">店舗結品先</td>
                        <td rowspan="2" style="width: 15%">{{ detail.shop.shop_code }}</td>
                        <td rowspan="2" style="width: 15%">{{ detail.shop.business_category.business_category }}</td>
                        <td rowspan="2" style="width: 15%">{{ detail.shop.shop_name }}</td>
                        <td>店第担当者</td>
                    </tr>
                    <tr>
                        <td>{{ detail.shop.users.name }}</td>
                    </tr>
                </table>
            </el-row>

            <!-- 住所 -->
            <el-row :gutter="10" style="margin-right: 0px; margin-left: 0px">
                <table class="fax-detail-table">
                    <tr>
                        <td style="width: 15%; border-right: 1px solid #000000">
                            住所
                        </td>
                        <td>
                            {{ detail.shop.shop_address }}
                        </td>
                    </tr>
                </table>
            </el-row>

            <!-- 電話番号 -->
            <el-row :gutter="10" style="margin-right: 0px; margin-left: 0px">
                <table class="fax-detail-table" style="width: 60%">
                    <tr>
                        <td style="width: 15%; border-right: 1px solid #000000">
                            電話番号
                        </td>
                        <td style="width: 45%">
                            {{ detail.shop.shop_phone_number }}
                        </td>
                    </tr>
                </table>
            </el-row>

            <!-- 修理対象 -->
            <el-row :gutter="10" style="margin-right: 0px; margin-left: 0px">
                <table class="fax-detail-table">
                    <tr>
                        <td rowspan="2" style="border-right: 1px solid #000000; width: 15%;">
                            修理対象
                        </td>
                        <td rowspan="2" style="border-right: 1px solid #000000; width: 45%;">
                            {{ detail.equipment }}
                        </td>
                        <td style="border-right: 1px solid #000000; width: 15%;">
                            メーカー
                        </td>
                        <td>    
                            {{ detail.manufacturer }}
                        </td>
                    </tr>
                    <tr>
                        <td style="border-right: 1px solid #000000;  border-top: 1px solid #000000;">
                            型番
                        </td>
                        <td style="border-top: 1px solid #000000;">
                            {{ detail.model_number }}
                        </td>
                    </tr>
                </table>
            </el-row>

            <!-- 「依頼内容」を表示 -->
            <el-row :gutter="10" style="margin-right: 0px; margin-left: 0px">
                <table class="fax-detail-table">
                    <tr>
                        <td style="border-right: 1px solid #000000; width: 15%; height: 6em">状況</td>
                        <td>{{ detail.order }}</td>
                    </tr>
                </table>
            </el-row>
        </el-row>

        <!-- お取引先様 -->
        <el-row style="border: 1px solid black; padding: 10px;">
            <el-row :gutter="10" style="margin-right: 0px; margin-left: 0px">
                <table class="fax-no-border-table">
                    <tr>
                        <td rowspan="2" style="font-size: 18px; font-weight: bold">お取引先様</td>
                        <td rowspan="2" style="font-size: 18px; font-weight: bold">→</td>
                        <td rowspan="2" align="middle" style="font-size: 18px; font-weight: bold">{{ detail.partner_name }}</td>
                        <td>FAX</td>
                    </tr>
                    <tr>
                        <td>{{ detail.FAX }}</td>
                    </tr>
                </table>
            </el-row>

            <el-row>
                <table class="fax-no-border-table">
                    <tr>
                        <td colspan="2" style="width: 50%;">※ 店舗訪問日時を本日中にご返送下さい。</td>
                        <td rowspan="2" style="border: 1px solid #000000;">{{ detail.remark }}</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #000000; width: 15%;">修理・納品予定日</td>
                        <td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; width: 35%;">{{ computedvisitDate(detail.visit_schedule_date) }}</td>
                    </tr>
                </table>
            </el-row>

            <hr style="border: 1px dashed #000000"/>

            <el-row style="margin-top: 10px">
                <button style="border: 1px solid #000000; background-color: #ffffff; padding: 5px">メンテナンス完了報告書</button>
                理担当者様店にて記入 → {{ detail.partner_name }}
            </el-row>

            <el-row>※ 修理後、内容記入。店確認をとリFAXして下さい。</el-row>
            <el-row>※ 作業報告および写真の提出をお願いします。書類確認できない場合は、お支払いできないことがあります。</el-row>

            <!-- 完了日 -->
            <el-row>
                <table class="fax-detail-table">
                    <tr>
                        <td style="border-right: 1px solid #000000; width: 15%;">完了日</td>
                        <td style="border-right: 1px solid #000000; width: 35%;">{{ detail.completed_date }}</td>
                        <td style="border-right: 1px solid #000000; width: 15%;">見積額</td>
                        <td>
                            <span v-if="detail.accounting_info && detail.accounting_info.length">{{ detail.accounting_info[0].unincluding_price }}</span>
                        </td>
                    </tr>
                </table>
            </el-row>

            <!-- 再修理 -->
            <el-row>
                <table class="fax-detail-table">
                    <tr>
                        <td style="border-right: 1px solid #000000; width: 15%;">再修理</td>
                        <td style="border-right: 1px solid #000000; width: 35%;">無・有</td>
                        <td style="border-right: 1px solid #000000; width: 15%;">現状</td>
                        <td>{{ progress[detail.progress_id] }}</td>
                    </tr>
                </table>
            </el-row>

            <!-- 内容・経過 -->
            <el-row>
                <table class="fax-detail-table">
                    <tr>
                        <td style="border-right: 1px solid #000000; width: 15%;" rowspan="2">内容・経過</td>
                        <td style="border-right: 1px solid #000000; width: 35%;" rowspan="2">
                            <span v-if="detail.maintenance_progress && detail.maintenance_progress.length">{{ detail.maintenance_progress[0].comment }}</span>
                        </td>
                        <td style="border-right: 1px solid #000000; width: 25%;">担当者サイン</td>
                        <td>店舗確認サイン</td>
                    </tr>
                    <tr>
                        <td style="border-right: 1px solid #000000;"></td>
                        <td></td>
                    </tr>
                </table>
            </el-row>
        </el-row>
    </div>
</template>

<style>
.dash-dot-dot {
  height:50px;
  background:
    radial-gradient(circle at center,#000 2px,transparent 3px) 0px  50%/30px 5px repeat-x,
    radial-gradient(circle at center,#000 2px,transparent 3px) 10px 50%/30px 5px repeat-x,
    repeating-linear-gradient(to right,#000,#000 10px,transparent 10px,transparent 30px) center/100% 3px no-repeat;
}

.fax-cls-orderType {
 border: 1px solid #000000;
 background-color: #ffffff;
 padding: 5px 30px 5px 30px;
 font-size: 18px;
 font-weight: 600;
}

.fax-no-border-table {
    width: 100%;
    border-spacing: 0px;
}

.fax-no-border-table td {
    padding: 5px;
}

.fax-detail-table {
    width: 100%;
    border: 1px solid #000000;
    border-spacing: 0px;
    text-align: center;
}

.fax-detail-table td {
    padding: 5px;
}
</style>

<script>
export default {
  props: {
    detail: {
      type: Object,
      default: () => {
        return {};
      },
    },
  },

  data(){
      return {
        progress: {
            1: 'BM承認待ち',
            2: 'BM承認',
            3: 'BM差戻し',
            4: 'BM却下',
            5: 'BM保留',
            6: '本部受付前',
            7: '本部差戻し',
            8: '本部見送り',
            9: '依頼確定',
            10: '依頼済',
            11: '見積待ち',
            12: '見積精査中',
            13: '入荷待ち',
            14: 'DM承認待ち',
            15: '稟議中',
            16: '見積発注済み',
            17: '日程調整中',
            18: '訪問待ち',
            19: '報告待ち',
            20: '店完了',
            21: '取完了',
            22: '問合せ中',
        },
      }
  },

  methods: {
      computedvisitDate(date){
        if(date != '' && date != null){
            var date_arr = date.split('-')
            return date_arr[0] + '/' + date_arr[1] + '/' + date_arr[2].split(' ')[0];
        }
      },

      computedAccounting_Name(accounting_info){
        if(accounting_info && accounting_info.length){
            var cnt = accounting_info.length;
            var acc_name = accounting_info[0].partner_name;
            if(acc_name){
                return acc_name;
            }
        }
        return '';
      }
  }
};
</script>