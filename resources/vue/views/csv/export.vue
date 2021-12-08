<template>
  <div class="app-container documentation-container">
    <h1>CSVエクスポート</h1>
    <!-- <el-row :gutter="20">
      <el-col :span="3">
        <el-select v-model="tableName"  filterable  class="filter-item">
            <el-option label="従業員情報" value="users" />
            <el-option label="店舗情報" value="shops" />
            <el-option label="ディストリクト情報" value="districts" />
            <el-option label="ブロック情報" value="blocks" />
            <el-option label="お取引先様情報" value="clients" />
        </el-select>
      </el-col>
      <el-col :span="6">
        <a :href="'/api/v2/maintenance/csv/export?table=' + tableName">
          <el-button v-if="tableName" class="filter-item" type="primary"  @click="csvExport()">
            エクスポート
          </el-button>
          <el-button v-else class="filter-item" type="primary"  @click="csvExport()" disabled>
            エクスポート
          </el-button>
        </a>
      </el-col>
    </el-row> -->

    <!-- table to export csv -->
    <div class="filter-container">
      <ul class="list-inline">
        <!-- <li class="pull-right"> -->
        <el-date-picker
          class="filter-item"
          style="width: 270px"
          range-separator="~"
          format="yyyy/MM/dd"
          value-format="yyyy/MM/dd"
          v-model="stTocomplete"
          type="daterange"
          align="right"
          @change="selectsc"
          unlink-panels
        >
        </el-date-picker>
        <ElSelectAll
          v-model="query.progress_id"
          clearable
          filterable
          multiple
          collapse-tags
          :options="mdoptionsList"
          placeholder="ステータス"
          class="filter-item"
          v-on:change="loadTable()"
        />
        <el-select
          v-model="query.business_category_id"
          placeholder="業態"
          filterable
          clearable
          class="filter-item"
          @change="getShops"
          v-on:change="loadTable()"
        >
          <el-option label="全業態" :value="0" />
          <el-option label="ZHD" :value="1" />
          <el-option label="SK" :value="2" />
          <el-option label="GFF" :value="3" />
          <el-option label="TOJ" :value="4" />
          <el-option label="ST" :value="5" />
          <el-option label="ON" :value="6" />
          <el-option label="TA" :value="7" />
          <el-option label="IY" :value="8" />
          <el-option label="JP" :value="9" />
          <el-option label="JO" :value="10" />
          <el-option label="Q" :value="11" />
          <el-option label="PC" :value="12" />
          <el-option label="GM" :value="13" />
          <el-option label="TK" :value="14" />
          <el-option label="N-事・TC" :value="15" />
          <el-option label="N" :value="16" />
          <el-option label="C" :value="17" />
          <el-option label="HS" :value="18" />
          <el-option label="ET" :value="19" />
          <el-option label="TJ" :value="20" />
          <el-option label="TJミート" :value="21" />
          <el-option label="G" :value="22" />
          <el-option label="IB" :value="23" />
          <el-option label="NIB" :value="24" />
          <el-option label="YCP" :value="25" />
          <el-option label="BB" :value="26" />
          <el-option label="VS" :value="27" />
          <el-option label="MW" :value="28" />
          <el-option label="SB" :value="29" />
          <el-option label="ZE" :value="30" />
          <el-option label="HY" :value="31" />
          <el-option label="WY" :value="32" />
          <el-option label="NBK" :value="33" />
          <el-option label="ML" :value="34" />
          <el-option label="MC" :value="35" />
          <el-option label="UV" :value="36" />
          <el-option label="ZR" :value="37" />
          <el-option label="YTS" :value="38" />
          <el-option label="KA" :value="39" />
          <el-option label="VF" :value="40" />
          <el-option label="TR" :value="41" />
          <el-option label="KH" :value="42" />
          <el-option label="MF" :value="43" />
          <el-option label="KN" :value="44" />
          <el-option label="RHI" :value="45" />
          <el-option label="SLS" :value="46" />
          <el-option label="HL" :value="47" />
          <el-option label="ZCE" :value="48" />
          <el-option label="ATK" :value="49" />
          <el-option label="FCO" :value="50" />
          <el-option label="FMA" :value="51" />
          <el-option label="AVN" :value="52" />
          <el-option label="MRC" :value="53" />
          <el-option label="DEL" :value="54" />
          <el-option label="MY" :value="55" />
          <el-option label="YG" :value="56" />
          <el-option label="JF" :value="57" />
          <el-option label="ME" :value="58" />
        </el-select>
        <el-select
          v-model="query.shop_id"
          placeholder="店舗"
          clearable
          style="width: 100px"
          class="filter-item"
        >
          <el-option label="全店舗" :value="0" />
          <el-option
            v-for="item in shops"
            :key="item.shop_id"
            :label="item.shop_name"
            :value="item.shop_id"
          />
        </el-select>
        <el-button class="filter-item" type="primary" @click="exportFile()"
          >エクスポート</el-button
        >
        <!-- </li> -->
      </ul>
    </div>
    <!-- <div class="table-panel">
      <el-radio-group v-model="exportType">
        <el-radio
          v-for="(item, index) in supportType"
          :key="index"
          :label="item"
          border
          >{{ item }}</el-radio
        >
      </el-radio-group>
      <el-button class="export-it" type="primary" @click="exportFile()"
        >Export it !</el-button
      >
    </div> -->
    <el-row>
      <template>
        <el-table
          id="datatable"
          ref="elTable"
          style="width: 100%"
          stripe
          v-loading="loading"
          :data="list"
          border
          fit
          highlight-current-row
          max-height="650"
        >
          <el-table-column
            align="center"
            label="メンテナンスNo"
            prop="maintenance_code"
            width="170"
            fixed
          >
          </el-table-column>

          <el-table-column
            align="center"
            label="業態"
            prop="shop.business_category.business_category"
            width="100"
          >
          </el-table-column>

          <el-table-column
            align="center"
            label="店舗コード"
            width="100"
            prop="shop.shop_code"
          ></el-table-column>

          <el-table-column
            align="center"
            label="店舗名"
            prop="shop.shop_name"
            :width="120"
          >
          </el-table-column>

          <el-table-column align="center" label="依頼区分" :width="100">
            <template slot-scope="scope">
              <span>{{ scope.row.order_type.type }}</span>
            </template>
          </el-table-column>

          <el-table-column
            align="center"
            label="中分類名"
            prop="sub_category.sub_category_name"
            width="150"
          ></el-table-column>

          <el-table-column
            align="center"
            label="取引先名"
            prop="partner_code"
            :width="130"
          ></el-table-column>

          <el-table-column
            align="center"
            label="依頼内容"
            prop="order"
            :width="450"
          ></el-table-column>

          <el-table-column
            align="center"
            label="備考"
            prop="remark"
            :width="100"
          ></el-table-column>

          <el-table-column
            align="center"
            label="原因/修繕内容"
            prop=""
            :width="120"
          ></el-table-column>

          <el-table-column align="center" label="経過ステータス" :width="120">
            <template slot-scope="scope">
              <span>{{ scope.row.progress.status }}</span>
            </template>
          </el-table-column>

          <el-table-column
            align="center"
            width="120"
            label="対応期限"
            prop="deadline_date"
          >
          </el-table-column>

          <el-table-column
            align="center"
            width="120"
            label="完了日"
            prop="completed_date"
          >
          </el-table-column>

          <el-table-column
            align="center"
            width="120"
            label="会計年月①"
            prop="accounting_info"
            :formatter="frtAccym_one"
          ></el-table-column>
          <el-table-column
            align="center"
            width="140"
            label="請求金額(税抜)①"
            prop="accounting_info"
            :formatter="frtAccunp_one"
          ></el-table-column>
          <el-table-column
            align="center"
            width="120"
            label="会計年月②"
            prop="accounting_info"
            :formatter="frtAccym_two"
          ></el-table-column>
          <el-table-column
            align="center"
            width="140"
            label="請求金額(税抜)②"
            :formatter="frtAccunp_two"
          ></el-table-column>
          <!-- three -->
          <el-table-column
            align="center"
            width="120"
            label="会計年月③"
            prop="accounting_info"
            :formatter="frtAccym_three"
          ></el-table-column>
          <el-table-column
            align="center"
            width="140"
            label="請求金額(税抜)③"
            :formatter="frtAccunp_three"
          ></el-table-column>
          <!-- four -->
          <el-table-column
            align="center"
            width="120"
            label="会計年月④"
            prop="accounting_info"
            :formatter="frtAccym_four"
          ></el-table-column>
          <el-table-column
            align="center"
            width="140"
            label="請求金額(税抜)④"
            :formatter="frtAccunp_four"
          ></el-table-column>
          <el-table-column
            align="center"
            width="120"
            label="請求金額合計(税抜)"
            prop="accounting_info"
            :formatter="frtAccp_total"
          ></el-table-column>
          <el-table-column
            align="center"
            width="150"
            label="請求元取引先コード"
            prop="partner_code"
          ></el-table-column>
          <el-table-column
            align="center"
            width="120"
            label="請求元取引先名"
            prop="partner_name"
          ></el-table-column>
          <el-table-column
            align="center"
            width="120"
            label="科目区分コード	"
            prop="accounting_info"
            :formatter="frtAcc_subj"
          ></el-table-column>
          <el-table-column
            align="center"
            width="120"
            label="科目区分"
            prop="accounting_info"
            :formatter="frtAcc_subjName"
          ></el-table-column>

          <el-table-column
            align="center"
            label="申請日"
            prop="created_at"
            width="120"
          >
          </el-table-column>
        </el-table>
      </template>
    </el-row>
  </div>
