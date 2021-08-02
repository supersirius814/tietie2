<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>日時</th>
              <td class="input-td"><input></td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="9" :offset="5">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>入力者</th>
              <td>川手</td>
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
              <th>金額</th>
              <td class="input-td"><input></td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="15">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>摘要</th>
              <td class="input-td"><input></td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="15">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>見積書</th>
              <td style="padding:0 5px; border:none;">
                <el-upload class="upload-demo" action="#">
                  <el-button size="small" type="info">ファイル選択</el-button>
                </el-upload>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="15">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>写真</th>
              <td style="padding:0 5px; border:none;">
                <el-upload class="upload-demo" action="#">
                  <el-button size="small" type="info">ファイル選択</el-button>
                </el-upload>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="15">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>報告書</th>
              <td style="padding:0 5px; border:none;">
                <el-upload class="upload-demo" action="#">
                  <el-button size="small" type="info">ファイル選択</el-button>
                </el-upload>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-table :data="tableData" :show-header="true" border style="width: 100%; margin:auto;">
      <el-table-column align="center" prop="date" label="日時">
        <template slot-scope="scope">
          <el-input v-model="scope.row.date" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="amount" label="金額">
        <template slot-scope="scope">
          <el-input v-model="scope.row.amount" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="description" label="摘要">
        <template slot-scope="scope">
          <el-input v-model="scope.row.description" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="quotation" label="見積書">
        <template slot-scope="scope">
          <el-input v-model="scope.row.quotation" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="photo" label="写真">
        <template slot-scope="scope">
          <el-input v-model="scope.row.photo" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="report" label="報告書">
        <template slot-scope="scope">
          <el-input v-model="scope.row.report" placeholder="" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="editor" label="入力者">
        <template slot-scope="scope">
          <el-input v-model="scope.row.editor" placeholder="" />
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
        { date: '', amount: '', description: '', quotation: '', photo: '', report: '', editor: '' },
        { date: '', amount: '', description: '', quotation: '', photo: '', report: '', editor: '' },
        { date: '', amount: '', description: '', quotation: '', photo: '', report: '', editor: '' },
      ],
    };
  },
  methods: {
  },
};
</script>
<style lang="scss" scoped>
</style>
