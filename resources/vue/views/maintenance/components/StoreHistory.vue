<template>
  <div>
    <h3>店舗過去履歴</h3>
    {{ this.$route.params.accounting_ym }}
    <el-table :data="list" :show-header="true" border style="width: 100%">
      <el-table-column align="center" class-name="history-td" label="緊/重">
        <template slot-scope="scope">
          <span>{{ scope.row.is_emergency == 1 ? '緊急' : '' }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" class-name="history-td"  label="メンテナンスNo" >
        <template slot-scope="scope">
          <router-link :to="'/maintenance/detail/'+scope.row.maintenance_id" class="link-type" target= '_blank'>
            <span v-html="scope.row.maintenance_code"></span>
          </router-link>
        </template>
      </el-table-column>
      <el-table-column align="center" class-name="history-td" label="ステータス">
        <template slot-scope="scope">
          <span>{{ scope.row.progress.status }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" class-name="history-td" prop="created_at" label="依頼日" />
      <el-table-column align="center" class-name="history-td" label="完了日">
        <template slot-scope="scope">
          <span>{{ scope.row.completed_date }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" class-name="history-td" prop="partner_code" :formatter="formatterName" label="取引先名">
        <!-- <template slot-scope="scope">
          <span prop="scope.row.customer_code"></span>
        </template> -->
      </el-table-column>
      <el-table-column align="center" class-name="history-td" label="依頼内容">
        <template slot-scope="scope">
          <span>{{ scope.row.order.substr(0, 10) }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" class-name="history-td" label="会計年月">
        <template slot-scope="scope">
          <span>{{ computedYm(scope.row.accounting_info) }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" class-name="history-td" label="請求金額（税抜）">
        <template slot-scope="scope">
          <span>{{ computedUnprice(scope.row.accounting_info) }}</span>
        </template>
      </el-table-column>
    </el-table>
    <div style="text-align:center;margin-top:10px;">
      <pagination v-show="total>0" :total="total" :page.sync="query.page" :limit.sync="query.limit" layout="total, prev, pager, next, jumper" @pagination="getList" />
    </div>
  </div>
</template>

<script>
import Pagination from '@/components/Pagination'; // Secondary package based on el-pagination
import MaintenanceResource from '@/api/maintenance';

const resource = new MaintenanceResource();

export default {
  components: { Pagination },
  props: {
    shopId: {
      type: Number,
      default: 0,
    },
  },
  data() {
    return {
      timer: undefined,
      list: null,
      total: 0,
      loading: true,
      query: {
        page: 1,
        limit: 8,
        shop_id: this.shopId,
      },
      customs: [],
    };
  },
  created() {
    this.customsList();
    this.getList();
  },
  beforeMount() {
    this.timer = setInterval(this.getList, 2500);
  },
  beforeUnmount() {
    clearInterval(this.timer);
  },
  mounted(){
 
  },
  updated(){

  },

  methods: {
    computedYm(accounting_info){
      if(accounting_info && accounting_info.length){
        var cnt = accounting_info.length;
        var date = accounting_info[0].accounting_year;
        var date_arr;
        if(date){
          date_arr = date.split('-');
          return date_arr[0] + '/' + date_arr[1];
        }
      }
      return '';
    },

    computedUnprice(accounting_info){
      if(accounting_info && accounting_info.length){
        var cnt = accounting_info.length;
        var price = accounting_info[0].unincluding_price;
        var price_yen;
        if(price){
          price_yen = `¥ ${price}`.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
          return price_yen;
        }
      }
      return '';
    },

    formatterName(row, column) {
      // console.log(row.customer_code);
      if(row.partner_code == '') return;
      else {
        return this.customs[row.partner_code];
      }
    },
    async customsList() {
      resource.customsList().then((res) => {
        this.customs = res;
      });
    },
    async getList() {
      const { limit, page } = this.query;
      this.loading = true;
      const { data, meta } = await resource.storeHistory(this.query);
      this.list = data;
      this.list.forEach((element, index) => {
        element['index'] = (page - 1) * limit + index + 1;
      });
      this.total = meta.total;
      this.loading = false;
    },
  },
};
</script>

<style scoped>
.pagination-container {
  background: #fff;
  padding: 1px 16px !important;
  margin-top: 10px !important;
}
.pagination-container.hidden {
  display: none;
}
</style>
