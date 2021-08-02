<template>
  <div>
    <el-table :data="tableData" :show-header="true" border style="width: 100%; margin:auto;">
      <el-table-column align="center" prop="title" class-name="header-1" label="" />
      <el-table-column align="center" prop="name" label="名称" />
      <el-table-column align="center" prop="manager" label="担当者" />
      <el-table-column align="center" prop="to" label="メール宛先">
        <template slot-scope="scope">
          <el-checkbox v-model="scope.row.to" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="cc" label="メールCC">
        <template slot-scope="scope">
          <el-checkbox v-model="scope.row.cc" />
        </template>
      </el-table-column>
    </el-table>
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
        { title: '地域会社', name: '-', manager: '-', to: false, cc: false },
        { title: '営業部', name: '西日本', manager: '町野', to: false, cc: false },
        { title: 'ディストリクト', name: '東海', manager: '高木', to: false, cc: false },
        { title: 'ブロック', name: '東愛知', manager: '山田克', to: false, cc: false },
        { title: 'エリア', name: '安城', manager: '細川', to: false, cc: false },
      ],
    };
  },
  methods: {
  },
};
</script>
