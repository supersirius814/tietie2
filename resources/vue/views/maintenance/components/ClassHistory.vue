<template>
  <div>
    <h3>同一中分類過去履歴</h3>

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
    <div style="text-align:center;margin-top:10px;">
      <el-pagination
        background
        layout="prev, pager, next"
        :total="1000"
      />
    </div>
  </div>
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
        { v1: '', v2: '', v3: '', v4: '', v5: '', v6: '', v7: '', v8: '', v9: '' },
        { v1: '', v2: '', v3: '', v4: '', v5: '', v6: '', v7: '', v8: '', v9: '' },
        { v1: '', v2: '', v3: '', v4: '', v5: '', v6: '', v7: '', v8: '', v9: '' },
        { v1: '', v2: '', v3: '', v4: '', v5: '', v6: '', v7: '', v8: '', v9: '' },
      ],
    };
  },
  methods: {
  },
};
</script>
