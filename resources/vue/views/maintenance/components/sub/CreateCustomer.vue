<template>
  <div>
    <!-- {{this.id}} -->
    <!-- {{this.detail.customerInformation[this.detail.customerInformation.length - 1].TEL }} -->
    <!-- {{this.detail.customgroup_list}} -->
    <el-row :gutter="20">
      <el-col :span="15">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>取引先コード</th>
              <!-- <td class="select-td">
                <el-select  size="small" v-model="customer_code" placeholder="" clearable style="width: 100%" class="filter-item">
                  <el-option v-for="item in this.detail.customgroup_list1" :key="item.id" :label="item.customer_code" :value="item.customer_code" />
                </el-select>
              </td> -->
              <td class="input-td">
                <!-- <input value="" v-model="id" class="el-input__inner" style="display:none"/> -->
                <input
                  value=""
                  v-model="customer_code"
                  class="el-input__inner"
                />

                <!-- <select v-model="custom" style="width: 100%; height: 36px; border-color: #C0C4CC; line-height: 32px;" class="filter-item" placeholder="" clearable size="small">
                  <option v-for="option in detail.customerInformation" v-bind:value="{ id: option.customer_code, name: option.customer_name, tel: option.TEL, fax: option.FAX }" >
                    {{ option.customer_code }}
                  </option>
                </select> -->
              </td>
              <!-- <td class="input-td"><input value="110000060" /></td> -->
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
              <th>取引先名</th>
              <!-- <td class="select-td">
                <el-select  size="small" v-model="customer_name" placeholder="" clearable style="width: 100%" class="filter-item">
                  <el-option v-for="item in this.detail.customgroup_list2" :key="item.id" :label="item.customer_name" :value="item.customer_name" />
                </el-select>
              </td> -->
              <td class="input-td">
                <input
                  value=""
                  v-model="customer_name"
                  class="el-input__inner"
                />
                <!-- <input value="パナ産機（あじさい銀行）" /> -->
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
              <th>取引先名(カナ)</th>
              <td class="input-td">
                <input
                  value=""
                  v-model="customer_alias"
                  class="el-input__inner"
                />
                <!-- <input value="パナ産機（あじさい銀行）" /> -->
              </td>
              <!-- <td class="select-td">
                <el-select  size="small" v-model="customer_alias" placeholder="" clearable style="width: 100%" class="filter-item">
                  <el-option v-for="item in this.detail.customgroup_list3" :key="item.id" :label="item.customer_alias" :value="item.customer_alias" />
                </el-select>
              </td>               -->
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="0">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>区分コード</th>
              <td class="select-td">
                <el-select
                  size="small"
                  v-model="customergroup_code"
                  placeholder=""
                  clearable
                  style="width: 100%"
                  class="filter-item"
                  v-on:change="depart_name()"
                >
                  <el-option
                    v-for="item in this.detail.customgroup_list"
                    :key="item.id"
                    :label="item.customergroup_code"
                    :value="item.customergroup_code"
                  />
                </el-select>
              </td>
              <!-- <td class="input-td"><input value="" v-model="customergroup_code" class="el-input__inner"/></td> -->
              <!-- <td class="input-td"><input value="110000060" /></td> -->
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>区分</th>
              <!-- <td class="input-td"><input value="" v-model="customergroup" class="el-input__inner"/></td> -->
              <el-select
                size="small"
                v-model="customergroup"
                placeholder=""
                clearable
                style="width: 100%"
                class="filter-item"
              >
                <el-option
                  v-for="item in this.detail.customgroup_list"
                  :key="item.id"
                  :label="item.customergroup"
                  :value="item.customergroup"
                />
              </el-select>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>

    <el-row :gutter="0">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>TEL/FAX</th>
              <td class="input-td">
                <input
                  value=""
                  v-model="customer_tel"
                  class="el-input__inner"
                />
              </td>
              <!-- <td class="input-td"><input value="110000060" /></td> -->
              <!-- <td class="select-td">
                <el-select  size="small" v-model="customer_tel" placeholder="" clearable style="width: 100%" class="filter-item">
                  <el-option v-for="item in this.detail.customgroup_list4" :key="item.id" :label="item.TEL" :value="item.TEL" />
                </el-select>
              </td>               -->
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <td class="input-td">
                <input
                  value=""
                  v-model="customer_fax"
                  class="el-input__inner"
                />
              </td>
              <!-- <td class="select-td">
                <el-select  size="small" v-model="customer_fax" placeholder="" clearable style="width: 100%" class="filter-item">
                  <el-option v-for="item in this.detail.customgroup_list5" :key="item.id" :label="item.FAX" :value="item.FAX" />
                </el-select>
              </td>   -->
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row>
      <el-button type="info" size="small" @click="customsearchAgain()"
        >検索</el-button
      >
    </el-row>
    <div style="text-align: right; padding-bottom: 15px">
      <el-button type="primary" size="small" @click="select_one()"
        >選択</el-button
      >
      <el-button type="default" size="small" @click="close_createComponent()"
        >閉じる</el-button
      >
    </div>
    <table class="detail-table" v-if="this.selectedRow">
      <tr>
        <th style="width: 75px">NO</th>
        <th style="width: 111px">取引先コード</th>
        <th>取引先名</th>
        <th>取引先名(カナ)</th>
        <th style="width: 104px">区分コード</th>
        <th style="width: 125px">TEL</th>
        <th style="width: 125px">FAX</th>
      </tr>
      <template v-for="(citem, key) in this.custom">
        <tr
          :class="key === selectedRow ? 'custom-highlight-row' : ''"
          @click="rowSelect(key)"
        >
          <td align="center">{{ key + 1 }}</td>
          <td align="center">{{ citem.customer_code }}</td>
          <td align="center">{{ citem.customer_name }}</td>
          <td align="center">{{ citem.customer_alias }}</td>
          <td align="center">{{ citem.customergroup_code }}</td>
          <td align="center">{{ citem.TEL }}</td>
          <td align="center">{{ citem.FAX }}</td>
        </tr>
      </template>
    </table>
    <!-- <el-table
      :data="custom"
      :show-header="true"
    
      border
      style="width: 100%; margin: auto: display: none;"
    >
      <el-table-column align="center" prop="id" label="NO"></el-table-column>
      <el-table-column align="center" prop="customer_code" label="取引先コード"></el-table-column>
      <el-table-column align="center" prop="customer_name" label="取引先名"></el-table-column>
      <el-table-column align="center" prop="customer_alias" label="取引先名(カナ)"></el-table-column>
      <el-table-column align="center" prop="customergroup_code" label="区分コード"></el-table-column>
      <el-table-column align="center" prop="customergroup" label="区分"></el-table-column>
      <el-table-column align="center" prop="TEL" label="TEL"></el-table-column>
      <el-table-column align="center" prop="FAX" label="FAX"></el-table-column>
      <el-table-column align="center" label="FAX">
      <template slot-scope="scope">
        <el-button
          size="mini"
          @click="handleEdit(scope.$index, scope.row)">Edit</el-button>
        <el-button
          size="mini"
          type="danger"
          @click="handleDelete(scope.$index, scope.row)">Delete</el-button>
      </template>
      </el-table-column>
    </el-table> -->
    <!-- {{this.custom}} -->
    <!-- <template v-for="item in this.custom">

    </template> -->
  </div>
