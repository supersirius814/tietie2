<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span>特記情報 </span>
      <el-button style="float: right;" type="primary" size="small">特記編集</el-button>
    </div>

    <el-table :data="tableData" :show-header="false" border style="width: 100%" height="205">
      <el-table-column align="center" prop="title" width="100" class-name="header-1" />
      <el-table-column align="center" prop="value" />
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
        { title: '特記①', value: '20’10/13〜10/25改装 浄化槽店舗' },
        { title: '特記②', value: '20’5/21エアコン全台清掃 駐車場案件は大和ハウス様へ' },
      ],
    };
  },
  methods: {
  },
};
</script>
