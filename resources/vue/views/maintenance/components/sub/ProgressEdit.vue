<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>経過ステータス*</th>
              <td class="select-td">
                <el-select v-model="category1" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
                  <el-option :label="'----'" :value="1" />
                </el-select>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="11" :offset="3">
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
    <el-row>
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>写真</th>
              <td style="border:none;padding:0 5px;">
                <el-button type="info" size="small">ファイル選択</el-button>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>報告書</th>
              <td style="border:none;padding:0 5px;">
                <el-button type="info" size="small">ファイル選択</el-button>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="24">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>経過情報</th>
              <td style="padding:0 5px;">
                <textarea style="border:none;height:70px;width:100%">5月12日 13時訪問予定</textarea>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="1">
        <el-checkbox style="padding:10px" />
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tr>
            <th style="width:40px;">店</th>
            <th>訪問予定連絡</th>
            <td style="border:none;padding:0 5px;">
              <el-button type="info" size="small">プレビュー</el-button>
            </td>
          </tr>
        </table>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="1">
        <el-checkbox style="padding:10px" />
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tr>
            <th style="width:40px;">取</th>
            <th>進捗報告依頼</th>
            <td style="border:none;padding:0 5px;">
              <el-button type="info" size="small">プレビュー</el-button>
            </td>
          </tr>
        </table>
      </el-col>
    </el-row>
    <div style="text-align:right;">
      <el-button type="primary" size="small">登録</el-button>
      <el-button type="default" size="small">閉じる</el-button>
    </div>
    <el-table :data="tableData" :show-header="true" border style="width: 100%">
      <el-table-column align="center" prop="v1" label="日時" width="120px" />
      <el-table-column align="center" prop="v2" label="ステータス" width="100px" />
      <el-table-column align="center" prop="v3" label="入力者" width="100px" />
      <el-table-column align="center" prop="v4" label="コメント" />
      <el-table-column align="center" label="FAX送信">
        <el-table-column align="center" prop="v5" label="取" width="50px" />
        <el-table-column align="center" prop="v6" label="店" width="50px" />
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
      category1: 1,
      category2: 1,
      requestClass: 1,
      fileList: [
        'https://picsum.photos/id/0/300/200',
        'https://picsum.photos/id/1/300/200',
        'https://picsum.photos/id/2/300/200',
      ],
      tableData: [
        { v1: '2020/05/08 13:54:22', v2: '新規申請', v3: '渡辺', v4: '', v5: '', v6: '' },
        { v1: '2020/05/08 13:54:22', v2: '新規申請', v3: '渡辺', v4: '', v5: '', v6: '' },
        { v1: '2020/05/08 13:54:22', v2: '新規申請', v3: '渡辺', v4: '', v5: '', v6: '' },
        { v1: '2020/05/08 13:54:22', v2: '新規申請', v3: '渡辺', v4: '', v5: '', v6: '' },
        { v1: '2020/05/08 13:54:22', v2: '新規申請', v3: '渡辺', v4: '', v5: '', v6: '' },
        { v1: '2020/05/08 13:54:22', v2: '新規申請', v3: '渡辺', v4: '', v5: '', v6: '' },
      ],
    };
  },
  methods: {
  },
};
</script>

<style lang="scss" scoped>
  td {
    .el-button{
      // padding:6px 15px;
    }
  }
</style>
