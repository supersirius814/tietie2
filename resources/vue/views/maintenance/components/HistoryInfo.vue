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
              <td>{{ detail.progress.status }}</td>
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
    <el-table :data="detail.maintenance_progress" :show-header="true" border style="width: 100%">
      <el-table-column align="center" prop="created_at" label="日時" width="160px" />
      <el-table-column align="center" prop="progress_id" label="ステータス" :formatter="formatterProgress" width="100px" />
      <el-table-column align="center" prop="entered_by.name" label="入力者" width="100px" />
      <el-table-column align="center" prop="comment" label="コメント" />
      <el-table-column align="center" label="FAX送信">
        <el-table-column align="center" prop="faxed_to_client" label="取" width="50px" />
        <el-table-column align="center" prop="faxed_to_shop" label="店" width="50px" />
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
      width="60%"
      custom-class="slide-dialog"
      top="0px"
      :modal="false"
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
    detail: {
      type: Object,
      default: () => {
        return {};
      },
    },
  },
  data() {
    return {
      editVisible: false,
      quotationFilesVisible: false,
      photoFilesVisible: false,
      reportFilesVisible: false,
      progress: [],
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
  created() {
    this.progress = {
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
    };
  },
  mounted() {
    const dialogs = document.querySelectorAll('.slide-dialog');
    dialogs.forEach(el => {
      el.closest('.el-dialog__wrapper').classList.add('slide-dialog-wrapper');
    });
  },
  methods: {
    formatterProgress(row, column) {
      return this.progress[row.progress_id] ?? '';
    },
  },
};
</script>
