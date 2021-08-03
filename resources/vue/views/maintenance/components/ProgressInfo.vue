<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span>基本情報</span>
      <el-button style="float: right;" type="primary" size="small">登録</el-button>
    </div>

    <el-table :data="tableData" :show-header="true" border style="width: 100%">
      <el-table-column align="center" prop="v1" label="日時" />
      <el-table-column align="center" prop="v2" label="ステータス" />
      <el-table-column align="center" prop="v3" label="経過情報" />
      <el-table-column align="center" label="FAX送信">
        <el-table-column align="center" prop="v4" label="取" width="50" />
        <el-table-column align="center" prop="v5" label="店" width="50" />
      </el-table-column>
      <el-table-column align="center" prop="v6" label="入力者" width="100" />
    </el-table>

  </el-card>
</template>

<script>

export default {
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
      tableData: [
        { v1: '2020/05/15 18:00:00', v2: '入荷待ち', v3: 'パナ訪問。ガス漏れ調査実施', v4: '済', v5: '済', v6: '川手' },
        { v1: '2020/05/15 18:00:00', v2: '入荷待ち', v3: 'パナ訪問。ガス漏れ調査実施', v4: '済', v5: '済', v6: '川手' },
        { v1: '2020/05/15 18:00:00', v2: '入荷待ち', v3: 'パナ訪問。ガス漏れ調査実施', v4: '済', v5: '済', v6: '川手' },
        { v1: '2020/05/15 18:00:00', v2: '入荷待ち', v3: 'パナ訪問。ガス漏れ調査実施', v4: '済', v5: '済', v6: '川手' },
        { v1: '2020/05/15 18:00:00', v2: '入荷待ち', v3: 'パナ訪問。ガス漏れ調査実施', v4: '済', v5: '済', v6: '川手' },
      ],
    };
  },
  methods: {
  },
};
</script>
