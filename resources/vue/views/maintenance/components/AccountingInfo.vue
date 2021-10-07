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
        :formatter="formatterCurrency"
      />
      <el-table-column
        align="center"
        prop="accounting_amount"
        label="消費税"
        :formatter="formatterCurrency1"
      />
      <el-table-column
        align="center"
        prop="including_price"
        label="請求金額（税込）"
        :formatter="formatterCurrency2"
      />
      <el-table-column align="center" prop="employee" label="科目" />
      <el-table-column
        align="center"
        prop="editor"
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
      width="43%"
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

export default {
  components: { CreateAccounting },
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
      createAccounting: false,
      tableData: [
        { v1: '2020/05/15', v2: '', v3: '', v4: '', v5: '', v6: '' },
        { v1: '2020/05/15', v2: '', v3: '', v4: '', v5: '', v6: '' },
        { v1: '2020/05/15', v2: '', v3: '', v4: '', v5: '', v6: '' },
        { v1: '2020/05/15', v2: '', v3: '', v4: '', v5: '', v6: '' },
      ],
    };
  },

  methods: {
    createAccountingChange(){
      this.createAccounting = true;
      document.querySelector("#app > div > div.main-container > section > div > div.el-dialog__wrapper.slide-dialog-wrapper > div > div.el-dialog__body > div > div:nth-child(2) > div.el-dialog__wrapper.slide-dialog-wrapper").classList.remove('close-css');
    },
    formatterCurrency(row, column) {
      if (row.unincluding_price == null) return;
      return '¥' + row.unincluding_price;
    },
    formatterCurrency1(row, column) {
      if (row.accounting_amount == null) return;
      return '¥' + row.accounting_amount;
    },
    formatterCurrency2(row, column) {
      if (row.including_price == null) return;
      return '¥' + row.including_price;
    },
  },
};
</script>
