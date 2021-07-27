<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <span>基本情報</span>
      <el-button style="float: right;" type="primary" size="small">担当者メール</el-button>
    </div>

    <el-row :gutter="20">
      <el-col :span="8">
        <el-table :data="tableData" :show-header="false" border style="width: 100%">
          <el-table-column align="center" prop="title" class-name="header-1" />
          <el-table-column align="center" prop="value" />
        </el-table>
      </el-col>
      <el-col :span="8">
        <el-table :data="tableData1" :show-header="false" border style="width: 100%">
          <el-table-column align="center" prop="title" class-name="header-1" />
          <el-table-column align="center" prop="value" />
        </el-table>
      </el-col>
      <el-col :span="8">
        <el-table :data="tableData2" :show-header="true" border style="width: 100%">
          <el-table-column align="center" prop="title" label="" class-name="header-1" />
          <el-table-column align="center" prop="value" label="名称" />
          <el-table-column align="center" prop="value1" label="担当者" />
        </el-table>
      </el-col>
    </el-row>
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
        {
          title: 'メンテナンスNo',
          value: '1234567890',
        },
        {
          title: '',
          value: '',
        },
        {
          title: '申請者',
          value: '北村　仁',
        },
        {
          title: '受付・更新',
          value: '2020/04/06 00:00',
        },
        {
          title: '申請者',
          value: '北村　仁',
        },
        {
          title: '受付・更新',
          value: '2020/04/06 00:00',
        },
      ],
      tableData1: [
        { title: '店舗CD', value: '1174   -    HS' },
        { title: '店舗名', value: '蒲郡竹谷' },
        { title: '開店日', value: '2014/01/28' },
        { title: 'TEL', value: '0533-66-6277' },
        { title: 'FAX', value: '0533-66-6277' },
        { title: '店舗担当', value: '高橋' },
      ],
      tableData2: [
        { title: '地域会社', value: '-', value1: '-' },
        { title: '営業部', value: '西日本', value1: '町野' },
        { title: 'ディストリクト', value: '東海', value1: '高木' },
        { title: 'ブロック', value: '東愛知', value1: '山田克' },
        { title: 'エリア', value: '安城', value1: '細川' },
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
