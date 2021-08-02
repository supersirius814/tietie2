<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span>見積情報</span>
      <el-button style="float: right; margin-left:10px;" type="primary" size="small" @click="createQuotation = true">見積登録</el-button>
      <el-button style="float: right;" type="info" size="small">報告書(1)</el-button>
      <el-button style="float: right;" type="info" size="small">写真(3)</el-button>
      <el-button style="float: right;" type="info" size="small">見積書(3)</el-button>
    </div>

    <el-table :data="tableData" :show-header="true" border style="width: 100%">
      <el-table-column align="center" prop="v1" label="日時" />
      <el-table-column align="center" prop="v2" label="金額" />
      <el-table-column align="center" prop="v3" label="摘要" />
      <el-table-column align="center" prop="v4" label="入力者" width="100" />
    </el-table>
    <el-dialog
      title="【見積情報】"
      :visible.sync="createQuotation"
      width="90%"
    >
      <create-quotation />
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="createQuotation = false">登録</el-button>
        <el-button @click="createQuotation = false">閉じる</el-button>
      </span>
    </el-dialog>
  </el-card>
</template>

<script>
import CreateQuotation from './sub/CreateQuotation.vue';

export default {
  components: { CreateQuotation },
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
      createQuotation: false,
      tableData: [
        { v1: '2020/05/15 18:00:00', v2: '200,000', v3: '作業後の訂正見積', v4: '川手' },
        { v1: '2020/05/15 18:00:00', v2: '200,000', v3: '作業後の訂正見積', v4: '川手' },
        { v1: '2020/05/15 18:00:00', v2: '200,000', v3: '作業後の訂正見積', v4: '川手' },
        { v1: '2020/05/15 18:00:00', v2: '200,000', v3: '作業後の訂正見積', v4: '川手' },
      ],
    };
  },
  methods: {
  },
};
</script>

<style >
.header-1{
  background: #eee;
}
.el-table th, .el-table td{
  padding: 5px 0;
}
</style>
