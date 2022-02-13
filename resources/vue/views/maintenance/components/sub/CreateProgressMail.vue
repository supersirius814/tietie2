<template>
  <div>
    <!-- {{ maildata }} -->
    <el-table :data="parents_staff" :show-header="true" border style="width: 100%; margin:auto;">
      <el-table-column align="center" prop="name" label="担当者" />
      <el-table-column align="center" prop="name" label="メール宛先">
        <template slot-scope="scope">
          <el-checkbox v-model="scope.row.to" />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="name" label="メールCC">
        <template slot-scope="scope">
          <el-checkbox v-model="scope.row.cc" />
        </template>
      </el-table-column>
    </el-table>
    <div style="text-align:right;margin-top:10px;">
      <span>宛先とCC宛先、それぞれ選択してください。</span> 
      <el-button type="primary" size="small" @click="getProgressSend()" >メーラー起動</el-button>
    </div>
  </div>
</template>

<script>
import MaintenanceResource from '@/api/maintenance';

const resource = new MaintenanceResource();

export default {
  props: {
    user: {
      type: Object,
      default: () => {
        return {
          name: '',
          email: '',
          avatar: '',
          roles: [],
        };
      },
    },
    maildata: {
      type: Object,
      default: () => {
        return {};
      },
    },
    detail: {
      type: Object,
      default: () => {
        return {};
      },
    },
  },
  data() {
    return {
      parents_staff: [],
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
    getPartners_staff(){
        var data = {
          partner_id: this.detail.partner_id,
        };
        resource.getPartners_staff(data).then(res => {
          this.parents_staff = res;
          // if(this.parents.length > 0) this.chkparent = true;
          // console.log(res);
        });
    },

    getProgressSend(){

      var toCnt = 0, ccCnt = 0, toArray = [], ccArray = [];

      this.parents_staff.forEach(element => {
        if(element.to == true){
          toArray[toCnt] = element.email;
          toCnt ++;
        }

        if(element.cc == true){
          ccArray[ccCnt] = element.email;
          ccCnt ++;
        }
      });

      // console.log(toArray);
      // console.log(ccArray);
      // return;

      var data = {
        maintenance_id: this.detail.maintenance_id,
        toMail: toArray,
        ccMail: ccArray
      }


      resource.progressSendMail(data).then(res => {
          this.getPartners_staff();
      });
    },

  },
  created(){
    this.getPartners_staff();
  }
};
</script>
