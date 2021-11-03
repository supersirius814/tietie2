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
                  <!-- <month-picker-input v-model="accounting_year" style="z-index:4000" lang="ja"  :default-month="8"
        :default-year="2020"
                  :format="format"
                  ></month-picker-input> -->
                  	<vue-monthly-picker :monthLabels="localeMonth"	inputClass="input" v-model="accounting_year" />
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
                <input type="text" v-model="unincluding_price" class="el-input__inner" @change="calUnin()"/>
                <!-- <currency-input v-model="unincluding_price" :options="{ currency: 'JPY' }"  class="el-input__inner" @change="calUnin()"/> -->
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
                <!-- ¥{{ accounting_amount }} -->
                <input v-model="accounting_amount" class="el-input__inner" disabled/>
                <!-- <currency-input :value="accounting_amount" :formattedValue="accounting_amount" :options="{ currency: 'JPY' }" class="el-input__inner"/> -->
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
                <input v-model="including_price" class="el-input__inner" @change="calIn()"/>
                <!-- <currency-input v-model="including_price" :options="{ currency: 'JPY' }"  class="el-input__inner" @change="calIn()"/> -->
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
              <!-- <td class="input-td"><input v-model="accounting_subjects_id" class="el-input__inner"/></td> -->
              <td class="select-td">
                <el-select
                  size="small"
                  v-model="subjects_id"
                  placeholder=""
                  clearable
                  style="width: 100%"
                  class="filter-item"
                >
                  <el-option
                    v-for="item in subjects"
                    :key="item.accounting_subjects_id"
                    :label="item.name"
                    :value="item.accounting_subjects_id"
                  />
                </el-select>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <div style="text-align: right; padding-bottom: 15px;">
      <el-button type="primary" size="small" @click="save()">{{ button_label }}</el-button>
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
          <el-input v-model="scope.row.unincluding_price" placeholder="" @change="calUninChange(scope.row)"/>
          <!-- <currency-input v-model="scope.row.unincluding_price" :options="{ currency: 'JPY' }" class="el-input__inner" /> -->
        </template>
      </el-table-column>
      <el-table-column align="center" prop="accounting_amount" label="消費税">
        <template slot-scope="scope">
          <el-input v-model="scope.row.accounting_amount" placeholder="" @change="calAmountChange(scope.row)"/>
          <!-- <currency-input v-model="scope.row.accounting_amount" :options="{ currency: 'JPY' }" class="el-input__inner"/> -->
        </template>
      </el-table-column>
      <el-table-column align="center" prop="including_price" label="請求金額（税込）">
        <template slot-scope="scope">
          <input v-model="scope.row.including_price" class="el-input__inner" @change="calInChange(scope.row)"/>
          <!-- <currency-input v-model="scope.row.including_price" :options="{ currency: 'JPY' }" class="el-input__inner"/> -->
        </template>
      </el-table-column>
      <el-table-column align="center" prop="accounting_subjects_id" label="科目" :formatter="formatterSubject">
        <!-- <template slot-scope="scope">
          <el-input v-model="scope.row.accounting_subjects_id" placeholder=""/>
        </template> -->
      </el-table-column>
      <el-table-column align="center" prop="editor" label="入力者">
      </el-table-column>
      <el-table-column align="center" label="編集/削除" >
          <template slot-scope="scope">
            <div style="display: inline-flex; padding 0px; margin: 0px">
                  <!-- <el-button size="small" type="primary" @click="editAccountingId(scope.row)"  style="background-color: #13ce66; padding: 0px; margin: 0px;
          border: 0px;">edit</el-button>

                  <el-button size="small" type="primary"  style="background-color: #13ce66; padding: 0px; margin: 0px;
          border: 0px;">delete</el-button> -->

                  <el-button size="small" type="primary" @click="editAccountingId(scope.row)"  style="background-color: transparent; padding: 0px; margin: 0px;
          border: 0px;"><i class="material-icons" style="font-size:30px;color:#1890ff">&#xe254;</i></el-button>

                  <!-- <el-button size="small" type="primary" @click="dialogVisible=true"  style="background-color: transparent; padding: 0px; margin: 0px;
          border: 0px;"><i class="material-icons" style="font-size:30px;color:#1890ff">&#xe254;</i></el-button>
                      <el-dialog
                        width="700px"
                        :modal="false"
                        :visible.sync="dialogVisible">
                      </el-dialog> -->

                  <el-button size="small" type="primary" @click="deleteAccountingId(scope.row.accounting_info_id)" style="background-color: transparent; padding: 0px; margin: 0px;
          border: 0px;"><i class="material-icons" style="font-size:30px;color:red">&#xe92b;</i></el-button>
            </div>
          </template>
      </el-table-column>
    </el-table>
  </div>

