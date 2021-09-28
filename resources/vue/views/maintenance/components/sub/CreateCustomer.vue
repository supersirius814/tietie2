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
              <td class="input-td">
                <input value="" v-model="id" class="el-input__inner" style="display:none"/>
                <input value="" v-model="customer_code" class="el-input__inner"/>
                
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
              <td class="input-td">
                <input value="" v-model="customer_name" class="el-input__inner"/>                
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
                <input value="" v-model="customer_alias" class="el-input__inner"/>                
                <!-- <input value="パナ産機（あじさい銀行）" /> -->
              </td>
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
                <el-select  size="small" v-model="customergroup_code" placeholder="" clearable style="width: 100%" class="filter-item">
                  <el-option v-for="item in this.detail.customgroup_list" :key="item.id" :label="item.customergroup_code" :value="item.customergroup_code" />
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
                <el-select  size="small" v-model="customergroup" placeholder="" clearable style="width: 100%" class="filter-item">
                  <el-option v-for="item in this.detail.customgroup_list" :key="item.id" :label="item.customergroup" :value="item.customergroup" />
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
              <td class="input-td"><input value="" v-model="customer_tel" class="el-input__inner"/></td>
              <!-- <td class="input-td"><input value="110000060" /></td> -->
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <td class="input-td"><input value="" v-model="customer_fax" class="el-input__inner"/></td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row>
      <el-button type="info" size="small" @click="customsearchAgain()">検索</el-button>
    </el-row>
    <div style="text-align: right; padding-bottom: 15px;">
      <!-- <el-button type="primary" size="small" @click="select()">選択</el-button> -->
      <el-button type="default" size="small" @click="$emit('close')">閉じる</el-button>
    </div>    

    <el-table
      :data="custom"
      :show-header="true"
      @row-click="rowClick"
      border
      style="width: 100%; margin: auto"
    >
      <el-table-column align="center" prop="id" label="NO"></el-table-column>
      <el-table-column align="center" prop="customer_code" label="取引先コード"></el-table-column>
      <el-table-column align="center" prop="customer_name" label="取引先名"></el-table-column>
      <el-table-column align="center" prop="customer_alias" label="取引先名(カナ)"></el-table-column>
      <el-table-column align="center" prop="customergroup_code" label="区分コード"></el-table-column>
      <el-table-column align="center" prop="customergroup" label="区分"></el-table-column>
      <el-table-column align="center" prop="TEL" label="TEL"></el-table-column>
      <el-table-column align="center" prop="FAX" label="FAX"></el-table-column>
    </el-table>
<!-- {{this.custom}} -->
    <!-- <template v-for="item in this.custom">

    </template> -->
  </div>

</template>

<script>
import MaintenanceResource from '@/api/maintenance';
import CurrencyInput from './CurrencyInput.vue';
import { MonthPickerInput } from 'vue-month-picker'
import { Datetime } from 'vue-datetime';
import { Settings } from 'luxon'
import { DateTime } from 'luxon';
const resource = new MaintenanceResource();


export default {
  components: { CurrencyInput, MonthPickerInput },
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
      tt: 353,
      custom: [],
      accounting_year: new Date(),
      format: "yyyy/MM/ddd",
      customer_code: '',
      // customer_code: this.detail.customer_code,
      id: 0,
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
  created(){
    this.$store.dispatch('user/getInfo').then(user => {
      this.userName = user.name;
    });
  },
  methods: {
      rowClick(row) {
        console.log(row);
        this.detail.customer_code = row.customer_code;
        this.detail.customerInformation[this.detail.customerInformation.length - 1].customer_name = row.customer_name;
        this.detail.customerInformation[this.detail.customerInformation.length - 1].TEL = row.TEL;
        this.detail.customerInformation[this.detail.customerInformation.length - 1].FAX = row.FAX;

        resource.customsearch(row.customer_code).then(res => {
          
            if(res == 0) {
              this.id = 0;
              alert(res);
            }
            else this.id = res[res.length - 1].id;
            

            const updatedata = {
              id: row.id,
              customer_code: row.customer_code,
              customer_tel: row.customer_tel,
              customer_alias: row.customer_alias,
              customer_fax: row.customer_fax,
              customergroup_code: row.customergroup_code,
              customergroup: row.customergroup,
              customer_name: row.customer_name,
              
            };
            
            // alert(this.detail.maintenance_id); return false;
            resource.update_customerid(this.detail.maintenance_id, updatedata).then(res => {
              this.detail.customer_code = this.customer_code;
              this.detail.customerInformation[this.detail.customerInformation.length - 1].TEL = res[res.length - 1].TEL; 
              this.detail.customerInformation[this.detail.customerInformation.length - 1].FAX = res[res.length - 1].FAX; 
              this.detail.customerInformation[this.detail.customerInformation.length - 1].customer_name = res[res.length - 1].customer_name;
            });
            // alert(this.customer_id);
        });  
      },  
    formatterProgress(row, column) {
      return this.progress[row.progress_id] ?? '';
    },
    customsearchAgain() {
      // customer_code = this.customer_code;
      const search_data = {
        id: this.id,
        customer_code: this.customer_code,
        customer_name: this.customer_name,
        customer_tel: this.customer_tel,
        customer_alias: this.customer_alias,
        customer_fax: this.customer_fax,
        customergroup_code: this.customergroup_code,
        customergroup: this.customergroup,
      }
      resource.customsearchAgain(this.detail.maintenance_id, search_data).then(res => {
        this.custom = res;
        // this.customer_name = res[res.length - 1].customer_name;
        // this.customer_code = res[res.length - 1].customer_code;
        // this.customer_alias = res[res.length - 1].customer_alias;
        // this.customer_tel = res[res.length - 1].TEL;
        // this.customer_fax = res[res.length - 1].FAX;
        // this.customergroup = res[res.length - 1].customergroup;
        // this.customergroup_code = res[res.length - 1].customergroup_code;
        // this.id = res[res.length - 1].id;
        // console.log(res); 
        // this.customer_alias = res.customer_name;
        // [detail.customerInformation.length - 1]
      });
    },
    select() {
      resource.customsearch(this.customer_code).then(res => {
        
          if(res == 0) {
            this.id = 0;
            alert(res);
          }
          else this.id = res[res.length - 1].id;
          

          const updatedata = {
            id: this.id,
            customer_code: this.customer_code,
            customer_tel: this.customer_tel,
            customer_alias: this.customer_alias,
            customer_fax: this.customer_fax,
            customergroup_code: this.customergroup_code,
            customergroup: this.customergroup,
            customer_name: this.customer_name,
            
          };
          
          // alert(this.detail.maintenance_id); return false;
          resource.update_customerid(this.detail.maintenance_id, updatedata).then(res => {
            this.detail.customer_code = this.customer_code;
            this.detail.customerInformation[this.detail.customerInformation.length - 1].TEL = res[res.length - 1].TEL; 
            this.detail.customerInformation[this.detail.customerInformation.length - 1].FAX = res[res.length - 1].FAX; 
            this.detail.customerInformation[this.detail.customerInformation.length - 1].customer_name = res[res.length - 1].customer_name;
          });
          // alert(this.customer_id);
      });
      // alert(this.customer_id); return false;

      // alert(createCustomerVisible);
      this.$emit('create');
    },

    getPhotoFiles() {
      resource.getPhotoFiles(this.detail.maintenance_id).then(files => {
        this.detail.photo_files = files;
      });
    },

    getReportFiles() {
      resource.getReportFiles(this.detail.maintenance_id).then(files => {
        this.detail.report_files = files;
      });
    },
  },
};
</script>
<style lang="scss" scoped>
</style>
