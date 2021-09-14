<template>

  <div>

    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>取引先コード</th>
              <td class="input-td">
                <input value="" v-model="customer_code" class="el-input__inner"/>
                <!-- <select v-model="custom" style="width: 100%; height: 36px; border-color: #C0C4CC; line-height: 32px;" class="filter-item" placeholder="" clearable size="small">
                  <option v-for="option in detail.customerInformation" v-bind:value="{ id: option.customer_code, name: option.customer_name, tel: option.TEL, fax: option.FAX }" >
                    {{ option.customer_code }}
                  </option>
                </select> -->
              </td>
              <!-- <td class="input-td"><input value="110000060" /></td> -->
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
              <th>取引先名</th>
              <td class="input-td">
                <input value="" v-model="customer_name" class="el-input__inner"/>                
                <!-- <input value="パナ産機（あじさい銀行）" /> -->
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
              <th>取引先名(カナ)</th>
              <td class="input-td">
                <input value="" v-model="customer_alias" class="el-input__inner"/>                
                <!-- <input value="パナ産機（あじさい銀行）" /> -->
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="0">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>区分コード</th>
              <td class="input-td"><input value="" v-model="relation_code" class="el-input__inner"/></td>
              <!-- <td class="input-td"><input value="110000060" /></td> -->
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>区分</th>
              <td class="input-td"><input value="" v-model="relation_code" class="el-input__inner"/></td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>

    <el-row :gutter="0">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>TEL/FAX</th>
              <td class="input-td"><input value="" v-model="customer_tel" class="el-input__inner"/></td>
              <!-- <td class="input-td"><input value="110000060" /></td> -->
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <td class="input-td"><input value="" v-model="customer_fax" class="el-input__inner"/></td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row>
      <el-button type="info" size="small" @click="customsearch()">検索</el-button>
    </el-row>
    <div style="text-align: right; padding-bottom: 15px;">
      <el-button type="primary" size="small" @click="save()">選択</el-button>
      <el-button type="default" size="small">閉じる</el-button>
    </div>    


  </div>

</template>

<script>
import MaintenanceResource from '@/api/maintenance';
import CurrencyInput from './CurrencyInput.vue';
import { MonthPickerInput } from 'vue-month-picker'
import { Datetime } from 'vue-datetime';
import { Settings } from 'luxon'
import { DateTime } from 'luxon';
const resource = new MaintenanceResource();


export default {
  components: { CurrencyInput, MonthPickerInput },
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
      accounting_year: new Date(),
      format: "yyyy/MM/ddd",
      customer_code: 2313,
      customer_name: '',
      customer_tel: '',
      customer_fax: '',
      customer_alias: '',
      relation_code: '',
      employee: '',
      faxedToClient: 0,
      faxedToShop: 0,
      progressId: 1,
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
    };
  },
  created(){
    this.$store.dispatch('user/getInfo').then(user => {
      this.userName = user.name;
    });
  },
  methods: {
    formatterProgress(row, column) {
      return this.progress[row.progress_id] ?? '';
    },
    customsearch() {
      // customer_code = this.customer_code;
      resource.customsearch(this.customer_code).then(res => {
        this.customer_name = res[res.length - 1].customer_name;
        this.customer_code = res[res.length - 1].customer_code;
        this.customer_alias = res[res.length - 1].customer_alias;
        this.customer_tel = res[res.length - 1].TEL;
        this.customer_fax = res[res.length - 1].FAX;
        // console.log(res); 
        // this.customer_alias = res.customer_name;
        // [detail.customerInformation.length - 1]
      });
    },
    save() {
    
      const insertData = {
        relation_code: this.relation_code,
        relation_name: this.relation_name,
        unincluding_price: this.unincluding_price,
        including_price: this.including_price,
        accounting_year: this.accounting_year.year + '-' + ('0'+this.accounting_year.monthIndex).slice(-2),
        editor: this.userName,
        employee: this.employee,
        accounting_amount: this.accounting_amount,
      };
      resource.createAccounting(this.detail.maintenance_id, insertData).then(res => {
        this.detail.accounting_info = res;
        this.detail.progress_id = this.progressId;
        this.detail.progress = {
          progress_id: this.progressId,
          status: this.progress[this.progressId],
          // updated_at: this.detail.maintenance_id,
        };
       
        // this.comment = '';
        // this.faxedToClient = false;
        // this.faxedToShop = false;
        this.$emit('create');
      });
    },

    getPhotoFiles() {
      resource.getPhotoFiles(this.detail.maintenance_id).then(files => {
        this.detail.photo_files = files;
      });
    },

    getReportFiles() {
      resource.getReportFiles(this.detail.maintenance_id).then(files => {
        this.detail.report_files = files;
      });
    },
  },
};
</script>
<style lang="scss" scoped>
</style>
