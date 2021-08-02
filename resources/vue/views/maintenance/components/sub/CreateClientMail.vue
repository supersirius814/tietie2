<template>
  <div>
    <el-table :data="tableData" :show-header="true" border style="width: 100%; margin:auto;">
      <el-table-column align="center" prop="title" label="担当者" />
      <el-table-column align="center" prop="title" label="メール宛先">
        <template slot-scope="scope">
          <el-checkbox v-model="scope.row.value" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="title" label="メールCC">
        <template slot-scope="scope">
          <el-checkbox v-model="scope.row.value1" />
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
        {
          title: '町野',
          value: false,
          value1: false,
        },
        {
          title: '高木',
          value: false,
          value1: false,
        },
        {
          title: '山田克',
          value: false,
          value1: false,
        },
        {
          title: '細川',
          value: false,
          value1: false,
        },
      ],
    };
  },
  methods: {
  },
};
</script>
