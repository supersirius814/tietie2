<template>
    <div>
        <el-row style="border: 1px solid black; padding: 10px;">
            <el-row style="font-size: 24px; font-weight: bold; text-align: center">メンテナンス手配完了連絡書</el-row>
            <el-row>修理お取引先様は</el-row>

            <el-row :gutter="10">
                <el-col :span="15" style="font-size: 16px">セキュリティーサポート株式会社&nbsp;<span style="font-size: 14px">様</span></el-col>
                <el-col :span="9">
                  <el-row>株式会社 はま第司</el-row>
                  <el-row>{{ detail.user.name }}</el-row>
                </el-col>
            </el-row>

            <!-- 〒 108-0075 -->
            <el-row :gutter="10">
              <el-col :span="13">
                または子会社・協力会社の作業員が対応します。<br/>
                (*状況によリお取引先様が変更になる場合もあリます。)
              </el-col>
              <el-col :span="11">
                <el-row :gutter="15">
                  <el-col :span="9">〒 {{ detail.shop.business_category.postal_code }}</el-col>
                  <el-col :span="15">
                    {{ detail.shop.business_category.address1 }}<br/>
                    {{ detail.shop.business_category.address2 }}
                  </el-col>
                </el-row>
                <el-row :gutter="15">
                  <el-col :span="4">TEL:</el-col>
                  <el-col :span="8">{{ detail.shop.business_category.tel }}</el-col>
                  <el-col :span="4">FAX:</el-col>
                  <el-col :span="8">{{ detail.shop.business_category.fax }}</el-col>
                </el-row>
              </el-col>
            </el-row>

            
            <el-row style="border: 1px solid black; padding: 5px;">
              <!-- 依頼区分 -->
              <el-row>
                <table class="fax-no-border-table">
                  <tr>
                    <td style="width: 18%">■ 内容</td>
                    <td style="font-size: 20px; font-weight: 600"><u>{{ detail.order_type.type }}</u></td>
                  </tr>
                </table>
              </el-row>

              <el-row>
                <table  class="fax-detail-table">
                    <tr>
                        <td rowspan="2" style="width: 15%; border-right: 1px solid #000000">店舗結品先</td>
                        <td rowspan="2" style="width: 15%">{{ detail.shop.shop_code }}</td>
                        <td rowspan="2" style="width: 15%">{{ detail.shop.business_category.business_category }}</td>
                        <td rowspan="2" style="width: 15%">{{ detail.shop.shop_name }}</td>
                        <td>店第担当者</td>
                    </tr>
                    <tr>
                        <td>{{ detail.user.name }}</td>
                    </tr>
                </table>
              </el-row>


              <!-- 修理対象 -->
              <el-row :gutter="10" style="margin-right: 0px; margin-left: 0px">
                  <table class="fax-detail-table">
                      <tr>
                          <td style="border-right: 1px solid #000000; width: 15%;">
                              修理対象
                          </td>
                          <td>
                              {{ detail.equipment }}
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

            <el-row :gutter="10" style="margin-right: 0px; margin-left: 0px; font-size: 24px; margin-top: 20px; margin-bottom: 24px;">
              <u>上記の件、受付致しました。</u>
            </el-row>

            <el-row :gutter="15" style="margin-right: 0px; margin-left: 0px; border: 1px solid #000000; padding: 5px; margin-bottom: 20px; width: 40%">
                <el-col :span="11">
                    受付番号:
                </el-col>
                <el-col :span="13">
                    {{ detail.maintenance_code }}
                </el-col>
            </el-row>

            <el-row>※ 訪問日時は決まリ次第連絡致します。</el-row>
            <el-row>※ 場合によっては日程連絡と修理訪問が前後することがあります。</el-row>
            <el-row style="margin-bottom: 70px;">※ 修理訪問後は必ず修理完了または未完了の報告をお願いします。</el-row>
        </el-row>
    </div>
</template>

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
};
</script>