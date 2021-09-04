<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span>経過情報</span>
      <el-button style="float: right;" type="primary" size="small" @click="editVisible=true">登録</el-button>
    </div>
    
<!-- {{ detail.progress.status }} -->

<!-- {{detail.maintenance_progress[detail.maintenance_progress.length - 1].created_at}} -->
<!-- {{detail.maintenance_progress.length }} -->
<!-- {{ this.detail.updated_at}}
{{ detail.progress.updated_at }} -->
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
        <el-button type="info" size="mini" @click="photoFilesVisible=true">写真({{ detail.photo_files.length }})</el-button>
        <el-button type="info" size="mini" @click="reportFilesVisible=true">報告書({{ detail.report_files.length }})</el-button>
      </el-col>
    </el-row>
    <el-table :data="detail.maintenance_progress" :show-header="true" border style="width: 100%">
      <el-table-column align="center" prop="created_at" label="日時" width="160px" />
      <el-table-column align="center" prop="progress_id" label="ステータス" :formatter="formatterProgress" width="100px" />
      <el-table-column align="center" prop="entered_by.name" label="入力者" width="100px" />
      <el-table-column align="center" prop="comment" label="コメント" />
      <el-table-column align="center" label="FAX送信">
        <el-table-column align="center" prop="faxed_to_client" label="取" width="50px">
          <template slot-scope="scope">
            <span>{{ scope.row.faxed_to_client == 1 ? '済' : '' }}</span>
          </template>
        </el-table-column>
        <el-table-column align="center" prop="faxed_to_shop" label="店" width="50px">
          <template slot-scope="scope">
            <span>{{ scope.row.faxed_to_shop == 1 ? '済' : '' }}</span>
          </template>
        </el-table-column>
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
      <photo-files :detail="detail" />
      <span slot="footer" class="dialog-footer">
        <el-button @click="photoFilesVisible=false">閉じる</el-button>
      </span>
    </el-dialog>

    <el-dialog
      title="【報告書ファイルリスト】"
      :visible.sync="reportFilesVisible"
      width="700px"
    >
      <report-files :detail="detail" />
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
      <progress-edit :detail="detail" @create="editVisible=false" />
    </el-dialog>
  </el-card>
</template>

<script>
console.log("detail.maintenance_progress")
// var last_element = this.maintenance_progress[this.detail.maintenance_progress.length - 1];
// var dd = new Date(GMT).toISOString().replace(/T/, ' ').replace(/\..+/, '');
// console.log(last_element);
import QuotationFiles from './sub/QuotationFiles.vue';
import PhotoFiles from './sub/PhotoFiles.vue';
import ReportFiles from './sub/ReportFiles.vue';
import ProgressEdit from './sub/ProgressEdit.vue';

export default {
  components: { QuotationFiles, PhotoFiles, ProgressEdit, ReportFiles },
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
