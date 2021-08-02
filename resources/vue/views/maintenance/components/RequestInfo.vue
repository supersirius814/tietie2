<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span>依頼情報 </span>
      <el-button style="float: right; margin-left:10px;" type="primary" size="small">特記編集</el-button>
      <el-button style="float: right;" type="primary" size="small" @click="createMailVisible = true">取引先メール</el-button>
    </div>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>BM承認</th>
              <td>承認済み</td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>本部承認</th>
              <td>受付前</td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="0">
      <el-col :span="14">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>コメント*</th>
              <td>差し戻しです。</td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>最終更新者*</th>
              <td>本部 北村 2020/10/11</td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <br>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>最終ステータス</th>
              <td>-</td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="5">
        <el-checkbox checked disabled>緊急・重要</el-checkbox>
      </el-col>
      <el-col :span="5">
        <el-checkbox disabled>災害（地震・台風・大雨など）</el-checkbox>
      </el-col>
    </el-row>

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
        </tr>
        <tr>
          <th>備考</th>
          <td>完全ガス欠</td>
        </tr>
        <tr>
          <th>添付ファイル</th>
          <td>
            <a href="#">全体写真</a>
            <a href="#">細部写真</a>
            <a href="#">型番写真</a>
            <a href="#">その他写真1</a>
          </td>
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
        <el-button type="primary" @click="createMailVisible = false">メール</el-button>
        <el-button @click="createMailVisible = false">閉じる</el-button>
      </span>
    </el-dialog>
  </el-card>
</template>

<script>
import CreateClientMail from './sub/CreateClientMail.vue';

export default {
  components: { CreateClientMail },
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
