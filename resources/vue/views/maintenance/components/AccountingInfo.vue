<template>
  <div>
    <h3>会計情報</h3>

    <el-table
      :data="detail.accounting_info"
      :show-header="true"
      border
      style="width: 100%"
    >
      <el-table-column align="center" prop="accounting_year" label="会計年月" />
      <el-table-column
        align="center"
        prop="unincluding_price"
        label="請求金額（税抜）"
        :formatter="formatterUnp"
      />
      <el-table-column
        align="center"
        prop="tax"
        label="消費税"
        :formatter="formatterTax"
      >
      </el-table-column>
      <el-table-column
        align="center"
        prop="including_price"
        label="請求金額（税込）"
        :formatter="formatterInp"
      />
      <el-table-column align="center" prop="accounting_subject_id" label="科目" :formatter="formatterSubject"/>
      <el-table-column
        align="center"
        prop="accounting_info.name"
        label="入力者"
        width="100"
      />
    </el-table>
    <div style="margin: 5px 0">
      <el-button
        style="float: right"
        type="primary"
        size="small"
        @click="createAccountingChange()"
        >会計登録</el-button
      >
    </div>
    <el-dialog
      title="【会計情報】"
      :visible.sync="createAccounting"
      :width="editdialogWidth"
      custom-class="slide-dialog"
      top="0px"
      :modal="false"
    >
      <create-accounting :detail="detail" />
      <!-- <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="createAccounting = false">登録</el-button>
        <el-button @click="createAccounting = false">閉じる</el-button>
      </span> -->
    </el-dialog>
  </div>
</template>

<script>
import CreateAccounting from './sub/CreateAccounting.vue';
import MaintenanceResource from '@/api/maintenance';
import CurrencyInput from './sub/CurrencyInput.vue';

const resource = new MaintenanceResource();

export default {
  components: { CreateAccounting, CurrencyInput },
  props: {
    detail: {
      type: Object,
      default: () => {
        return {};
      },
    },
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
        item: '',
        subjects: [],   
      createAccounting: false,
      subjectsList: {
        1: '科目１',
        2: '科目2',
        3: '科目3',
      },
      editdialogWidth: '43%',
      tableData: [
        { v1: '2020/05/15', v2: '', v3: '', v4: '', v5: '', v6: '' },
        { v1: '2020/05/15', v2: '', v3: '', v4: '', v5: '', v6: '' },
        { v1: '2020/05/15', v2: '', v3: '', v4: '', v5: '', v6: '' },
        { v1: '2020/05/15', v2: '', v3: '', v4: '', v5: '', v6: '' },
      ],
    };
  },

  created(){
    // this.getAccountingSubjects();
  },

  mounted() {
    if(this.isMobile()) {
      this.editdialogWidth = '100%';
    }
    
  },

  methods: {
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
      return this.subjectsList[row.accounting_subject_id]
    },
    isMobile() {
      var check = true;
      if(document.querySelector("body").clientWidth > 737) check = false;
      return check;
    },

    createAccountingChange(){
      this.createAccounting = true;
      // this.$route.params['accounting_info_id'] = 0;
    },

    // formatterCurrency(row, column) {
    //   if (row.unincluding_price == null) return;
    //   return '¥' + row.unincluding_price;
    // },

    // formatterCurrency1(row, column) {
    //   if (row.accounting_amount == null) return;
    //   return '¥' + row.accounting_amount;
    // },

    // formatterCurrency2(row, column) {
    //   if (row.including_price == null) return;
    //   return '¥' + row.including_price;
    // },
  },
};
</script>
