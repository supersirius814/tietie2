<template>
  <div class="app-container documentation-container">
    <h1>CSVインポート</h1>
    <el-row>
      <el-col :span="10" style="white-space: pre-line">
        <!-- <el-collapse accordion>
          <template v-for="(val, index) in warn_array">
            <el-collapse-item :name="index">
              <template slot="title">
                {{ val.title }}
              </template>
              <div>
                {{val.content}}
              </div>
            </el-collapse-item>
          </template>
        </el-collapse> -->
        <el-collapse v-model="activeNames" accordion>
            <el-collapse-item title="エラー" name="1" v-if="warning_content">
              {{ warning_content }}
            </el-collapse-item>
        </el-collapse>
      </el-col>
    </el-row>

    <!-- {{ userId }}
    {{ userName }} -->
    <!-- <el-row>
      <el-tabs  type="border-card" @tab-click="handleClick">
        <el-tab-pane label="メンテナンス">
            <el-row>
              <input type="file" name="csv">
            </el-row>
            <el-row>
              <el-button type="primary">インポート</el-button>
            </el-row>
        </el-tab-pane>
        <el-tab-pane label="従業員">
            <el-row>
              <input type="file" name="csv">
            </el-row>
            <el-row>
              <el-button type="primary">インポート</el-button>
            </el-row>
        </el-tab-pane>
        <el-tab-pane label="店舗">
            <el-row>
              <input type="file" name="csv">
            </el-row>
            <el-row>
              <el-button type="primary">インポート</el-button>
            </el-row>
        </el-tab-pane>
        <el-tab-pane label="お取引先様">
            <el-row>
              <input type="file" name="csv">
            </el-row>
            <el-row>
              <el-button type="primary">インポート</el-button>
            </el-row>
        </el-tab-pane>
      </el-tabs>
    </el-row> -->
    <el-row>
      <template>
        <label class="text-reader">
          <input type="file" @change="loadTextFromFile" />
        </label>
      </template>
    </el-row>
    <div style="padding-bottom: 10px">
      <el-checkbox style="margin-right: 15px" v-model="chktable" label="データチェック" @change="chkClick" border></el-checkbox>
      <el-button type="primary" v-if="chktable" @click="csvDataSave">インポート</el-button>
      <el-button type="primary" v-else @click="csvDataSave" disabled>インポート</el-button>
    </div>
    <!-- <el-table
      v-if="chktable"
      id="datatable"
      ref="elTable"
      style="width: 100%"
      :data="csvData"
      v-loading="loading"
      border
      fit
      highlight-current-row
      max-height="550"
      :row-class-name="tableRowClassName"
    >
      <el-table-column align="center" label="行NO" prop="行NO" width="70" fixed>
      </el-table-column>
      <el-table-column align="center" label="完了日" prop="完了日" width="150">
      </el-table-column>
      <el-table-column
        align="center"
        label="運営会社コード"
        prop="運営会社コード"
        width="150"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="運営会社名"
        prop="運営会社名"
        width="200"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="業態コード"
        prop="業態コード"
        width="200"
      >
      </el-table-column>
      <el-table-column align="center" label="業態名" prop="業態名" width="100">
      </el-table-column>
      <el-table-column
        align="center"
        label="メンテナンスNO"
        prop="メンテナンスNO"
        width="200"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="店舗コード"
        prop="店舗コード"
        width="200"
      >
      </el-table-column>
      <el-table-column align="center" label="店舗名" prop="店舗名" width="170">
      </el-table-column>
      <el-table-column
        align="center"
        label="工事内容"
        prop="工事内容"
        width="350"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="請求金額（税抜）"
        prop="請求金額（税抜）"
        width="170"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="請求金額（税込）"
        prop="請求金額（税込）"
        width="170"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="科目区分コード"
        prop="科目区分コード"
        width="150"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="科目区分名"
        prop="科目区分名"
        width="170"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="会計年月"
        prop="会計年月"
        width="150"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="取引先コード"
        prop="取引先コード"
        width="170"
      >
      </el-table-column>
      <el-table-column
        align="center"
        :formatter="frtlast"
        label="重複フラグ１以外は禁"
        prop="取引先コード"
        width="200"
      >
      </el-table-column>
    </el-table> -->
    <el-table
      id="datatable"
      ref="elTable"
      style="width: 100%"
      :data="csvData"
      v-loading="loading"
      border
      fit
      highlight-current-row
      max-height="550"
    >
      <el-table-column align="center" label="行NO" prop="行NO" width="70" fixed>
      </el-table-column>
      <el-table-column align="center" label="完了日" prop="完了日" width="150">
      </el-table-column>
      <el-table-column
        align="center"
        label="運営会社コード"
        prop="運営会社コード"
        width="150"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="運営会社名"
        prop="運営会社名"
        width="200"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="業態コード"
        prop="業態コード"
        width="200"
      >
      </el-table-column>
      <el-table-column align="center" label="業態名" prop="業態名" width="100">
      </el-table-column>
      <el-table-column
        align="center"
        label="メンテナンスNO"
        prop="メンテナンスNO"
        width="200"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="店舗コード"
        prop="店舗コード"
        width="200"
      >
      </el-table-column>
      <el-table-column align="center" label="店舗名" prop="店舗名" width="170">
      </el-table-column>
      <el-table-column
        align="center"
        label="工事内容"
        prop="工事内容"
        width="350"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="請求金額（税抜）"
        prop="請求金額（税抜）"
        width="170"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="請求金額（税込）"
        prop="請求金額（税込）"
        width="170"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="科目区分コード"
        prop="科目区分コード"
        width="150"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="科目区分名"
        prop="科目区分名"
        width="170"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="会計年月"
        prop="会計年月"
        width="150"
      >
      </el-table-column>
      <el-table-column
        align="center"
        label="取引先コード"
        prop="取引先コード"
        width="170"
      >
      </el-table-column>
      <el-table-column
        align="center"
        :formatter="frtlast"
        label="重複フラグ１以外は禁"
        prop="取引先コード"
        width="200"
      >
      </el-table-column>
    </el-table>
  </div>
