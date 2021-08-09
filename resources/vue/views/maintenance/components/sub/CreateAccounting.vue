<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>請求元取引コード</th>
              <td class="input-td"><input value="110000060"></td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="3">
        <el-button type="info" size="small">検索</el-button>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="15">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>請求元取引先名</th>
              <td class="input-td"><input value="パナ産機（あじさい銀行）"></td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>会計年月</th>
              <td class="input-td"><input></td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>請求金額（税抜）</th>
              <td class="input-td"><input></td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>消費税</th>
              <td class="input-td"><input></td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>請求金額（税込）</th>
              <td class="input-td"><input></td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>科目</th>
              <td class="input-td"><input></td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-table :data="tableData" :show-header="true" border style="width: 100%; margin:auto;">
      <el-table-column align="center" prop="date" label="会計年月">
        <template slot-scope="scope">
          <el-input v-model="scope.row.date" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="amount" label="請求金額（税抜）">
        <template slot-scope="scope">
          <el-input v-model="scope.row.amount" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="description" label="消費税">
        <template slot-scope="scope">
          <el-input v-model="scope.row.description" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="quotation" label="請求金額（税込）">
        <template slot-scope="scope">
          <el-input v-model="scope.row.quotation" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="photo" label="科目">
        <template slot-scope="scope">
          <el-input v-model="scope.row.photo" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="report" label="入力者">
        <template slot-scope="scope">
          <el-input v-model="scope.row.report" placeholder="" />
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
        { date: '2020/05/12 16:00:00', amount: '20000', description: '作業後の訂正見積', quotation: '1', photo: '1', report: '1', editor: '川手' },
        { date: '2020/05/12 16:00:00', amount: '20000', description: '作業後の訂正見積', quotation: '1', photo: '1', report: '1', editor: '川手' },
      ],
    };
  },
  methods: {
  },
};
</script>
<style lang="scss" scoped>
</style>
