<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span>経過情報</span>
      <el-button style="float: right;" type="primary" size="small">登録</el-button>
    </div>

    <el-row :gutter="20">
      <el-col :span="12">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>最終ステータス</th>
              <td>入荷待ち</td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="12">
        <el-button type="info" size="mini" @click="quotationFilesVisible=true">見積書(3)</el-button>
        <el-button type="info" size="mini" @click="photoFilesVisible=true">写真(3)</el-button>
        <el-button type="info" size="mini">報告書(1)</el-button>
      </el-col>
    </el-row>
    <el-table :data="tableData" :show-header="true" border style="width: 100%">
      <el-table-column align="center" prop="v1" label="日時" />
      <el-table-column align="center" prop="v2" label="ステータス" />
      <el-table-column align="center" prop="v3" label="入力者" />
      <el-table-column align="center" prop="v4" label="コメント" />
      <el-table-column align="center" label="FAX送信">
        <el-table-column align="center" prop="v5" label="取" />
        <el-table-column align="center" prop="v6" label="店" />
      </el-table-column>
    </el-table>

    <el-dialog
      title="【見積書ファイルリスト】"
      :visible.sync="quotationFilesVisible"
      width="700px"
    >
      <quotation-files />
      <span slot="footer" class="dialog-footer">
        <el-button @click="quotationFilesVisible = false">閉じる</el-button>
      </span>
    </el-dialog>
    <el-dialog
      title="【写真リスト】"
      :visible.sync="photoFilesVisible"
      width="700px"
    >
      <photo-files />
      <span slot="footer" class="dialog-footer">
        <el-button @click="photoFilesVisible=false">閉じる</el-button>
      </span>
    </el-dialog>
  </el-card>
</template>

<script>

import QuotationFiles from './sub/QuotationFiles.vue';
import PhotoFiles from './sub/PhotoFiles.vue';

export default {
  components: { QuotationFiles, PhotoFiles },
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
      quotationFilesVisible: false,
      photoFilesVisible: false,
      tableData: [
        { v1: '緊急', v2: '0000345678', v3: '取完了', v4: '2020/04/07', v5: '2020/04/09', v6: 'パナソニック産機システムズ', v7: '事務所のエアコンから水漏れ', v8: '2020/04', v9: '¥35,000' },
        { v1: '緊急', v2: '0000345678', v3: '取完了', v4: '2020/04/07', v5: '2020/04/09', v6: 'パナソニック産機システムズ', v7: '事務所のエアコンから水漏れ', v8: '2020/04', v9: '¥35,000' },
        { v1: '緊急', v2: '0000345678', v3: '取完了', v4: '2020/04/07', v5: '2020/04/09', v6: 'パナソニック産機システムズ', v7: '事務所のエアコンから水漏れ', v8: '2020/04', v9: '¥35,000' },
        { v1: '緊急', v2: '0000345678', v3: '取完了', v4: '2020/04/07', v5: '2020/04/09', v6: 'パナソニック産機システムズ', v7: '事務所のエアコンから水漏れ', v8: '2020/04', v9: '¥35,000' },
        { v1: '緊急', v2: '0000345678', v3: '取完了', v4: '2020/04/07', v5: '2020/04/09', v6: 'パナソニック産機システムズ', v7: '事務所のエアコンから水漏れ', v8: '2020/04', v9: '¥35,000' },
      ],
    };
  },
  methods: {
  },
};
</script>