</template>

<script>
import MaintenanceResource from '@/api/maintenance';
import CurrencyInput from './CurrencyInput.vue';
import { MonthPickerInput } from 'vue-month-picker'
import VueMonthlyPicker from 'vue-monthly-picker'
import { Datetime } from 'vue-datetime';
import { Settings } from 'luxon'
import { DateTime } from 'luxon';
// import SpecialInfo from '../SpecialInfo.vue';
// import Index from '../../../../components/Breadcrumb/index.vue';
const resource = new MaintenanceResource();


export default {
  components: { CurrencyInput, MonthPickerInput,VueMonthlyPicker, DateTime },
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
      button_label: '登録',
      item: '',
      subjects: [],
      subjects_id: '',
      subjectsList: [],
      selectedMonth: '2021-08',
      localeMonth:  ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
      dialogVisible: false,
      // currentTabComponent: 'CurrencyInput',
      accounting_info_id: this.$route.params['accounting_info_id'],
      accounting_year:'',
      format: "yyyy/MM/ddd",
      userName: '',
      accounting_amount: null,
      including_price: null,
      unincluding_price: null,
      relation_name: '',
      relation_code: '',
      accounting_subjects_id: '',
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
  mounted() {
    this.getAccountingSubjects();
    // alert(this.$route.params['accounting_info_id']);
  },
  methods: {
    formatterSubject(row, column){
      if(row.accounting_subjects_id == '') return;
      else {
        return this.subjectsList[row.accounting_subjects_id];
      }
    },
    getAccountingSubjects(){
      var data = {
        business_category_id: this.detail.shop.business_category.business_category_id,
      }
      resource.getAccountingSubjects(this.detail.maintenance_id, data).then(res => {
        this.subjects = res;
        res.forEach(el => {
          this.subjectsList[el.accounting_subjects_id] = el.name;
        });
      });
    },

    calUnin() {
      // alert(this.unincluding_price)
      if(this.unincluding_price.includes('¥')){
        this.accounting_amount = '¥' + Number((this.unincluding_price.split('¥')[1] * 0.1).toFixed(0)) ;
        this.including_price = '¥' +  Number((this.unincluding_price.split('¥')[1] * 1.1).toFixed(0));
      } else{
        this.accounting_amount = '¥' + Number((this.unincluding_price * 0.1).toFixed(0));
        this.including_price = '¥' +  Number((this.unincluding_price * 1.1).toFixed(0));
        this.unincluding_price = '¥' + this.unincluding_price;
      }
    },
    calUninChange(row) {
      if(row.unincluding_price.includes('¥')){
        row.accounting_amount = '¥' + Number((row.unincluding_price.split('¥')[1] * 0.1).toFixed(0)) ;
        row.including_price = '¥' +  Number((row.unincluding_price.split('¥')[1] * 1.1).toFixed(0));
      } else{
        row.accounting_amount = '¥' + Number((row.unincluding_price * 0.1).toFixed(0));
        row.including_price = '¥' +  Number((row.unincluding_price * 1.1).toFixed(0));
        row.unincluding_price = '¥' + row.unincluding_price;
      }
    },
    calIn(){
      if(this.including_price.includes('¥')){
        this.unincluding_price = '¥' + Number((this.including_price.split('¥')[1] / 1.1).toFixed(0));
        this.accounting_amount = '¥' + Number((this.including_price.split('¥')[1] / 1.1 * 0.1).toFixed(0));
      } else{
        this.unincluding_price = '¥' + Number((this.including_price / 1.1).toFixed(0));
        this.accounting_amount = '¥' + Number((this.including_price / 1.1 * 0.1).toFixed(0));
        this.including_price = '¥' + this.including_price.split('¥')[0];
      }
    },
    editAccountingId(row){
      // var ss = this.accounting_year.toISOString();
      // alert(DateTime.fromISO(ss).toFormat('yyyy-MM'));
      this.$route.params['accounting_info_id'] = row.accounting_info_id;
      this.accounting_year = row.accounting_year;
      this.unincluding_price = row.unincluding_price;
      this.accounting_amount = row.accounting_amount;
      this.including_price = row.including_price;
      this.accounting_subjects_id = row.accounting_subjects_id;
      this.subjects_id = this.subjectsList[row.accounting_subjects_id];
      this.button_label = 'edit';
      // const updateData = {
      //   accounting_info_id: row.accounting_info_id,
      //   relation_code: row.relation_code,
      //   relation_name: row.relation_name,
      //   including_price: row.including_price,
      //   unincluding_price: row.unincluding_price,
      //   accounting_amount: row.accounting_amount,
      //   accounting_subjects_id: row.accounting_subjects_id
      // };

      // resource.editAccountingId(this.detail.maintenance_id, updateData).then(res => {
      //   this.detail.accounting_info = res;
      //   alert('更新に成功しました！');
      // });
    },

    deleteAccountingId(id) {
      if(confirm('削除していいですか？')) {
        var data = {
          maintenance_id: this.detail.maintenance_id,
        }      
        resource.deleteAccountingId(id, data).then(res => {
          this.detail.accounting_info = res;
        });
      } else{
        return;
      }
    },

    handleClose(){
      document.querySelector("#app > div > div.main-container > section > div > div.el-dialog__wrapper.slide-dialog-wrapper > div > div.el-dialog__body > div > div:nth-child(2) > div.el-dialog__wrapper.slide-dialog-wrapper").click();
    },

    formatterProgress(row, column) {
      return this.progress[row.progress_id] ?? '';
    },

    save() {
      var as_id = '';
      if(typeof this.subjects_id === 'string') as_id = this.accounting_subjects_id;
      else as_id = this.subjects_id;
      var unincluding_priceF, including_priceF, accounting_amountF, tmp, yearMonth;
      var ss = this.accounting_year;
      if (String(ss).length > 20) {
        tmp = this.accounting_year.toISOString();
        yearMonth = DateTime.fromISO(tmp).toFormat('yyyy-MM');
      }
      else {
        yearMonth = ss;
      }
      
      if(this.unincluding_price.includes('¥')){
        unincluding_priceF = this.unincluding_price;
      } else{
        unincluding_priceF = '¥' + this.unincluding_price;
      }

      if(this.accounting_amount.includes('¥')){
        accounting_amountF = this.accounting_amount;
      } else{
        accounting_amountF = '¥' + this.accounting_amount;
      }

      if(this.including_price.includes('¥')){
        including_priceF = this.including_price;
      } else{
        including_priceF = '¥' + this.including_price;
      }

      const insertData = {
        accounting_info_id: this.$route.params['accounting_info_id'],
        relation_code: this.relation_code,
        relation_name: this.relation_name,
        unincluding_price: unincluding_priceF,
        accounting_amount: accounting_amountF,
        including_price: including_priceF,
        accounting_year: yearMonth,
        editor: this.userName,
        accounting_subjects_id: as_id,
      };

      resource.createAccounting(this.detail.maintenance_id, insertData).then(res => {
        this.$route.params['accounting_info_id'] = 0;
        this.accounting_year = '';
        this.unincluding_price = '';
        this.accounting_amount = '';
        this.including_price = '';
        this.accounting_subjects_id = '';
        this.subjects_id = '';
        this.detail.accounting_info = res;
        this.detail.progress_id = this.progressId;
        this.detail.progress = {
          progress_id: this.progressId,
          status: this.progress[this.progressId],
          // updated_at: this.detail.maintenance_id,
        };
        this.button_label = '登録';
       
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
