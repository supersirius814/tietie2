<template>

  <div>
    <!-- {{ pname }} -->

    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>請求元取引コード</th>
              <td  v-if="parents && parents.length > 0" class="input-td" >
                <input value="" v-model="pvalue" disabled class="el-input__inner"/>
              </td>
              <td v-else class="input-td"><input value="" v-model="detail.partner_code" disabled class="el-input__inner"/></td>

            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="3" style="display: none">
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
              <td  v-if="parents && parents.length > 0" class="select-td" >
                <el-select  size="small" v-model="pname" placeholder="" clearable style="width: 100%" class="filter-item" v-on:change="getPvalue()">
                  <el-option v-for="item in parents" :key="item.partner_id" :label="item.partner_name" :value="item.partner_name" />
                </el-select>
              </td>
              <td v-else class="input-td"><input value="" v-model="detail.partner_name" disabled class="el-input__inner"/></td>
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
                  <el-date-picker
                    v-model="accounting_year"
                    type="month"
                    format="yyyy/MM"
                  >
                  </el-date-picker>
                  	<!-- <vue-monthly-picker :monthLabels="localeMonth"	 v-model="accounting_year" /> -->
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
              <td  class="input-td">
                <InputNumber
                  @on-change="calUnin"
                  size="large"
                  style="width: 100%; font-family: Ionicons!important"
                  editable
                  v-model="unincluding_price"
                  :formatter="value => `¥ ${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',')"
                  :parser="value => value.replace(/\¥\s?|(,*)/g, '')"></InputNumber>
                <!-- <InputNumber
               
                  style="width: 100%"
                  size="large"
                  v-model="unincluding_price"
                  :formatter="value => `¥ ${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',')"
                  :parser="value => value.replace(/\$\s?|(,*)/g, '')">
                </InputNumber> -->
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
                <InputNumber
                  size="large"
                  style="width: 100%; font-family: Ionicons!important"
                  v-model="tax"
                  :editable="false"
                  :step="0"
                  :formatter="value => `¥ ${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',')"
                  :parser="value => value.replace(/\¥\s?|(,*)/g, '')"></InputNumber>
                <!-- ¥{{ accounting_amount }} -->
                <!-- <input v-model="tax" class="el-input__inner" disabled/> -->
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
                <InputNumber
                  @on-change="calIn"
                  size="large"
                  style="width: 100%"
                  v-model="including_price"
                  editable
                  :formatter="value => `¥ ${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',')"
                  :parser="value => value.replace(/\¥\s?|(,*)/g, '')"></InputNumber>
                <!-- <input v-model="including_price" class="el-input__inner" @change="calIn()"/> -->
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
              <td class="input-td">
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
      <el-table-column align="center" prop="accounting_year" label="会計年月" :formatter="formatterYear">
      </el-table-column>
      <el-table-column align="center" prop="unincluding_price" label="請求金額（税抜）" :formatter="formatterUnp">
        <!-- <template slot-scope="scope">
          <InputNumber
            v-model="scope.row.unincluding_price"
            :editable="false"
            :step="0"
            :formatter="value => `¥ ${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',')"
            :parser="value => value.replace(/\¥\s?|(,*)/g, '')"></InputNumber> -->
          <!-- <currency-input v-model="scope.row.unincluding_price" :options="{ currency: 'JPY' }" class="el-input__inner" /> -->
        <!-- </template> -->
      </el-table-column>
      <el-table-column align="center" prop="tax" label="消費税" :formatter="formatterTax">
        <!-- <template slot-scope="scope">
          <InputNumber
            v-model="scope.row.tax"
            :editable="false"
            :step="0"
            :formatter="value => `¥ ${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',')"
            :parser="value => value.replace(/\¥\s?|(,*)/g, '')"></InputNumber>
        </template> -->
      </el-table-column>
      <el-table-column align="center" prop="including_price" label="請求金額（税込）" class="input-td" :formatter="formatterInp">
        <!-- <template slot-scope="scope">
          <InputNumber
            v-model="scope.row.including_price"
            :editable="false"
            :step="0"
            :size="large"
            style="width: 100%"
            :formatter="value => `¥ ${value}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',')"
            :parser="value => value.replace(/\¥\s?|(,*)/g, '')"></InputNumber>
        </template> -->
      </el-table-column>
      <el-table-column align="center" prop="accounting_subject_id" label="科目" :formatter="formatterSubject">
        <!-- <template slot-scope="scope">
          <el-input v-model="scope.row.accounting_subjects_id" placeholder=""/>
        </template> -->
      </el-table-column>
      <el-table-column align="center" prop="accounting_info.name" label="入力者">
      </el-table-column>
      <el-table-column align="center" label="編集/削除" >
          <template slot-scope="scope">
            <div style="display: inline-flex; padding 0px; margin: 0px">

                  <el-button size="small" type="primary" @click="editAccountingId(scope.row)"  style="background-color: transparent; padding: 0px; margin: 0px;
          border: 0px;"><i class="material-icons" style="font-family: Material Icons!important; font-size:30px;color:#1890ff">&#xe254;</i></el-button>


                  <el-button size="small" type="primary" @click="deleteAccountingId(scope.row.accounting_info_id)" style="background-color: transparent; padding: 0px; margin: 0px;
          border: 0px;"><i class="material-icons" style="font-family: Material Icons!important; font-size:30px;color:red">&#xe92b;</i></el-button>
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
      pvalue: '',
      pname: '',
      parents: [],
      button_label: '登録',
      value: null,
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
      userId: '',
      tax: 0,
      including_price: 0,
      unincluding_price: 0,
      partner_name: '',
      partner_id: '',
      accounting_subject_id: '',
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
    this.getParents();
    this.$store.dispatch('user/getInfo').then(user => {
      this.userId = user.id;
      this.userName = user.name;
    });
    
  },
  mounted() {
    this.getAccountingSubjects();
    
    // this.$root.$on('ClassHistory', () => {
    //     // your code goes here
    //     this.getList()
    // });

    // this.$root.$on('StoreHistory', () => {
    //     // your code goes here
    //     this.getList()
    // });
    // alert(this.$route.params['accounting_info_id']);
  },
  methods: {
    getPvalue(){
      this.parents.forEach(el => {
        console.log(this.pvalue);
        if(el.partner_name == this.pname){
          this.pvalue = el.partner_code;
          return;
        }
      });
    },
    formatterYear(row, column){
      var year = row.accounting_year;
      var year_arr;
      if(year != '' && year != null){
        year_arr = year.split('-');
        return year_arr[0] + '/' + year_arr[1];
      }

      return;
    },

    formatterInp(row, column){
      var rowValue = row.including_price;
      rowValue = `¥ ${rowValue}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
      return rowValue;
    },

    formatterUnp(row, column){
      var rowValue = row.unincluding_price;
      rowValue = `¥ ${rowValue}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
      return rowValue;
    },

    formatterTax(row, column){
      var rowValue = row.tax;
      rowValue = `¥ ${rowValue}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
      return rowValue;
    },
    formatterSubject(row, column){
      if(row.accounting_subject_id == '') return;
      else {
        return this.subjectsList[row.accounting_subject_id];
      }
    },
    getParents(){
        var data = {
          partner_code: this.detail.partner_code,
        };
        resource.getParents(data).then(res => {
          this.parents = res;
          // if(this.parents.length > 0) this.chkparent = true;
          // console.log(res);
        });
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
        // console.log(this.subjectsList);
      });
    },

    calUnin() {
      this.tax = (this.unincluding_price * 0.1).toFixed(0);
      this.including_price = (this.unincluding_price * 1.1).toFixed(0);
    },
    calIn() {
      this.unincluding_price = (this.including_price / 1.1).toFixed(0);
      this.tax = (this.including_price / 1.1 * 0.1).toFixed(0);      
    },
    calTax() {
      this.unincluding_price = (this.tax * 10).toFixed(0);
      this.including_price = (this.tax * 11).toFixed(0);
    },
    calTaxdd(row) {

      if(row.unincluding_price.includes('¥')){
        row.tax = '¥' + Number((row.unincluding_price.split('¥')[1] * 0.1).toFixed(0)) ;
        row.including_price = '¥' +  Number((row.unincluding_price.split('¥')[1] * 1.1).toFixed(0));
      } else{
        row.tax = '¥' + Number((row.unincluding_price * 0.1).toFixed(0));
        row.including_price = '¥' +  Number((row.unincluding_price * 1.1).toFixed(0));
        row.unincluding_price = '¥' + row.unincluding_price;
      }
    },
    editAccountingId(row){
      // var ss = this.accounting_year.toISOString();
      // alert(DateTime.fromISO(ss).toFormat('yyyy-MM'));
      this.partner_id = row.partner_id;
      this.partner_name = row.partner_name;
      this.$route.params['accounting_info_id'] = row.accounting_info_id;
      this.accounting_year = row.accounting_year;
      this.unincluding_price = row.unincluding_price;
      this.tax = row.tax;
      this.including_price = row.including_price;
      this.accounting_subject_id = row.accounting_subject_id;
      this.subjects_id = this.subjectsList[row.accounting_subject_id];
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
      // if(this.partner_id == ''){
      //   alert('入力フィールドを確認してください！');
      //   return;
      // }
      // alert(this.subjects_id); return;
      var as_id = '';
      if(typeof this.subjects_id === 'string') as_id = this.accounting_subject_id;
      else as_id = this.subjects_id;
      var tmp, yearMonth;
      var ss = this.accounting_year;
      if (String(ss).length > 20) {
        tmp = this.accounting_year.toISOString();
        yearMonth = DateTime.fromISO(tmp).toFormat('yyyy-MM');
      }
      else {
        yearMonth = ss;
      }
      
      var partner_id, partner_name;
      if(this.parents && this.parents.length > 0){
        partner_id = this.pvalue;
        partner_name = this.pname;
      } else{
        partner_id = this.detail.partner_id;
        partner_name = this.detail.partner_name;
      }
      const insertData = {
        accounting_info_id: this.$route.params['accounting_info_id'],
        partner_id: partner_id,
        partner_name: partner_name,
        unincluding_price: this.unincluding_price,
        tax: this.tax,
        including_price: this.including_price,
        accounting_year: yearMonth,
        modified_by: this.userId,
        accounting_subject_id: as_id,
      };


      resource.createAccounting(this.detail.maintenance_id, insertData).then(res => {

        this.$route.params.accounting_ym = true;

        this.$route.params['accounting_info_id'] = 0;
        this.accounting_year = '';
        this.unincluding_price = '';
        this.tax = '';
        this.partner_id = '';
        this.partner_name = '';
        this.including_price = '';
        this.accounting_subject_id = '';
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
