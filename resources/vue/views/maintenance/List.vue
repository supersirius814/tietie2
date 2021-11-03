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
        <li>
          <span class="el-tag el-tag--medium el-tag--light" style="color: #DE38B8; background-color: #FCE5F7; border: 1px solid #E4B4D9" >
            <el-checkbox v-model="query.eventCheck" @change="handleFilter()" style="color: #DE38B8; background-color: #FCE5F7;"><i style="color: #DE38B8; padding-right: 5px" class="fa">&#xf017;</i><span  style="color: #DE38B8;">対応期限切れ</span>  </el-checkbox>
            <span class="badge">  
              <span id="eventcheckCount">{{ eventcheckCount }}</span>  
            </span>
          </span>

        </li>

        <li class="pull-right">
          <ElSelectAll v-model="query.progress_id" clearable filterable multiple collapse-tags :options="mdoptionsList" placeholder="ステータス" class="filter-item"  v-on:change="handleFilter()"/>
          <el-select v-model="query.progress_id" :multiple="true" collapse-tags  placeholder="ステータス" clearable style="width: 350px" class="filter-item" v-on:change="handleFilter()">
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
          
          <el-select v-model="query.business_category_id" placeholder="業態"  filterable
   clearable style="width: 100px" class="filter-item" @change="getShops" v-on:change="handleFilter()">
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

      <!-- <el-table-column align="center" label="申請者">
        <template slot-scope="scope">
          <span>{{ scope.row.user.name }}</span>
        </template>
      </el-table-column> -->

      <el-table-column align="center" label="依頼区分">
        <template slot-scope="scope">
          <span>{{ scope.row.order_type.type }}</span>
        </template>
      </el-table-column>

      <!-- <el-table-column align="center" label="設備名">
        <template slot-scope="scope">
          <span>{{ scope.row.equipment }}</span>
        </template>
      </el-table-column> -->
<!-- 
      <el-table-column align="center" label="Order">
        <template slot-scope="scope">
          <span style="white-space: pre-wrap;">{{ scope.row.order }}</span>
        </template>
      </el-table-column> -->

      <el-table-column align="center" label="経過ステータス">
        <template slot-scope="scope">
          <span>{{ scope.row.progress.status }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="対応期限">
        <template slot-scope="scope">
          <!-- <span>{{ scope.row.updated_at }}</span> -->
          <span>{{ scope.row.deadline_date }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="完了日">
        <template slot-scope="scope">
          <!-- <span>{{ scope.row.updated_at }}</span> -->
          <span>{{ scope.row.completed_date }}</span>
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
.badge {
  position: absolute;
  top: 73px;
  /* right: -10px; */
  padding-top: 2px!important;
  line-height: 20px;
  padding: 0px 6px;
  border-radius: 50%;
  background-color: #C91313;
  color: white;
}

.custom-highlight-row{
  background-color: #f7b8f0!important;
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

import ElSelectAll from './selectAll.vue';

const resource = new MaintenanceResource();
const shopResource = new ShopResource();

export default {
  name: 'MaintenanceList',
  components: { Pagination, ElSelectAll },
  directives: { waves },
  data() {
    return {
      eventcheckCount: 0,
      storeCodes: '',
      list: null,
      total: 0,
      loading: true,
      query: {
        page: 1,
        limit: 15,
        keyword: '',
        role: '',
        eventCheck: '',
        progress_id:'',
        business_category_id: null,
        shop_id: null,
      },
      shops: [],
       citys:[],
      mdoptionsList: [
        { label: 'BM承認待ち', value: 1, },
        { label: 'BM承認', value: 2,  },
        { label: 'BM差戻し', value: 3,  },
        { label: 'BM却下', value: 4,  },
        { label: 'BM保留', value: 5,  },
        { label: '本部受付前', value: 6,  },
        { label: '本部差戻し', value: 7,  },
        { label: '本部見送り', value: 8,  },
        { label: '依頼確定', value: 9,  },
        { label: '依頼済', value: 10,  },
        { label: '見積待ち', value: 11,  },
        { label: '見積精査中', value: 12,  },
        { label: '入荷待ち', value: 13,  },
        { label: 'DM承認待ち', value: 14,  },
        { label: '稟議中', value: 15,  },
        { label: '見積発注済み', value: 16,  },
        { label: '日程調整中', value: 17,  },
        { label: '訪問待ち', value: 18,  },
        { label: '報告待ち', value: 19,  },
        { label: '店完了', value: 20,  },
        { label: '取完了', value: 21,  },
        { label: '問合せ中', value: 22,  },
      ],
    };
  },
  computed: {
    
  },
  created() {
    this.getList();
    this.eventcheckCountfunc();
    // var totoalTxt = document.getElementsByClassName('el-pagination__total')[0].textContent;
    // var split_tt = totoalTxt.split(' ');
    // totoalTxt = '全' + split_tt[1] + '件';
    
  },
  mounted() {

  },
  methods: {
    eventcheckCountfunc(){
      resource.eventcheckCountfunc().then(res => {
        this.eventcheckCount = res;
      });
    },

    pp(a) {
      if( this.query.progress_id === 'All') {
          this.cities.forEach(loc => {
              if(loc.value !== 'All' ) {
                  this.cities.push(loc.value)
              }
          })
      }
    },

  // checkDeadline($event) {
  //   if($event) {
  //     alert(this.query.eventCheck)      
  //   } else {
  //     alert(this.query.eventCheck)
  //   }
  // },

   tableRowClassName({row, rowIndex}) {
    //  console.log(row.order_type_id);
       if(row.is_emergency > 0) {
         return 'custom-warning-row';
       } 
       if(row.is_disaster > 0) {
         return 'custom-danger-row';
       }
       var createDate = row.created_at;

      if(createDate.split(' ')[0] > row.deadline_date) {
        return 'custom-highlight-row';
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

          if(element.is_emergency > 0) {
            element.maintenance_code = '<i class="el-icon-info" style="color: #ff4949;  padding-right: 5px"></i>' + element.maintenance_code;
          } 
          if(element.is_disaster > 0) {
             element.maintenance_code = '<i style="color: #ffba00; padding-right: 5px" class="fa">&#xf071;</i>' + element.maintenance_code; 
          }
          var createDate = element.created_at;
          if(createDate.split(' ')[0] > element.deadline_date) {
            element.maintenance_code = '<i style="color: #DE38B8; padding-right: 5px" class="fa">&#xf017;</i>' + element.maintenance_code;
          }
      });
      this.total = meta.total;
      this.loading = false;
    },
    handleFilter(val,oldval) {
      
      
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

@media screen and (max-width: 520px) {
  .app-main .app-container .filter-container .list-inline li {
    margin: 0px!important;
    padding-bottom: 10px;
  }
  
  .el-select .filter-item .el-select--medium {
    width: 385px;
  }
}
</style>