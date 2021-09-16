<template>


  <div>
       
   
    <el-row :gutter="20" v-if="detail.order_type.order_type_id < 4">
      <el-col :span="5">
          <input type="radio" v-model="reason" value="1">紛失
      </el-col>
      <el-col :span="5"> <input type="radio" v-model="reason" value="2">劣化</el-col>
      <el-col :span="5"><input type="radio" v-model="reason" value="3">破損</el-col>
      <el-col :span="5"><input type="radio" v-model="reason" value="4">追加</el-col>
  
      <br />
      <!-- <span>value: {{color}}</span> -->
     
    </el-row>




    <el-row :gutter="20" v-if="detail.order_type.order_type_id > 3">
      <el-col :span="15">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>その他</th>
              <td class="input-td">
                <input value="" v-model="other" class="el-input__inner"/>
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
    <el-button type="primary" @click="selectreason()">選択</el-button>
    <!-- <el-table :data="tableData" :show-header="true" border style="width: 100%; margin:auto;">
      <el-table-column align="center" prop="title" label="担当者" />
      <el-table-column align="center" prop="title" label="メール宛先">
        <template slot-scope="scope">
          <el-checkbox v-model="scope.row.value" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="title" label="メールCC">
        <template slot-scope="scope">
          <el-checkbox v-model="scope.row.value1" />
        </template>
      </el-table-column>
    </el-table> -->
  </div>
</template>

<script>
import MaintenanceResource from '@/api/maintenance';
const resource = new MaintenanceResource();


export default {
  props: {
    
    detail: {
      type: Object,
      default: () => {
        return {};
      },
    },
    
  },
  created() {
    // alert(this.detail.order_reason[0].order_reason_id)
   
    // this.getImage();
  },
  data() {
    return {
      reason: this.detail.order_reason[0].order_reason_id,
      other: this.detail.order_type_other_text,
      tableData: [
        {
          title: '町野',
          value: false,
          value1: false,
        },
        {
          title: '高木',
          value: false,
          value1: false,
        },
        {
          title: '山田克',
          value: false,
          value1: false,
        },
        {
          title: '細川',
          value: false,
          value1: false,
        },
      ],
    };
  },
  methods: {
    selectreason() {
        
       

        const data = {
          reason: this.reason,
          other: this.other,
        }
      
      resource.selectreason(this.detail.maintenance_id, data).then(res => {
        console.log(res.reason);
        this.detail.order_reason[0].order_reason_id = res.order_reason_id;
        this.detail.order_reason[0].reason = res.reason;
        this.detail.order_type_other_text = this.other;
        // this.detail.order_type_other_text = res.other;
      });
    },
  },
};
</script>
