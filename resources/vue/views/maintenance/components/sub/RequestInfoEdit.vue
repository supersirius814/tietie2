<template>
  <div>
    
    <!-- {{categories}} -->
    <!-- {{categories}}
  {{subCategories}} -->
      <el-checkbox v-model="data_re.is_emergency" :checked="data_re.is_emergency == 1" label="緊急・重要" />
      <el-checkbox v-model="data_re.is_disaster" :checked="data_re.is_disaster == 1" label="災害（地震・台風・大雨など）" />
    <br>
    <br>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>大分類*</th>
              <td  class="input-td">
                <el-select v-model="big_ca" size="small" placeholder="" clearable style="width: 100%" class="filter-item" v-on:change="big_middleconnect()">
                  <el-option v-for="item in categories" :key="item.category_id" :label="item.category_name" :value="item.category_id" />
                </el-select>
              </td>
            </tr>
            <tr>
              <th>中分類*</th>
              <td  class="input-td">
                <el-select v-model="mid_ca" size="small" placeholder="" clearable style="width: 100%" class="filter-item" v-on:change="middle_bigconnect()">
                  <el-option v-for="item in subCategories" :key="item.sub_category_id" :label="item.sub_category_name" :value="item.sub_category_id" />
                </el-select>
              </td>
            </tr>
          </tbody>
        </table>
        <table class="detail-table">
          <tbody>
            <tr>
              <th>依頼区分*</th>
              <td class="input-td">
                <!-- {{detail.order_type.type}}
                {{ orderTypes}} -->
                <el-select v-model="current_order" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
                  <el-option v-for="item in orderTypes" :key="item.order_type_id" :label="item.type" :value="item.order_type_id" />
                </el-select>
              </td>
            </tr>
          </tbody>
        </table>
        <div v-show="current_order == 2">
          発注理由
          <el-checkbox-group v-model="order_checkList">
            <el-checkbox label="紛失"></el-checkbox>
            <el-checkbox label="劣化"></el-checkbox>
            <el-checkbox label="破損"></el-checkbox>
            <el-checkbox label="追加"></el-checkbox>
          </el-checkbox-group>
        </div>
        <el-input
          v-show="current_order == 4"
          placeholder="その他"
          v-model="order_text">
        </el-input>
      </el-col>

      <el-col :span="14">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>取引先コード</th>
              <td>{{detail.customer_code}}</td>
              <td style="border:none;padding:0 5px;">
                <el-button type="info" size="small" @click="createCustomerVisibleSetting()">検索</el-button>
              </td>
            </tr>
          </tbody>
        </table>
        <table class="detail-table">
          <tbody>
            <tr>
              <th>取引先名</th>
              <td colspan="2">{{ detail.partner_name }}</td>
            </tr>
            <tr>
              <th>TEL/FAX</th>
              <td>{{detail.TEL}}</td>
              <td>{{detail.FAX}}</td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="15">
      <el-col :xl="12" :lg="12" :md="12" :sm="24" :xs="24">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>依頼内容*</th>
              <td class="input-td">
                <!-- <textarea v-model="data_re.order" readonly rows="10" /> -->
                <textarea v-model="data_re.order" rows="10" />
              </td>
            </tr>
            <tr>
              <th>備考</th>
              <td class="input-td">
                <textarea v-model="data_re.remark" rows="5" />
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :xl="12" :lg="12" :md="12" :sm="24" :xs="24">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>何が</th>
              <td>
                {{ data_re.equipment }}
              </td>
            </tr>
            <tr>
              <th>メーカー名</th>
              <td>
                {{ data_re.manufacturer }}
              </td>
            </tr>
            <tr>
              <th>型式・品番</th>
              <td>
                {{ data_re.model_number }}
              </td>
            </tr>
            <tr>
              <th>いつから</th>
              <td>
                {{ data_re.when }}
              </td>
            </tr>
            <tr>
              <th>どんな状態</th>
              <td class="input-td">
                <textarea v-model="data_re.situation" readonly rows="5" />
              </td>
            </tr>
            <tr>
              <th>初期対応</th>
              <td class="input-td">
                <textarea v-model="data_re.first_handling" readonly rows="3" />
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>

    <table class="detail-table">
      <tbody>
        <tr>
          <th rowspan="5">案件情報</th>
          <th class="select-td">
            <el-select v-model="data_re.maintenance_matters[0].matter_option_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterOptions" :key="item.matter_option_id" :label="item.name" :value="item.matter_option_id" />
            </el-select>
          </th>
          <td class="select-td">
            <el-select v-model="data_re.maintenance_matters[0].matter_value_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterValues" :key="item.matter_value_id" :label="item.name" :value="item.matter_value_id" />
            </el-select>
          </td>
          <th class="select-td">
            <el-select v-model="data_re.maintenance_matters[5].matter_option_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterOptions" :key="item.matter_option_id" :label="item.name" :value="item.matter_option_id" />
            </el-select></th>
          <td class="select-td">
            <el-select v-model="data_re.maintenance_matters[5].matter_value_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterValues" :key="item.matter_value_id" :label="item.name" :value="item.matter_value_id" />
            </el-select>
          </td>
        </tr>
        <tr>
          <th class="select-td">
            <el-select v-model="data_re.maintenance_matters[1].matter_option_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterOptions" :key="item.matter_option_id" :label="item.name" :value="item.matter_option_id" />
            </el-select></th>
          <td class="select-td">
            <el-select v-model="data_re.maintenance_matters[1].matter_value_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterValues" :key="item.matter_value_id" :label="item.name" :value="item.matter_value_id" />
            </el-select>
          </td>
          <th class="select-td">
            <el-select v-model="data_re.maintenance_matters[6].matter_option_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterOptions" :key="item.matter_option_id" :label="item.name" :value="item.matter_option_id" />
            </el-select></th>
          <td class="select-td">
            <el-select v-model="data_re.maintenance_matters[6].matter_value_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterValues" :key="item.matter_value_id" :label="item.name" :value="item.matter_value_id" />
            </el-select>
          </td>
        </tr>
        <tr>
          <th class="select-td">
            <el-select v-model="data_re.maintenance_matters[2].matter_option_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterOptions" :key="item.matter_option_id" :label="item.name" :value="item.matter_option_id" />
            </el-select></th>
          <td class="select-td">
            <el-select v-model="data_re.maintenance_matters[2].matter_value_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterValues" :key="item.matter_value_id" :label="item.name" :value="item.matter_value_id" />
            </el-select>
          </td>
          <th class="select-td">
            <el-select v-model="data_re.maintenance_matters[7].matter_option_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterOptions" :key="item.matter_option_id" :label="item.name" :value="item.matter_option_id" />
            </el-select></th>
          <td class="select-td">
            <el-select v-model="data_re.maintenance_matters[7].matter_value_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterValues" :key="item.matter_value_id" :label="item.name" :value="item.matter_value_id" />
            </el-select>
          </td>
        </tr>
        <tr>
          <th class="select-td">
            <el-select v-model="data_re.maintenance_matters[3].matter_option_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterOptions" :key="item.matter_option_id" :label="item.name" :value="item.matter_option_id" />
            </el-select></th>
          <td class="select-td">
            <el-select v-model="data_re.maintenance_matters[3].matter_value_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterValues" :key="item.matter_value_id" :label="item.name" :value="item.matter_value_id" />
            </el-select>
          </td>
          <th class="select-td">
            <el-select v-model="data_re.maintenance_matters[8].matter_option_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterOptions" :key="item.matter_option_id" :label="item.name" :value="item.matter_option_id" />
            </el-select></th>
          <td class="select-td">
            <el-select v-model="data_re.maintenance_matters[8].matter_value_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterValues" :key="item.matter_value_id" :label="item.name" :value="item.matter_value_id" />
            </el-select>
          </td>
        </tr>
        <tr>
          <th class="select-td">
            <el-select v-model="data_re.maintenance_matters[4].matter_option_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterOptions" :key="item.matter_option_id" :label="item.name" :value="item.matter_option_id" />
            </el-select></th>
          <td class="select-td">
            <el-select v-model="data_re.maintenance_matters[4].matter_value_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterValues" :key="item.matter_value_id" :label="item.name" :value="item.matter_value_id" />
            </el-select>
          </td>
          <th class="select-td">
            <el-select v-model="data_re.maintenance_matters[9].matter_option_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterOptions" :key="item.matter_option_id" :label="item.name" :value="item.matter_option_id" />
            </el-select></th>
          <td class="select-td">
            <el-select v-model="data_re.maintenance_matters[9].matter_value_id" size="small" placeholder="" clearable style="width: 100%" class="filter-item">
              <el-option v-for="item in matterValues" :key="item.matter_value_id" :label="item.name" :value="item.matter_value_id" />
            </el-select>
          </td>
        </tr>
      </tbody>
    </table>

      <button v-on:click="show = !show" id="createcustomerVisible" style="display: none">
        ToggleCreateCustomer
      </button>
   <!-- <transition name="ffade"> -->
    <transition name="slide">

      <template v-if="show">
        <el-dialog
          title="【取引先検索】"
          :append-to-body="true"
          :visible.sync="show"
          :width="createdialogWidth"
          custom-class="slide-dialog"
          top="0px"
          :modal="false"
        >
          <create-customer :detail="detail" :selectedRow="custom"/>

          <span slot="footer" class="dialog-footer"></span> 
        </el-dialog>
      </template>
   </transition>  
  </div>