</template>
<style>
.el-table .warning-row {
  background: 'rgb(252, 230, 190)';
}

.el-table .success-row {
  background: 'rgb(252, 230, 190)';
}

.el-table .other-row {
  background: 'rgb(252, 230, 190)';
}

.custom-highlight-row {
  background-color: pink;
}

.close-css {
  display: none;
}
</style>
<script>
import MaintenanceResource from '@/api/maintenance';
import CurrencyInput from './CurrencyInput.vue';
import RequestInfoEdit from './RequestInfoEdit.vue';
import { MonthPickerInput } from 'vue-month-picker';
import { Datetime } from 'vue-datetime';
import { Settings } from 'luxon';
import { DateTime } from 'luxon';
const resource = new MaintenanceResource();

export default {
  components: { CurrencyInput, MonthPickerInput, RequestInfoEdit },
  props: {
    detail: {
      type: Object,
      default: () => {
        return {};
      },
    },
  },
  data() {
    return {
      selectedRow: this.$route.params['selectedRow'],
      tt: 353,
      accounting_year: new Date(),
      format: 'yyyy/MM/ddd',
      customer_code: '',
      custom: '',
      // customer_code: this.detail.customer_code,
      id: 0,
      citem: '',
      item: '',
      // detail: [],
      customer_name: '',
      customer_tel: '',
      customer_fax: '',
      customer_alias: '',
      customergroup_code: '',
      customergroup: '',
      faxedToClient: 0,
      faxedToShop: 0,
      progressId: 1,
      progress: {
        1: 'BM承認待ち',
        2: 'BM承認',
        3: 'BM差戻し',
        4: 'BM却下',
        5: 'BM保留',
        6: '本部受付前',
        7: '本部差戻し',
        8: '本部見送り',
        9: '依頼確定',
        10: '依頼済',
        11: '見積待ち',
        12: '見積精査中',
        13: '入荷待ち',
        14: 'DM承認待ち',
        15: '稟議中',
        16: '見積発注済み',
        17: '日程調整中',
        18: '訪問待ち',
        19: '報告待ち',
        20: '店完了',
        21: '取完了',
        22: '問合せ中',
      },
    };
  },
  created() {
    this.$store.dispatch('user/getInfo').then((user) => {
      this.userName = user.name;
    });
    console.log(RequestInfoEdit.data().createCustomerVisible);
  },
  mounted() {},
  methods: {
    close_createComponent() {
      document.querySelector('#app > div > div.main-container > section > div > div.el-row > div:nth-child(1) > div > div.el-card__body > div:nth-child(11) > div > div.el-dialog__body > div > div.el-dialog__wrapper').classList.add('close-css');
    },
    depart_name() {
      if (!this.customergroup_code) {
        this.customergroup = '';
        return;
      }
      resource.depart_name(this.customergroup_code).then((res) => {
        this.customergroup = res[0].customergroup;
      });
    },
    select_one() {
      this.detail.customer_code = this.custom[this.selectedRow].customer_code;
      this.detail.customerInformation[
        this.detail.customerInformation.length - 1
      ].customer_name = this.custom[this.selectedRow].customer_name;
      this.detail.customerInformation[
        this.detail.customerInformation.length - 1
      ].TEL = this.custom[this.selectedRow].TEL;
      this.detail.customerInformation[
        this.detail.customerInformation.length - 1
      ].FAX = this.custom[this.selectedRow].FAX;

      const updatedata = {
        id: this.custom[this.selectedRow].id,
        customer_code: this.custom[this.selectedRow].customer_code,
        customer_tel: this.custom[this.selectedRow].TEL,
        customer_alias: this.custom[this.selectedRow].customer_alias,
        customer_fax: this.custom[this.selectedRow].FAX,
        customergroup_code: this.custom[this.selectedRow].customergroup_code,
        customergroup: this.custom[this.selectedRow].customergroup,
        customer_name: this.custom[this.selectedRow].customer_name,
      };

      this.customer_code = '';
      this.customer_name = '';
      this.customer_tel = '';
      this.customer_alias = '';
      this.customer_fax = '';
      this.customergroup_code = '';
      this.customergroup = '';

      resource
        .customCodeSearch(this.custom[this.selectedRow].customer_code)
        .then((res) => {
          if (res == 0) {
            this.id = 0;
          } else this.id = res[res.length - 1].id;

          resource
            .update_customerid(this.detail.maintenance_id, updatedata)
            .then((res) => {
              console.log('custom_code select success');
            });
        });
    },
    rowSelect(idx) {
      console.dir(idx);
      this.selectedRow = idx;
    },

    formatterProgress(row, column) {
      return this.progress[row.progress_id] ?? '';
    },
    ultimateCustomSearch() {
      // customer_code = this.customer_code;
      const search_data = {
        // id: this.id,
        customer_code: this.customer_code,
        customer_name: this.customer_name,
        customer_tel: this.customer_tel,
        customer_alias: this.customer_alias,
        customer_fax: this.customer_fax,
        customergroup_code: this.customergroup_code,
        customergroup: this.customergroup,
      };
      resource
        .ultimateCustomSearch(this.detail.maintenance_id, search_data)
        .then((res) => {
          this.custom = res;
          this.selectedRow = -1;
        });
    },

    getPhotoFiles() {
      resource.getPhotoFiles(this.detail.maintenance_id).then((files) => {
        this.detail.photo_files = files;
      });
    },

    getReportFiles() {
      resource.getReportFiles(this.detail.maintenance_id).then((files) => {
        this.detail.report_files = files;
      });
    },
  },
};
</script>
<style lang="scss" scoped>
</style>
