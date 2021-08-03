<template>
  <div>
    <h3>基本情報</h3>

    <el-row :gutter="0">
      <el-col :span="12">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>店舗CD</th>
              <td style="text-align:center">1174</td>
              <td style="text-align:center">HS</td>
            </tr>
            <tr>
              <th>TEL</th>
              <td colspan="2" style="text-align:center">0533-66-6277</td>
            </tr>
            <tr>
              <th>開店日</th>
              <td colspan="2" style="text-align:center">2014/01/28</td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="12">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>店舗名</th>
              <td>蒲郡竹谷</td>
            </tr>
            <tr>
              <th>FAX</th>
              <td>0533-66-6277</td>
            </tr>
            <tr>
              <th>店舗担当</th>
              <td>高橋</td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-divider />
    <h3>担当者メール</h3>
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
    <div style="text-align:right;margin-top:10px;">
      <span>宛先とCC宛先、それぞれ選択してください。</span>
      <el-button type="primary" size="small">メーラー起動</el-button>
    </div>

    <el-divider />
    <h3>特記情報</h3>
    <table class="detail-table">
      <tbody>
        <tr>
          <th>特記①</th>
          <td>20’10/13〜10/25改装<br>浄化槽店舗</td>
        </tr>
        <tr>
          <th>特記②</th>
          <td>20’5/21エアコン全台清掃<br>駐車場案件は大和ハウス様へ</td>
        </tr>
      </tbody>
    </table>
    <div style="text-align:right;margin-top:10px;">
      <el-button type="primary" size="small">特記編集</el-button>
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
