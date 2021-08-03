<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span>会計情報</span>
      <el-button style="float: right;" type="primary" size="small" @click="createAccounting = true">会計登録</el-button>
    </div>

    <el-table :data="tableData" :show-header="true" border style="width: 100%">
      <el-table-column align="center" prop="v1" label="会計年月" />
      <el-table-column align="center" prop="v2" label="請求金額（税抜）" />
      <el-table-column align="center" prop="v3" label="消費税" />
      <el-table-column align="center" prop="v4" label="請求金額（税込）" />
      <el-table-column align="center" prop="v5" label="科目" />
      <el-table-column align="center" prop="v6" label="入力者" width="100" />
    </el-table>
    <el-dialog
      title="【会計情報】"
      :visible.sync="createAccounting"
      width="1100px"
    >
      <create-accounting />
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="createAccounting = false">登録</el-button>
        <el-button @click="createAccounting = false">閉じる</el-button>
      </span>
    </el-dialog>

  </el-card>
</template>

<script>
import CreateAccounting from './sub/CreateAccounting.vue';

export default {
  components: { CreateAccounting },
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
  },
};
</script>
