<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span>同一中分類過去履歴</span>
      <el-button style="float: right;" type="primary" size="small">店舗過去履歴</el-button>
    </div>

    <el-table :data="tableData" :show-header="true" border style="width: 100%">
      <el-table-column align="center" prop="v1" label="緊/重" />
      <el-table-column align="center" prop="v2" label="メンテナンスNo" />
      <el-table-column align="center" prop="v3" label="ステータス" />
      <el-table-column align="center" prop="v4" label="依頼日" />
      <el-table-column align="center" prop="v5" label="完了日" />
      <el-table-column align="center" prop="v6" label="取引先名" />
      <el-table-column align="center" prop="v7" label="依頼内容" />
      <el-table-column align="center" prop="v8" label="会計年月" />
      <el-table-column align="center" prop="v9" label="請求金額（税抜）" />
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
        { v1: '緊急', v2: '0000345678', v3: '取完了', v4: '2020/04/07', v5: '2020/04/09', v6: 'パナソニック産機システムズ', v7: '事務所のエアコンから水漏れ', v8: '2020/04', v9: '¥35,000' },
        { v1: '緊急', v2: '0000345678', v3: '取完了', v4: '2020/04/07', v5: '2020/04/09', v6: 'パナソニック産機システムズ', v7: '事務所のエアコンから水漏れ', v8: '2020/04', v9: '¥35,000' },
        { v1: '緊急', v2: '0000345678', v3: '取完了', v4: '2020/04/07', v5: '2020/04/09', v6: 'パナソニック産機システムズ', v7: '事務所のエアコンから水漏れ', v8: '2020/04', v9: '¥35,000' },
        { v1: '緊急', v2: '0000345678', v3: '取完了', v4: '2020/04/07', v5: '2020/04/09', v6: 'パナソニック産機システムズ', v7: '事務所のエアコンから水漏れ', v8: '2020/04', v9: '¥35,000' },
        { v1: '緊急', v2: '0000345678', v3: '取完了', v4: '2020/04/07', v5: '2020/04/09', v6: 'パナソニック産機システムズ', v7: '事務所のエアコンから水漏れ', v8: '2020/04', v9: '¥35,000' },
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
