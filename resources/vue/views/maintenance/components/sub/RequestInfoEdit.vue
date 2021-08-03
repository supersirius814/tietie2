<template>
  <div>
    <el-checkbox :v-model="true" label="緊急・重要" />
    <el-checkbox :v-model="true" label="災害（地震・台風・大雨など）" />
    <br>
    <br>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>大分類*</th>
              <td class="select-td">
                <el-select v-model="category1" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
                  <el-option :label="'空調'" :value="1" />
                </el-select>
              </td>
            </tr>
            <tr>
              <th>中分類*</th>
              <td class="select-td">
                <el-select v-model="category2" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
                  <el-option :label="'エアコン'" :value="1" />
                </el-select>
              </td>
            </tr>
          </tbody>
        </table>
        <table class="detail-table">
          <tbody>
            <tr>
              <th>依頼区分*</th>
              <td class="select-td">
                <el-select v-model="category2" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
                  <el-option :label="'修理依頼'" :value="1" />
                </el-select>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="14">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>取引先コード</th>
              <td>11000000060</td>
              <td style="border:none;padding:0 5px;">
                <el-button type="info" size="small" @click="createMailVisible = true">検索</el-button>
              </td>
            </tr>
          </tbody>
        </table>
        <table class="detail-table">
          <tbody>
            <tr>
              <th>取引先名</th>
              <td colspan="2">パナソニック産機システムズ</td>
            </tr>
            <tr>
              <th>TEL/FAX</th>
              <td>0533-66-6277</td>
              <td>0533-66-6277</td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <table class="detail-table">
      <tbody>
        <tr>
          <th>依頼内容*</th>
          <td>AC2系統（客席）でP15エラー表示。冷えない。至急手配お願いいたします。AC2系統（客席）でP15エラー表示。冷えない。至急手配お願いいたします。AC2系統（客席）でP15エラー表示。冷えない。P15エラー表示。冷えない。至急手配お願いいたします。</td>
        </tr>
        <tr>
          <th>備考</th>
          <td>完全ガス欠</td>
        </tr>
      </tbody>
    </table>
    <table class="detail-table">
      <tbody>
        <tr>
          <th rowspan="5">案件情報</th>
          <th>系統</th>
          <td>AC2</td>
          <th>原因</th>
          <td>AC2</td>
        </tr>
        <tr>
          <th>発生現象</th>
          <td>エラー</td>
          <th>原因箇所</th>
          <td>AC2</td>
        </tr>
        <tr>
          <th>エラーコード</th>
          <td>P15</td>
          <th>&nbsp</th>
          <td>AC2</td>
        </tr>
        <tr>
          <th>発生現象</th>
          <td>エラー</td>
          <th>原因箇所</th>
          <td>AC2</td>
        </tr>
        <tr>
          <th>エラーコード</th>
          <td>P15</td>
          <th>&nbsp</th>
          <td>AC2</td>
        </tr>
      </tbody>
    </table>
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
        { title: '特記①', value: '20’10/13〜10/25改装 浄化槽店舗' },
        { title: '特記②', value: '20’5/21エアコン全台清掃 駐車場案件は大和ハウス様へ' },
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