</template>
<script>
import { VueCsvImport } from 'vue-csv-import';
import MaintenanceResource from '@/api/maintenance';

const resource = new MaintenanceResource();

export default {
  name: 'importCsv',
  components: { VueCsvImport },
  data() {
    return {
      activeNames: ['1'],
      maintenances: [],
      warn_array: [],
      warning_content: null,
      shops: [],
      partners: [],
      shop_codes: [],
      userName: '',
      chktable: false,
      userId: '',
      validRows: [],
      loading: false,
      checkeddata: false,
      csvData: [],
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
    };
  },
  created(){
    this.chkMaintenanceId();
    this.chkShopCode();
    this.chkpartner();
    this.$store.dispatch('user/getInfo').then(user => {
      this.userId = user.id;
      this.userName = user.name;
    });
  },
  methods: {
    chkClick(){
      if(typeof this.csvData !== 'undefined' && this.csvData.length === 0){
        alert('CSVファイルを確認してください!');
        this.chktable = false;
        return;
      }
      const cnt = this.csvData.length;
      var data = this.csvData;
      var content = '';
      this.warn_array = [];
      // console.log(data);
      for(var i = 0; i < cnt; i ++){
        if(!data[i]['行NO']) continue;
        var row_warn = '';

        //完了日 check
        if(!data[i]['完了日']){
          alert(`${el['行NO']}行: 完了日は必須です。`);
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: 完了日は必須です。`;
          } else{
            row_warn += ' 完了日は必須です。';
          }       
          this.chktable = false;
        } else if(this.isComplete(data[i]['完了日'])){
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: 完了日の形式が不正です。`;
          } else{
            row_warn += ' 完了日の形式が不正です。';
          }       
          this.chktable = false;
        }        

        //メンテナンスNO check
        if(!data[i]['メンテナンスNO']){
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: メンテナンスNOは必須です。`;
          } else{
            row_warn += 'メンテナンスNOは必須です。';
          }
          this.chktable = false;
        } else if(!this.maintenances[data[i]['メンテナンスNO']]){
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: メンテナンス申請が存在しません。`;
          } else{
            row_warn += ' メンテナンス申請が存在しません。';
          }
          this.chktable = false;
        }

        //店舗コード check
        if(!data[i]['店舗コード']){
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: 店舗コードは必須です。`;
          } else{
            row_warn += ' 店舗コードは必須です。';
          }          
          this.chktable = false;
        } else if(!this.shops[data[i]['店舗コード']]){
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: 店舗が存在しません。`;
          } else{
            row_warn += ' 店舗が存在しません。';
          }          
          this.chktable = false;
        } else if(this.shop_codes[data[i]['メンテナンスNO']] != data[i]['店舗コード']){
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: 申請店舗と店舗コードが一致しません。`;
          } else{
            row_warn += ' 申請店舗と店舗コードが一致しません。';
          }          
          this.chktable = false;          
        }

        //請求金額（税抜） check
        if(!data[i]['請求金額（税抜）']){
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: 請求金額（税抜）は必須です。`;
          } else{
            row_warn += ' 請求金額（税抜）は必須です。';
          }       
          this.chktable = false;   
        } else if(isNaN(data[i]['請求金額（税抜）'])){
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: 請求金額（税抜）の値は半角数字のみです。`;
          } else{
            row_warn += ' 請求金額（税抜）の値は半角数字のみです。';
          }       
          this.chktable = false; 
        }

        //請求金額（税込） check
        if(!data[i]['請求金額（税込）']){
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: 請求金額（税込）は必須です。`;
          } else{
            row_warn += ' 請求金額（税込）は必須です。';
          }       
          this.chktable = false; 
        } else if(isNaN(data[i]['請求金額（税込）'])){
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: 請求金額（税込）の値は半角数字のみです。`;
          } else{
            row_warn += ' 請求金額（税込）の値は半角数字のみです。';
          }       
          this.chktable = false;
        }

        //会計年月 check
        if(!data[i]['会計年月']){
          alert(`${el['行NO']}行: 会計年月は必須です。`);
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: 会計年月は必須です。`;
          } else{
            row_warn += ' 会計年月は必須です。';
          }       
          this.chktable = false;
        } else if(this.isDate(data[i]['会計年月'])){
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: 会計年月の形式が不正です。`;
          } else{
            row_warn += ' 会計年月の形式が不正です。';
          }       
          this.chktable = false;
        }

        //取引先コード check
        if(!data[i]['取引先コード']){
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: 取引先コードは必須です。`;
          } else{
            row_warn += ' 取引先コードは必須です。';
          }       
          this.chktable = false;
        } else if(!this.partners[data[i]['取引先コード']]){
          if(row_warn == ''){
            row_warn = `${data[i]['行NO']}行: 取引先、または請求元が存在しません。`;
          } else{
            row_warn += ' 取引先、または請求元が存在しません。';
          }       
          this.chktable = false;
        }

        if(row_warn != ''){ 
          content += row_warn + '\n';
        }

        // if(row_warn != '') {
        //   warning_content += row_warn + '\n';
        //   var idata = {
        //     title: `${data[i]['行NO']}行`,
        //     content: row_warn,
        //   };
        //   // this.warn_array[`${data[i]['行NO']}行`] = row_warn;
        //   this.warn_array.push(idata);
        // }
      }

      if(content != '') this.warning_content = content;

      // for(var i = 0; i < cnt; i ++){
      //   if(!data[i]['行NO']) continue;
      //   var row_warn = '';

      //   //完了日 check
      //   if(!data[i]['完了日']){
      //     alert(`${el['行NO']}行: 完了日は必須です。`);
      //     if(row_warn == ''){
      //       row_warn = `完了日は必須です。`;
      //     } else{
      //       row_warn += ' 完了日は必須です。';
      //     }       
      //     this.chktable = false;
      //   } else if(this.isComplete(data[i]['完了日'])){
      //     if(row_warn == ''){
      //       row_warn = `完了日の形式が不正です。`;
      //     } else{
      //       row_warn += ' 完了日の形式が不正です。';
      //     }       
      //     this.chktable = false;
      //   }        

      //   //メンテナンスNO check
      //   if(!data[i]['メンテナンスNO']){
      //     if(row_warn == ''){
      //       row_warn = `メンテナンスNOは必須です。`;
      //     } else{
      //       row_warn += 'メンテナンスNOは必須です。';
      //     }
      //     this.chktable = false;
      //   } else if(!this.maintenances[data[i]['メンテナンスNO']]){
      //     if(row_warn == ''){
      //       row_warn = `メンテナンス申請が存在しません。`;
      //     } else{
      //       row_warn += ' メンテナンス申請が存在しません。';
      //     }
      //     this.chktable = false;
      //   }

      //   //店舗コード check
      //   if(!data[i]['店舗コード']){
      //     if(row_warn == ''){
      //       row_warn = `店舗コードは必須です。`;
      //     } else{
      //       row_warn += ' 店舗コードは必須です。';
      //     }          
      //     this.chktable = false;
      //   } else if(!this.shops[data[i]['店舗コード']]){
      //     if(row_warn == ''){
      //       row_warn = `店舗が存在しません。`;
      //     } else{
      //       row_warn += ' 店舗が存在しません。';
      //     }          
      //     this.chktable = false;
      //   } else if(this.shop_codes[data[i]['メンテナンスNO']] != data[i]['店舗コード']){
      //     if(row_warn == ''){
      //       row_warn = `申請店舗と店舗コードが一致しません。`;
      //     } else{
      //       row_warn += ' 申請店舗と店舗コードが一致しません。';
      //     }          
      //     this.chktable = false;          
      //   }

      //   //請求金額（税抜） check
      //   if(!data[i]['請求金額（税抜）']){
      //     if(row_warn == ''){
      //       row_warn = `請求金額（税抜）は必須です。`;
      //     } else{
      //       row_warn += ' 請求金額（税抜）は必須です。';
      //     }       
      //     this.chktable = false;   
      //   } else if(isNaN(data[i]['請求金額（税抜）'])){
      //     if(row_warn == ''){
      //       row_warn = `請求金額（税抜）の値は半角数字のみです。`;
      //     } else{
      //       row_warn += ' 請求金額（税抜）の値は半角数字のみです。';
      //     }       
      //     this.chktable = false; 
      //   }

      //   //請求金額（税込） check
      //   if(!data[i]['請求金額（税込）']){
      //     if(row_warn == ''){
      //       row_warn = `請求金額（税込）は必須です。`;
      //     } else{
      //       row_warn += ' 請求金額（税込）は必須です。';
      //     }       
      //     this.chktable = false; 
      //   } else if(isNaN(data[i]['請求金額（税込）'])){
      //     if(row_warn == ''){
      //       row_warn = `請求金額（税込）の値は半角数字のみです。`;
      //     } else{
      //       row_warn += ' 請求金額（税込）の値は半角数字のみです。';
      //     }       
      //     this.chktable = false;
      //   }

      //   //会計年月 check
      //   if(!data[i]['会計年月']){
      //     alert(`${el['行NO']}行: 会計年月は必須です。`);
      //     if(row_warn == ''){
      //       row_warn = `会計年月は必須です。`;
      //     } else{
      //       row_warn += ' 会計年月は必須です。';
      //     }       
      //     this.chktable = false;
      //   } else if(this.isDate(data[i]['会計年月'])){
      //     if(row_warn == ''){
      //       row_warn = `会計年月の形式が不正です。`;
      //     } else{
      //       row_warn += ' 会計年月の形式が不正です。';
      //     }       
      //     this.chktable = false;
      //   }

      //   //取引先コード check
      //   if(!data[i]['取引先コード']){
      //     if(row_warn == ''){
      //       row_warn = `取引先コードは必須です。`;
      //     } else{
      //       row_warn += ' 取引先コードは必須です。';
      //     }       
      //     this.chktable = false;
      //   } else if(!this.partners[data[i]['取引先コード']]){
      //     if(row_warn == ''){
      //       row_warn = `取引先、または請求元が存在しません。`;
      //     } else{
      //       row_warn += ' 取引先、または請求元が存在しません。';
      //     }       
      //     this.chktable = false;
      //   }

      //   if(row_warn != '') {
      //     warning_content += row_warn + '\n';
      //     var idata = {
      //       title: `${data[i]['行NO']}行`,
      //       content: row_warn,
      //     };
      //     // this.warn_array[`${data[i]['行NO']}行`] = row_warn;
      //     this.warn_array.push(idata);
      //   }
      // }

      // if(warning_content != '') alert(warning_content);
      //  console.log(this.warn_array);
      // return;
      // this.csvData.forEach((el, idx) => {
      //   if(!el['メンテナンスNO']){
      //     alert(`${el['行NO']}行: メンテナンスNOは必須です。`);
      //     this.chktable = false;
      //     // return;
      //   }
      //   if(!el['店舗コード']){
      //     // alert('店舗コードは必須です。');
      //     alert(`${el['行NO']}行: 店舗コードは必須です。`);
      //     this.chktable = false;
      //     // return;
      //   }
      //   if(!el['請求金額（税抜）']){
      //     // alert('請求金額（税抜）は必須です。');
      //     alert(`${el['行NO']}行: 請求金額（税抜）は必須です。`);
      //     this.chktable = false;
      //     // return;
      //   }
      //   if(isNaN(el['請求金額（税抜）'])){
      //     // alert('請求金額（税抜）の値は半角数字のみです。');
      //     alert(`${el['行NO']}行: 請求金額（税抜）の値は半角数字のみです。`);
      //     this.chktable = false;
      //     // return;
      //   }
      //   if(!el['請求金額（税込）']){
      //     // alert('請求金額（税込）は必須です。');
      //     alert(`${el['行NO']}行: 請求金額（税込）は必須です。`);
      //     this.chktable = false;
      //     // return;          
      //   }
      //   if(isNaN(el['請求金額（税込）'])){
      //     // alert('請求金額（税込）の値は半角数字のみです。');
      //     alert(`${el['行NO']}行: 請求金額（税込）の値は半角数字のみです。`);
      //     this.chktable = false;
      //     // return;
      //   }
      //   if(!el['会計年月']){
      //     // alert('会計年月は必須です。');
      //     alert(`${el['行NO']}行: 会計年月は必須です。`);
      //     this.chktable = false;
      //     // return;          
      //   }
      //   if(this.isDate(el['会計年月'])){
      //     alert(`${el['行NO']}行: 会計年月の形式が不正です。`);
      //     // alert('会計年月の形式が不正です。');
      //     this.chktable = false;
      //     // return;          
      //   }
      // });
    },

    frtlast(row, column) {
      return row['重複フラグ１以外は禁\r'];
    },

    chkMaintenanceId(){
      resource.chkMaintenanceId().then(res => {
        this.maintenances = res.code;
        this.shop_codes = res.shop;
      });
    },

    chkShopCode(){
      resource.chkShopCode().then(res => {
        this.shops = res;
      });
    },

    chkpartner(){
      resource.chkpartner().then(res => {
        this.partners = res;
      });
    },

    tableRowClassName({ row, rowIndex }) {
      this.validRows[rowIndex] = 0;
      if (isNaN(row['請求金額（税抜）'])) {
        this.validRows[rowIndex] = 1;
        return 'custom-warning-row';
      }
      if (isNaN(row['請求金額（税込）'])) {
        this.validRows[rowIndex] = 1;
        return 'custom-warning-row';
      }
      if (row['メンテナンスNO'] == null || row['メンテナンスNO'] == "") {
        this.validRows[rowIndex] = 1;
        return 'custom-warning-row';
      }
      if (isNaN(row['取引先コード'])) {
        this.validRows[rowIndex] = 1;
        return 'custom-warning-row';
      }
      if(isNaN(row['店舗コード']) || !row['店舗コード']) {
        this.validRows[rowIndex] = 1;
        return 'custom-warning-row';
      }

      if(this.isDate(row['会計年月'])){
        this.validRows[rowIndex] = 1;
        return 'custom-warning-row';
      }

      return;
    },

    isDate(date){
      var params = date.split(/[\.\-\/]/);
      var yyyy = params[0];
      var mm = params[1];
      if(isNaN(yyyy) || isNaN(mm)){
        return true;
      }
      if(new Date(date).toString() == 'Invalid Date') return true;
      return false;
    },

    isComplete(date){
      var params = date.split(/[\.\-\/]/);
      var yyyy = params[2];
      var mm = params[1];
      var dd = params[0];
      if(isNaN(yyyy) || isNaN(mm) || isNaN(dd)){
        return true;
      }
      if(new Date(date).toString() == 'Invalid Date') return true;
      return false;
    },

    csvDataSave(){
      if(typeof this.csvData !== 'undefined' && this.csvData.length === 0){
        alert('CSVファイルを確認してください!');
        return;
      }
      const validSum = this.validRows.reduce((a, b) => a + b, 0);
      // alert(validSum);
      if(validSum > 0){
        alert('CSVファイルを確認してください!');
        return;
      }
      // console.log(this.validRows);
      const updateData = {
        csvdata: this.csvData,
        valid: this.validRows,
        userId: this.userId,
      }
      resource.csvImport(updateData).then(res => {
        // if(res == 0) alert('CSVファイルを確認してください！');
      });
    },

    loadTextFromFile(ev) {
      this.validRows = [];
      this.warning_content = null;
      this.loading = true;
      this.content = '';
      this.chktable = false;
      const file = ev.target.files[0];
      const reader = new FileReader();

      reader.onload = (e) => {
        this.$emit('load', e.target.result);

        const input = e.target.result;

        const lines = input.split('\n');
        const header = lines[0].split(',');
        const output = lines.slice(1).map((line) => {
          const fields = line.split(',');
          return Object.fromEntries(header.map((h, i) => [h, fields[i]]));
        });

        this.csvData = output;
        console.log(this.csvData[1]);
      };
      
      reader.readAsText(file);
      this.loading = false;
      // console.log(file);
    },
  },
};
</script>

<style>
.custom-warning-row {
  background-color: #fa6f76 !important;
}
</style>

<style rel="stylesheet/scss" lang="scss" scoped>
.documentation-container {
  //   margin: 50px;
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