</template>

<script>
import Resource from '@/api/resource';
import MaintenanceResource from '@/api/maintenance';
import CreateCustomer from './CreateCustomer.vue';

const maintenanceResource = new MaintenanceResource();

export default {
  components: { CreateCustomer },
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
      order_Other: '',
      order_checkList: [],
      current_order: this.detail.order_type_id,
      createdialogWidth: '45%',
      show: false,
      show1: true,
      row_id:'',
      custom: null,
      custom_data: [],
      data_re: null,
      order_text: this.detail.order_type_other_text,
      big_ca: this.detail.category_id,
      mid_ca: this.detail.sub_category_id,
      createCustomerVisible: false,
      categories: [],
      subCategories: [],
      orderTypes: [],
      matterOptions: [],
      matterValues: [],
      order_type: null,
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
  created() {
    this.data_re = JSON.parse(JSON.stringify(this.detail));
    this.getList();
    this.order_checkListDisplay();
    // this.$route.params.set('name', 'john');
  },

  mounted() {
    if(this.isMobile()) {
      this.createdialogWidth = '100%';
    }
  },
  methods: {
    isMobile() {
      var check = true;
      if(document.querySelector("body").clientWidth > 737) check = false;
      return check;
    },

    order_checkListDisplay(){
        var reasons = this.detail.order_reasons;
        if (this.detail.order_type.order_type_id == 2 && reasons.length > 0) {
          reasons.forEach((el, index) => {
            this.order_checkList[index] = el.reason;
          });
        }
        // console.log('reason=======================');
        // console.log(this.order_checkList);
    },

    createCustomerVisibleSetting() {
      this.$route.params['custom_tableData'] = '';
      this.$route.params['selectedRow'] = 0;      
      this.createCustomerVisible = true;
      
      document.getElementById('createcustomerVisible').click();    
    },

    big_middleconnect () {
      // console.log(this.data_re.category_id);
      var big_caVariable;
      if(!this.big_ca) {
        this.mid_ca = '';
        big_caVariable = 0;
        // return;
      } else {
        big_caVariable = this.big_ca;
      }
      // alert(this.data.category_id);
      // alert("ddd");
      maintenanceResource.big_middleconnect(big_caVariable).then(res =>{
          this.subCategories = res;
          this.mid_ca = '';
          // console.log(res.category_id);
          // this.data_re.sub_category_id = res[0].sub_category_id;
      }); 
    },

    middle_bigconnect () {
      if(!this.mid_ca) {
        this.big_ca = '';
        return;
      }
      maintenanceResource.middle_bigconnect(this.mid_ca).then(res =>{
          // this.categories = res;
          this.big_ca = res[0].category_id;
      }); 
    },

    async getList() {
      const categoryResource = new Resource('categories');
      const subCategoryResource = new Resource('sub_categories');
      const orderTypesResource = new Resource('order_types');
      const matterOptionsResource = new Resource('matter_options');
      const matterValuesResource = new Resource('matter_values');
      this.categories = await categoryResource.list(this.query);
      this.subCategories = await subCategoryResource.list(this.query);
      this.orderTypes = await orderTypesResource.list(this.query);
      this.matterOptions = await matterOptionsResource.list(this.query);
      this.matterValues = await matterValuesResource.list(this.query);
    },
    async save() {
      // alert(this.big_ca);
      this.data_re.category_id = this.big_ca;
      this.data_re.sub_category_id = this.mid_ca;
      this.data_re.order_type_id = this.current_order;
      this.data_re.order_type_other_text = this.order_text;
      this.data_re['order_checkList'] = this.order_checkList;
      await maintenanceResource.update(this.data_re.maintenance_id, this.data_re);
    },
  },
};
</script>

<style>
  .slide-enter-active {
    transition: 0.5s;
  }

  .slide-leave-active {
    transition: 0.8s;
  }

  .slide-enter {
    transform: translate(100%, 0);
  }

  .slide-leave-to {
    transform: translate( 100%, 0);
  }

</style>
<style lang="scss" scoped>

</style>
