<template>

  <div>

    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>日時</th>
              <td class="input-td"><input v-model="date" type="date" /></td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="9" :offset="5">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>入力者</th>
              <td>{{ userName }}</td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>金額</th>
              <td class="input-td">  <currency-input v-model="amount" :options="{ currency: 'JPY' }" />
                    <!-- <input v-model="amount" /> -->
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="15">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>摘要</th>
              <td class="input-td"><input v-model="comment" /></td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="15">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>見積書</th>
              <td style="border: none; padding: 0 5px">
                <el-upload
                  ref="uploadQuotation"
                  :action="
                    '/api/v2/maintenance/upload/quotation/' + detail.maintenance_id
                  "
                  :auto-upload="false"
                  :multiple="false"
                  :on-success="getQuotationFiles()"
                >
                  <el-button slot="trigger" size="small" type="info"
                    >ファイル選択</el-button
                  >
                </el-upload>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="15">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>写真</th>
              <td style="border: none; padding: 0 5px">
                <el-upload
                  ref="uploadPhoto"
                  :action="
                    '/api/v2/maintenance/upload/photo/' + detail.maintenance_id
                  "
                  :auto-upload="false"
                  :multiple="false"
                  :on-success="getPhotoFiles()"
                >
                  <el-button slot="trigger" size="small" type="info"
                    >ファイル選択</el-button
                  >
                </el-upload>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="15">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>報告書</th>
              <td style="border: none; padding: 0 5px">
                <el-upload
                  ref="uploadReport"
                  :action="
                    '/api/v2/maintenance/upload/report/' + detail.maintenance_id
                  "
                  :auto-upload="false"
                  :multiple="false"
                  :on-success="getReportFiles()"
                >
                  <el-button slot="trigger" size="small" type="info"
                    >ファイル選択</el-button
                  >
                </el-upload>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <div style="text-align: right">
      <el-button type="primary" size="small" @click="save()">登録</el-button>
      <el-button type="default" size="small">閉じる</el-button>
    </div>
    <el-table
      :data="detail.quotation_info"
      :show-header="true"
      border
      style="width: 100%; margin-top: 2%"
    >
      <el-table-column align="center" prop="date" label="日時" />
      <el-table-column align="center" prop="amount" label="金額" />
      <el-table-column align="center" prop="comment" label="摘要" />
      <el-table-column align="center" prop="quotation_files_cnt" label="見積書" />
      <el-table-column align="center" prop="photo_files_cnt" label="写真" />
      <el-table-column align="center" prop="report_files_cnt" label="報告書" />
      <el-table-column align="center" prop="editor" label="入力者" width="100" />
    </el-table>
    <!-- <el-table
      :data="detail.quotation_info"
      :show-header="true"
      border
      style="width: 100%; margin: auto"
    >
      <el-table-column align="center" prop="date" label="日時">
        <template slot-scope="scope">
          <el-input v-model="scope.row.date" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="amount" label="金額">
        <template slot-scope="scope">
          <el-input v-model="scope.row.amount" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="comment" label="摘要">
        <template slot-scope="scope">
          <el-input v-model="scope.row.comment" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="quotation_files_cnt" label="見積書">
        <template slot-scope="scope">
          <el-input v-model="scope.row.quotation_files_cnt" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="photo_files_cnt" label="写真">
        <template slot-scope="scope">
          <el-input v-model="scope.row.photo_fielse_cnt" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="report_files_cnt" label="報告書">
        <template slot-scope="scope">
          <el-input v-model="scope.row.report_files_cnt" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="editor" label="入力者">
        <template slot-scope="scope">
          <el-input v-model="scope.row.editor" placeholder="" />
        </template>
      </el-table-column>
    </el-table> -->
  </div>
</template>
<!--
// <script>

// export default {
//   props: {
//     user: {
//       type: Object,
//       default: () => {
//         return {
//           name: '',
//           email: '',
//           avatar: '',
//           roles: [],
//         };
//       },
//     },
//   },
//   data() {
//     return {
//       tableData: [
//         { date: '2020/05/12 16:00:00', amount: '20000', description: '作業後の訂正見積', quotation: '1', photo: '1', report: '1', editor: '川手' },
//         { date: '2020/05/12 16:00:00', amount: '20000', description: '作業後の訂正見積', quotation: '1', photo: '1', report: '1', editor: '川手' },
//       ],
//     };
//   },
//   methods: {
//   },
// };
// </script>-->
<style lang="scss" scoped>
</style>
    <script src="https://unpkg.com/vue"></script>
    <!-- Optional polyfills for usage with IE 11 -->
    <script src="https://polyfill.io/v3/polyfill.min.js?features=Array.prototype.includes%2CObject.assign"></script>
    <script src="https://unpkg.com/vue-currency-input@1.22.4"></script>
<script>
import MaintenanceResource from '@/api/maintenance';
import CurrencyInput from './CurrencyInput.vue';

const resource = new MaintenanceResource();

export default {
   components: { CurrencyInput },
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
      value11: 1234,
      userName: '',
      comment: '',
      date: '',
      amount: '',
    
    };
  },
  created() {
    this.$store.dispatch('user/getInfo').then((user) => {
      this.userName = user.name;
    });
  },
  methods: {
    formatterProgress(row, column) {
      return this.progress[row.progress_id] ?? '';
    },
    save() {
      // alert(this.detail.maintenance_id);
      // return false;
      this.$refs.uploadReport.submit();
      this.$refs.uploadPhoto.submit();
      this.$refs.uploadQuotation.submit();
      const insertData = {
        date: this.date,
        comment: this.comment,
        amount: this.amount,
        quotation_files_cnt: this.detail.quotation_files.length,
        report_files_cnt: this.detail.report_files.length,
        photo_files_cnt: this.detail.photo_files.length,
        editor: this.userName,
      };
      resource
        .createQuotation(this.detail.maintenance_id, insertData)
        .then((res) => {
          this.detail.quotation_info = res;
          // this.detail.progress_id = this.progressId;
          // this.detail.progress = {
          //   progress_id: this.progressId,
          //   status: this.progress[this.progressId],
          //   // updated_at: this.detail.maintenance_id,
          // };

          this.comment = '';
          this.faxedToClient = false;
          this.faxedToShop = false;
          this.$emit('create');
        });
    },

    getPhotoFiles() {
      resource.getPhotoFiles(this.detail.maintenance_id).then((files) => {
        this.detail.photo_files = files;
      });
    },

    getQuotationFiles() {
      resource.getQuotationFiles(this.detail.maintenance_id).then((files) => {
            
        this.detail.quotation_files = files;
      });
    },

    getReportFiles() {
      resource.getReportFiles(this.detail.maintenance_id).then((files) => {
        this.detail.report_files = files;
      });
    },
  },
};
</script>
