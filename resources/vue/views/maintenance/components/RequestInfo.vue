<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span>依頼情報 </span>
      <el-button style="float: right;" type="primary" size="small" @click="editVisible=true">編集</el-button>
    </div>

    <br>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th style="line-height:3;">メンテナンスNo</th>
              <td>M1234567890123</td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>店舗CD</th>
              <td style="text-align:center">1174</td>
              <td style="text-align:center">HS</td>
            </tr>
            <tr>
              <th>店舗名</th>
              <td colspan="2" style="text-align:center">蒲郡竹谷</td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="4">
        <el-button type="info" size="small" @click="baseInfoVisible = true">基本情報</el-button>
      </el-col>
    </el-row>
    <el-divider />
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>大分類*</th>
              <td>空調</td>
            </tr>
            <tr>
              <th>中分類*</th>
              <td>エアコン</td>
            </tr>
          </tbody>
        </table>
        <table class="detail-table">
          <tbody>
            <tr>
              <th>依頼区分*</th>
              <td>修理依頼</td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="14">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>取引先コード</th>
              <td>11000000060</td>
              <td style="border:none;padding:0 5px;">
                <el-button type="info" size="small" @click="createMailVisible = true">取引先メール</el-button>
              </td>
            </tr>
          </tbody>
        </table>
        <table class="detail-table">
          <tbody>
            <tr>
              <th>取引先名</th>
              <td colspan="2">パナソニック産機システムズ</td>
            </tr>
            <tr>
              <th>TEL/FAX</th>
              <td>0533-66-6277</td>
              <td>0533-66-6277</td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <table class="detail-table">
      <tbody>
        <tr>
          <th>依頼内容*</th>
          <td>AC2系統（客席）でP15エラー表示。冷えない。至急手配お願いいたします。AC2系統（客席）でP15エラー表示。冷えない。至急手配お願いいたします。AC2系統（客席）でP15エラー表示。冷えない。P15エラー表示。冷えない。至急手配お願いいたします。</td>
          <td rowspan="2" style="padding:0;">
            <p class="header-1" style="margin-top:0;padding:10px">添付ファイル</p>
            <div style="text-align:center; padding:5px;max-height:300px;overflow-x:hidden;overflow-y:auto;">
              <el-image style="width: 150px; height: 100px; display:block;" src="https://picsum.photos/id/0/300/200" :preview-src-list="fileList" />
              <a href="#" style="margin-bottom:10px;display:block;">全体写真</a>
              <el-image style="width: 150px; height: 100px; display:block;" src="https://picsum.photos/id/1/300/200" :preview-src-list="fileList" />
              <a href="#" style="margin-bottom:10px;display:block;">細部写真</a>
              <el-image style="width: 150px; height: 100px; display:block;" src="https://picsum.photos/id/2/300/200" :preview-src-list="fileList" />
              <a href="#" style="margin-bottom:10px;display:block;">型番写真</a>
            </div>
          </td>
        </tr>
        <tr>
          <th>備考</th>
          <td>完全ガス欠</td>
        </tr>
      </tbody>
    </table>
    <table class="detail-table">
      <tbody>
        <tr>
          <th rowspan="5">案件情報</th>
          <th>系統</th>
          <td>AC2</td>
          <th>原因</th>
          <td>AC2</td>
        </tr>
        <tr>
          <th>発生現象</th>
          <td>エラー</td>
          <th>原因箇所</th>
          <td>AC2</td>
        </tr>
        <tr>
          <th>エラーコード</th>
          <td>P15</td>
          <th>&nbsp</th>
          <td>AC2</td>
        </tr>
        <tr>
          <th>発生現象</th>
          <td>エラー</td>
          <th>原因箇所</th>
          <td>AC2</td>
        </tr>
        <tr>
          <th>エラーコード</th>
          <td>P15</td>
          <th>&nbsp</th>
          <td>AC2</td>
        </tr>
      </tbody>
    </table>
    <el-dialog
      title="【取引先メール作成】"
      :visible.sync="createMailVisible"
      width="700px"
    >
      <create-client-mail />
      <span slot="footer" class="dialog-footer">
        <span>宛先とCC宛先、それぞれ選択してください。</span>
        <el-button type="primary" @click="createMailVisible = false">メーラー起動</el-button>
        <el-button @click="createMailVisible = false">閉じる</el-button>
      </span>
    </el-dialog>
    <el-dialog
      title=""
      :visible.sync="baseInfoVisible"
      width="700px"
    >
      <base-info />
    </el-dialog>
    <el-dialog
      title="依頼情報 編集"
      :visible.sync="editVisible"
      width="1100px"
    >
      <request-info-edit />
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="editVisible=false">登録</el-button>
        <el-button @click="editVisible=false">閉じる</el-button>
      </span>
    </el-dialog>
  </el-card>
</template>

<script>
import CreateClientMail from './sub/CreateClientMail.vue';
import BaseInfo from './BaseInfo.vue';
import RequestInfoEdit from './sub/RequestInfoEdit.vue';

export default {
  components: { CreateClientMail, BaseInfo, RequestInfoEdit },
  props: {
    user: {
      type: Object,
      default: () => {
        return {
          name: '',
          email: '',
          avatar: '',
          roles: [],
        };
      },
    },
  },
  data() {
    return {
      createMailVisible: false,
      baseInfoVisible: false,
      editVisible: false,
      fileList: [
        'https://picsum.photos/id/0/300/200',
        'https://picsum.photos/id/1/300/200',
        'https://picsum.photos/id/2/300/200',
      ],
      tableData: [
        { title: '特記①', value: '20’10/13〜10/25改装 浄化槽店舗' },
        { title: '特記②', value: '20’5/21エアコン全台清掃 駐車場案件は大和ハウス様へ' },
      ],
    };
  },
  methods: {
  },
};
</script>

<style lang="scss" scoped>
  td {
    .el-button{
      // padding:6px 15px;
    }
  }
</style>
