<template>

  <div>

    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>請求元取引コード</th>
              <td class="input-td"><input value="" v-model="relation_code" class="el-input__inner"/></td>
              <!-- <td class="input-td"><input value="110000060" /></td> -->
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="3">
        <el-button type="info" size="small">検索</el-button>
      </el-col>
      <el-col :span="11">
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
      <el-col :span="15">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>請求元取引先名</th>
              <td class="input-td">
                <input value="" v-model="relation_name" class="el-input__inner"/>                
                <!-- <input value="パナ産機（あじさい銀行）" /> -->
              </td>
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
              <th>会計年月</th>
                <td class="input-td">
                  <month-picker-input v-model="accounting_year" style="z-index:4000" lang="ja" placeholder="日付を選択してください。"
                  :format="format"
                  ></month-picker-input>
                </td>
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
              <th>請求金額（税抜）</th>
              <td class="input-td">
                <!-- <input v-model="unincluding_price"/> -->
                <currency-input v-model="unincluding_price" :options="{ currency: 'JPY' }"  class="el-input__inner"/>
              </td>
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
              <th>消費税</th>
              <td class="input-td">
                <!-- <input v-model="accounting_amount" /> -->
                <currency-input v-model="accounting_amount" :options="{ currency: 'JPY' }" class="el-input__inner"/>
              </td>
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
              <th>請求金額（税込）</th>
              <td class="input-td">
                <!-- <input v-model="including_price"/> -->
                <currency-input v-model="including_price" :options="{ currency: 'JPY' }"  class="el-input__inner"/>
              </td>
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
              <th>科目</th>
              <td class="input-td"><input v-model="employee" class="el-input__inner"/></td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <div style="text-align: right; padding-bottom: 15px;">
      <el-button type="primary" size="small" @click="save()">登録</el-button>
      <el-button type="default" size="small"  @click="handleClose()">閉じる</el-button>
    </div>    
    <el-table
      :data="detail.accounting_info"
      :show-header="true"
      border
      style="width: 100%; margin: auto"
    >
      <el-table-column align="center" prop="accounting_year" label="会計年月">
        <template slot-scope="scope">
          <el-input v-model="scope.row.accounting_year" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="unincluding_price" label="請求金額（税抜）" >
        <template slot-scope="scope">
          <!-- <el-input v-model="scope.row.unincluding_price" placeholder=""/> -->
          <currency-input v-model="scope.row.unincluding_price" :options="{ currency: 'JPY' }" class="el-input__inner"/>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="accounting_amount" label="消費税">
        <template slot-scope="scope">
          <!-- <el-input v-model="scope.row.accounting_amount" placeholder="" /> -->
           <currency-input v-model="scope.row.accounting_amount" :options="{ currency: 'JPY' }" class="el-input__inner"/>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="including_price" label="請求金額（税込）">
        <template slot-scope="scope">
          <!-- <el-input v-model="scope.row.including_price" placeholder="" /> -->
          <currency-input v-model="scope.row.including_price" :options="{ currency: 'JPY' }" class="el-input__inner"/>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="employee" label="科目">
        <template slot-scope="scope">
          <el-input v-model="scope.row.employee" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="editor" label="入力者">
        <template slot-scope="scope">
          <el-input v-model="scope.row.editor" placeholder="" />
        </template>
      </el-table-column>
    </el-table>

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
      userName: '',
      accounting_amount: '',
      including_price: '',
      unincluding_price: '',
      relation_name: '',
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
    handleClose(){
      document.querySelector("#app > div > div.main-container > section > div > div.el-dialog__wrapper.slide-dialog-wrapper > div > div.el-dialog__body > div > div:nth-child(2) > div.el-dialog__wrapper.slide-dialog-wrapper").click();
    },

    formatterProgress(row, column) {
      return this.progress[row.progress_id] ?? '';
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

  },
};
</script>
<style lang="scss" scoped>
</style>
