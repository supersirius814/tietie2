<template>
  <div>
    <!-- {{ parents_staff }} -->
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
      <el-button type="primary" size="small" @click="getsend()" >メーラー起動</el-button>
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

    getsend(){
      var emails_ge = "", emails_cc = "", emails = "", subject="";
      var flag = 0, flag_re = 0, first_check = 0;

      this.parents_staff.forEach(element => {
        if(flag < 1) {
          if(element.to ==true){
            emails_ge += element.email;
            flag ++;
          }
        }
        else if(flag > 0) {
          if(element.to ==true){
            emails_ge += ",";
            emails_ge += element.email;            
          }   
        }         
        if(flag_re < 1) {
          if(element.cc == true){
            emails_cc += "cc=";
            emails_cc += element.email;
            flag_re ++;
          }       
        }
        else if(flag_re > 0) {
          if(element.cc == true){
            emails_cc += ",";
            emails_cc += element.email;            
          }   
        }       
      });
      if((emails_cc != "")){
        emails = emails_ge + "?" + emails_cc;
      } else if(emails_ge != ""){
        emails = emails_ge; 
      }

      //shop_name and sub category name undefined remain
      var mailhref = "mailto:";

      if(emails_ge == "" && emails_cc == "") {
        return;
      } else {
        if(emails_cc == "") {
          mailhref += emails;
        } else {
          mailhref += emails;
        }
      }

      // console.log(mailhref);
      window.location.href = mailhref;
    },

  },
  created(){
    this.getPartners_staff();
  }
};
</script>
