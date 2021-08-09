<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span>経過情報</span>
      <el-button style="float: right;" type="primary" size="small" @click="editVisible=true">登録</el-button>
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
        <el-button type="info" size="mini" @click="reportFilesVisible=true">報告書(1)</el-button>
      </el-col>
    </el-row>
    <el-table :data="tableData" :show-header="true" border style="width: 100%">
      <el-table-column align="center" prop="v1" label="日時" />
      <el-table-column align="center" prop="v2" label="ステータス" />
      <el-table-column align="center" prop="v3" label="入力者" width="80px" />
      <el-table-column align="center" prop="v4" label="コメント" width="80px" />
      <el-table-column align="center" label="FAX送信">
        <el-table-column align="center" prop="v5" label="取" width="50px" />
        <el-table-column align="center" prop="v6" label="店" width="50px" />
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

    <el-dialog
      title="【報告書ファイルリスト】"
      :visible.sync="reportFilesVisible"
      width="700px"
    >
      <quotation-files />
      <span slot="footer" class="dialog-footer">
        <el-button @click="reportFilesVisible = false">閉じる</el-button>
      </span>
    </el-dialog>

    <el-dialog
      title="経過情報 登録"
      :visible.sync="editVisible"
      width="1100px"
      custom-class="slide-dialog"
      top="0px"
    >
      <progress-edit />
    </el-dialog>
  </el-card>
</template>

<script>

import QuotationFiles from './sub/QuotationFiles.vue';
import PhotoFiles from './sub/PhotoFiles.vue';
import ProgressEdit from './sub/ProgressEdit.vue';

export default {
  components: { QuotationFiles, PhotoFiles, ProgressEdit },
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
      editVisible: false,
      quotationFilesVisible: false,
      photoFilesVisible: false,
      reportFilesVisible: false,
      tableData: [
        { v1: '2020/05/08 13:54:22', v2: '新規申請', v3: '渡辺', v4: '', v5: '', v6: '' },
        { v1: '2020/05/08 13:54:22', v2: '新規申請', v3: '渡辺', v4: '', v5: '', v6: '' },
        { v1: '2020/05/08 13:54:22', v2: '新規申請', v3: '渡辺', v4: '', v5: '', v6: '' },
        { v1: '2020/05/08 13:54:22', v2: '新規申請', v3: '渡辺', v4: '', v5: '', v6: '' },
        { v1: '2020/05/08 13:54:22', v2: '新規申請', v3: '渡辺', v4: '', v5: '', v6: '' },
        { v1: '2020/05/08 13:54:22', v2: '新規申請', v3: '渡辺', v4: '', v5: '', v6: '' },
      ],
    };
  },
  mounted() {
    const dialogs = document.querySelectorAll('.slide-dialog');
    dialogs.forEach(el => {
      el.closest('.el-dialog__wrapper').classList.add('slide-dialog-wrapper');
    });
  },
  methods: {
  },
};
</script>
