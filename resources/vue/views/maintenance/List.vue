<template>

  <div class="app-container">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <div class="filter-container">
      <ul class="list-inline">
        <li style="margin-left:40px;">
          <span class="el-tag el-tag--danger el-tag--medium el-tag--light">
            <i class="el-icon-info" /> 緊急・重要
          </span>
        </li>
        <li>
          <span class="el-tag el-tag--warning el-tag--medium el-tag--light">
            <svg-icon icon-class="warning" /> 災害（地震・台風・大雨など）
          </span>
        </li>

        <li class="pull-right">
          <el-select v-model="query.progress_id" :multiple="false" placeholder="ステータス" clearable style="width: 150px" class="filter-item" v-on:change="handleFilter()">
            <el-option label="すべて選択" :value="0" />
            <el-option label="BM承認待" :value="1" />
            <el-option label="BM承認" :value="2" />
            <el-option label="BM差戻し" :value="3" />
            <el-option label="BM却下" :value="4" />
            <el-option label="BM保留" :value="5" />
            <el-option label="受付前" :value="6" />
            <!-- <el-option label="本部承認" :value="1" /> -->
            <el-option label="本部差戻し" :value="7" />
            <el-option label="本部見送り" :value="8" />
            <el-option label="依頼前" :value="9" />
            <el-option label="依頼済" :value="10" />
            <el-option label="見積待ち" :value="11" />
            <el-option label="入荷待ち" :value="13" />
            <el-option label="DM承認待ち" :value="14" />
            <el-option label="稟議中" :value="15" />
            <el-option label="見積発注済み" :value="16" />
            <el-option label="訪問待ち" :value="18" />
            <el-option label="報告待ち" :value="19" />
            <el-option label="店完了" :value="20" />
            <el-option label="取完了" :value="21" />
          </el-select>
          <el-select v-model="query.business_category_id" placeholder="業態" clearable style="width: 100px" class="filter-item" @change="getShops" v-on:change="handleFilter()">
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
          <el-select v-model="query.shop_id" placeholder="店舗" clearable style="width: 100px" class="filter-item">
            <el-option label="全店舗" :value="0" />
            <el-option v-for="item in shops" :key="item.shop_id" :label="item.shop_name" :value="item.shop_id" />
          </el-select>

          <el-input v-model="query.keyword" placeholder="フリーワード" style="width: 200px;" class="filter-item" />
          <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
            検索
          </el-button>
        </li>
      </ul>
    </div>

    <el-table v-loading="loading" :data="list" border fit highlight-current-row style="width: 100%" :row-class-name="tableRowClassName">
      <el-table-column align="center" label="メンテナンスNo">
        <template slot-scope="scope">
          <router-link :to="'/maintenance/detail/'+scope.row.maintenance_id" class="link-type">
            <span v-html="scope.row.maintenance_code"></span>
          </router-link>
        </template>
      </el-table-column>

      <el-table-column align="center" label="業態">
        <template slot-scope="scope">
          <span>{{ scope.row.shop.business_category.business_category }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="店舗名">
        <template slot-scope="scope">
          <span>{{ scope.row.shop.shop_name }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="申請者">
        <template slot-scope="scope">
          <span>{{ scope.row.user.name }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="依頼区分">
        <template slot-scope="scope">
          <span>{{ scope.row.order_type.type }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="設備名">
        <template slot-scope="scope">
          <span>{{ scope.row.equipment }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="経過ステータス">
        <template slot-scope="scope">
          <span>{{ scope.row.progress.status }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="完了日">
        <template slot-scope="scope">
          <span>{{ scope.row.updated_at }}</span>
          <!-- <span>{{ scope.row.completed_date }}</span> -->
        </template>
      </el-table-column>

      <el-table-column align="center" label="申請日">
        <template slot-scope="scope">
          <span>{{ scope.row.created_at }}</span>
        </template>
      </el-table-column>

      <!-- <el-table-column align="center" label="アクション">
        <template slot-scope="scope">
          <router-link :to="'/maintenance/detail/'+scope.row.maintenance_id" class="link-type">
            <el-button size="small" type="primary">変更</el-button>
          </router-link>
        </template>
      </el-table-column> -->
    </el-table>
    <div style="text-align:center;">
      <pagination v-show="total>0" :total="total" :page.sync="query.page" :limit.sync="query.limit" @pagination="getList" />
    </div>
  </div>
</template>
<style>

.custom-highlight-row{
  background-color: pink!important;
}

.custom-danger-row{
  background-color: #fff8e6!important;
  content: "\e7a1";
}


.custom-warning-row{
  background-color: #ffdbdb!important;
  
}
</style>
<script>
import Pagination from '@/components/Pagination'; // Secondary package based on el-pagination
import MaintenanceResource from '@/api/maintenance';
import ShopResource from '@/api/shop';
import waves from '@/directive/waves'; // Waves directive

const resource = new MaintenanceResource();
const shopResource = new ShopResource();

export default {
  name: 'MaintenanceList',
  components: { Pagination },
  directives: { waves },
  data() {
    return {
      list: null,
      total: 0,
      loading: true,
      query: {
        page: 1,
        limit: 15,
        keyword: '',
        role: '',
        progress_id: null,
        business_category_id: null,
        shop_id: null,
      },
      shops: [],
    };
  },
  computed: {
  },
  created() {
    this.getList();
  },
  methods: {
    
   tableRowClassName({row, rowIndex}) {
     console.log(row.order_type_id);
     if(row.order_type_id > 0) {
       if(row.order_type_id > 3) {
         return 'custom-danger-row';
       } else if(row.order_type_id < 4) {
         return 'custom-warning-row';
       }
     }
    return;
  },

    async getList() {
      const { limit, page } = this.query;
      this.loading = true;
      const { data, meta } = await resource.list(this.query);
      this.list = data;
      this.list.forEach((element, index) => {
        element['index'] = (page - 1) * limit + index + 1;
        if(element.order_type_id > 0){
          if(element.order_type_id > 3) {
            element.maintenance_code = '<i style="color: #ffba00; padding-right: 5px" class="fa">&#xf071;</i>' + element.maintenance_code; 
          } else {
             element.maintenance_code = '<i class="el-icon-info" style="color: #ff4949;  padding-right: 5px"></i>' + element.maintenance_code; 
          }
        } 
      });
      this.total = meta.total;
      this.loading = false;
    },
    handleFilter() {
      this.query.page = 1;
      this.getList();
    },
    getShops() {
      this.query.shop_id = 0;
      if (this.query.business_category_id === 0) {
        this.shops = [];
      } else {
        shopResource.list({
          business_category_id: this.query.business_category_id,
        }).then((res) => {
          this.shops = res;
        });
      }
    },
    formatJson(filterVal, jsonData) {
      return jsonData.map(v => filterVal.map(j => v[j]));
    },
  },
};
</script>

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
    &:hover, &:focus {
      color: #999;
    }
  }
}
</style>
