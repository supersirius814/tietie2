<template>
  <div class="app-container documentation-container">
    <h1>CSVエクスポート</h1>
    <el-row :gutter="20">
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
    </el-row>
  </div>
</template>
<script>
import MaintenanceResource from '@/api/maintenance';

const resource = new MaintenanceResource();

export default {
  name: 'exportCsv',
  data() {
    return {
      tableName: '',
      articleList: [
        { title: 'Laravel Envoy', href: 'https://laravel.com/docs/5.8/envoy' },
        { title: 'Vuex', href: 'https://vuex.vuejs.org/' },
        { title: 'Vue Router', href: 'https://router.vuejs.org/' },
        { title: 'laravue-core', href: 'https://github.com/tuandm/laravue-core' },
        { title: 'vue-admin-template', href: 'https://github.com/PanJiaChen/vue-admin-template' },
        { title: 'Axios', href: 'https://github.com/axios/axios' },
      ],
    };
  },

  methods: {
    csvfile(tname){
      
    },

    csvExport(){
      const data = {
        table: this.tableName,
      };
      axios.get('/api/v1/admin/csv/export', {
        params: {
          table: this.tableName,
        }        
      }).then((res) => {
        console.log(res);
      }).catch((error) => {
        console.log(error);
      })
      // resource.csvExport(data).then(res => {
      //   // alert(res);
      // });
    }
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