</template>
<style>
.table-panel {
  width: 800px;
  margin: 0 auto;
  border: 1px dashed rgb(156, 156, 156);
  padding: 10px;
  box-sizing: border-box;
}
.table-panel .el-radio {
  margin-right: 10px;
}
.export-it {
  margin-right: 20px;
}
</style>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<script>
import MaintenanceResource from '@/api/maintenance';
import ShopResource from '@/api/shop';
import Pagination from '@/components/Pagination'; // Secondary package based on el-pagination
import { DateTime } from 'luxon';
import elTableExport from 'el-table-export';
import { saveAs } from 'file-saver';
import ElSelectAll from './../maintenance/selectAll.vue';
import VueMoment from 'vue-moment';
import moment from 'moment-timezone';

const resource = new MaintenanceResource();
const shopResource = new ShopResource();

export default {
  name: 'exportCsv',
  components: { Pagination, DateTime, ElSelectAll, VueMoment, moment },
  data() {
    return {
      stTocomplete: new Date(),
      mdoptionsList: [
        { label: 'BM承認待ち', value: 1 },
        { label: 'BM承認', value: 2 },
        { label: 'BM差戻し', value: 3 },
        { label: 'BM却下', value: 4 },
        { label: 'BM保留', value: 5 },
        { label: '本部受付前', value: 6 },
        { label: '本部差戻し', value: 7 },
        { label: '本部見送り', value: 8 },
        { label: '依頼確定', value: 9 },
        { label: '依頼済', value: 10 },
        { label: '見積待ち', value: 11 },
        { label: '見積精査中', value: 12 },
        { label: '入荷待ち', value: 13 },
        { label: 'DM承認待ち', value: 14 },
        { label: '稟議中', value: 15 },
        { label: '見積発注済み', value: 16 },
        { label: '日程調整中', value: 17 },
        { label: '訪問待ち', value: 18 },
        { label: '報告待ち', value: 19 },
        { label: '店完了', value: 20 },
        { label: '取完了', value: 21 },
        { label: '問合せ中', value: 22 },
      ],
      tableName: '',
      articleList: [
        { title: 'Laravel Envoy', href: 'https://laravel.com/docs/5.8/envoy' },
        { title: 'Vuex', href: 'https://vuex.vuejs.org/' },
        { title: 'Vue Router', href: 'https://router.vuejs.org/' },
        {
          title: 'laravue-core',
          href: 'https://github.com/tuandm/laravue-core',
        },
        {
          title: 'vue-admin-template',
          href: 'https://github.com/PanJiaChen/vue-admin-template',
        },
        { title: 'Axios', href: 'https://github.com/axios/axios' },
      ],
      supportType: ['csv', 'txt', 'json', 'xls'],
      exportType: 'csv',
      bycomplete: 0,
      bycode: 0,
      bydeadline: 0,
      bycreate: 0,
      query: {
        startdate: null,
        completedate: null,
        page: 1,
        limit: 15,
        keyword: '',
        role: '',
        eventCheck: '',
        progress_id: '',
        business_category_id: null,
        shop_id: null,
      },
      shops: [],
      list: null,
      csvdata: null,
      partners: null,
      total: 0,
      loading: true,
      subjectsList: [],
    };
  },

  created() {
    this.getSubjects();
    this.loadTable();
  },

  mounted() {},

  methods: {
    selectsc() {
      this.query.startdate = this.stTocomplete[0];
      this.query.completedate = this.stTocomplete[1];
      this.loadTable();
      // console.log(this.stTocomplete);
    },

    frtAccym_one(row, column) {
      var acc = row.accounting_info;

      if (acc && acc.length) {
        return acc[0].accounting_year;
      }
      return '';
    },

    frtAccunp_one(row, column) {
      var acc = row.accounting_info;

      if (acc && acc.length) {
        // var rowValue = `¥ ${acc[0].unincluding_price}`.replace(
        //   /\B(?=(\d{3})+(?!\d))/g,
        //   ','
        // );
        var rowValue = acc[0].unincluding_price;
        return rowValue;
      }
      return '';
    },

    frtAccym_two(row, column) {
      var acc = row.accounting_info;

      if (Array.isArray(acc) && acc.length) {
        if (acc.length > 1) return acc[1].accounting_year;
      }
      return '';
    },

    frtAccunp_two(row, column) {
      var acc = row.accounting_info;

      if (Array.isArray(acc) && acc.length) {
        if (acc.length > 1) {
          var rowValue = acc[1].unincluding_price;
        }
        return rowValue;
      }
      return '';
    },

    // three account
    frtAccym_three(row, column) {
      var acc = row.accounting_info;

      if (Array.isArray(acc) && acc.length) {
        if (acc.length > 2) return acc[2].accounting_year;
      }
      return '';
    },

    frtAccunp_three(row, column) {
      var acc = row.accounting_info;

      if (Array.isArray(acc) && acc.length) {
        if (acc.length > 2) {
          var rowValue = acc[2].unincluding_price;
        }
        return rowValue;
      }
      return '';
    },

    // four account
    frtAccym_four(row, column) {
      var acc = row.accounting_info;

      if (Array.isArray(acc) && acc.length) {
        if (acc.length > 3) return acc[3].accounting_year;
      }
      return '';
    },

    frtAccunp_four(row, column) {
      var acc = row.accounting_info;

      if (Array.isArray(acc) && acc.length) {
        if (acc.length > 3) {
          var rowValue = acc[3].unincluding_price;
        }
        return rowValue;
      }
      return '';
    },

    frtAccp_total(row, column) {
      var acc = row.accounting_info;
      var totoal_unp = 0;
      if (Array.isArray(acc) && acc.length) {
        acc.forEach((el, idx) => {
          totoal_unp += el.unincluding_price;
        });
        return totoal_unp;
      }
      return '';
    },

    frtAcc_subj(row, column) {
      var acc = row.accounting_info;
      if (Array.isArray(acc) && acc.length) {
        return acc[0].accounting_subject_id;
      }
      return '';
    },

    frtAcc_subjName(row, column) {
      var acc = row.accounting_info;
      var name = '';
      if (Array.isArray(acc) && acc.length) {
        if (acc[0].accounting_subject_id > 0)
          name = this.subjectsList[acc[0].accounting_subject_id];
        return name;
      }
      return '';
    },

    getSubjects() {
      resource.getSubjects().then((res) => {
        this.subjects = res;
        res.forEach((el) => {
          this.subjectsList[el.accounting_subjects_id] = el.name;
        });
        console.log(this.subjectsList);
      });
    },

    getShops() {
      this.query.shop_id = 0;
      if (this.query.business_category_id === 0) {
        this.shops = [];
      } else {
        shopResource
          .list({
            business_category_id: this.query.business_category_id,
          })
          .then((res) => {
            this.shops = res;
          });
      }
    },

    exportFile() {
      let csv = [];

      //table header txt
      const header = document.querySelectorAll(
        '#datatable > div.el-table__fixed > div.el-table__fixed-header-wrapper > table > thead > tr > th > div.cell'
      );
      const rowText = Array.from(header).map((cell) => cell.innerHTML);
      csv.push(rowText.join(','));

      //table body text
      const rows = document.querySelectorAll(
        '#datatable > div.el-table__fixed > div.el-table__fixed-body-wrapper > table > tbody > tr.el-table__row'
      );
      rows.forEach((el, idx) => {
        const cells = el.querySelectorAll('td > div.cell');
        const rowText = Array.from(cells).map((cell) => cell.textContent? `"${cell.textContent}"`:" ");
        csv.push(rowText.join(','));
      });
      console.log(csv);

      var today = new Date();
      var dd = String(today.getDate()).padStart(2, '0');
      var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
      var yyyy = today.getFullYear();
      var hrs = String(today.getHours()).padStart(2, '0');
      var mins = String(today.getMinutes()).padStart(2, '0');
      var seconds = String(today.getSeconds()).padStart(2, '0');

      today = yyyy + '/' + mm + '/' + dd;

      var csvname = today + ' ' + 'QSRネゴシオ請求データ分析.csv';

      // const csvFile = new Blob([csv.join('\n')], {
      //   type: 'text/csv;charset=utf-8;',
      // });

      const csvFile = new Blob(
        [
          new Uint8Array([0xef, 0xbb, 0xbf]), // UTF-8 BOM
          // 'Text',
          csv.join('\n'),
        ],
        { type: 'text/plain;charset=utf-8' }
      );
      saveAs(csvFile, csvname);
    },

    // csvfile(tname) {},

    loadTable() {
      axios
        .post('/api/v2/maintenance/csv/loadexport', this.query)
        .then((res) => {
          const { limit, page } = this.query;
          this.loading = true;
          const { data, meta, partners } = res.data;
          // this.list = data;
          // this.customers = customers;

          this.list = data.map((item, i) =>
            Object.assign({}, item, partners[i])
          );

          this.list.forEach((element, index) => {
            element['index'] = (page - 1) * limit + index + 1;
          });
          this.total = meta.total;
          this.loading = false;
        });
    },

    csvExport() {
      const data = {
        table: this.tableName,
      };
      axios
        .get('/api/v1/admin/csv/export', {
          params: {
            table: this.tableName,
          },
        })
        .then((res) => {
          console.log(res);
        })
        .catch((error) => {
          console.log(error);
        });
      // resource.csvExport(data).then(res => {
      //   // alert(res);
      // });
    },
  },
};
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.documentation-container {
  // margin: 50px;
  .document-btn {
    float: left;
    margin-left: 50px;
    display: block;
    cursor: pointer;
    background: black;
    color: white;
    height: 60px;
    width: 200px;
    line-height: 60px;
    font-size: 20px;
    text-align: center;
  }
}
</style>
<style lang="scss" scoped>
.app-container {
  flex: 1;
  justify-content: space-between;
  font-size: 14px;
  padding-right: 8px;
  .block {
    float: left;
    min-width: 250px;
  }
  .clear-left {
    clear: left;
  }
}

.list-inline {
  padding-left: 0;
  margin-left: -5px;
  list-style: none;
  li {
    display: inline-block;
    padding-right: 5px;
    padding-left: 5px;
    font-size: 13px;
  }
  .link-black {
    &:hover,
    &:focus {
      color: #999;
    }
  }
}

@media screen and (max-width: 520px) {
  .app-main .app-container .filter-container .list-inline li {
    margin: 0px !important;
    padding-bottom: 10px;
  }

  .el-select .filter-item .el-select--medium {
    width: 385px;
  }
}
</style>