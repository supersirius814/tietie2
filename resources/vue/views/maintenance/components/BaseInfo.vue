<template>
  <div>
    <!-- {{ detail.shop }} -->
    <h3>基本情報</h3>

    <el-row :gutter="0">
      <el-col :span="12">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>店舗CD</th>
              <td style="text-align:center">{{ detail.shop.shop_id }}</td>
              <td style="text-align:center">{{ detail.shop.business_category.business_category }}</td>
            </tr>
            <tr>
              <th>TEL</th>
              <td colspan="2" style="text-align:center">{{detail.shop.shop_phone_number}}</td>
            </tr>
            <tr>
              <th>開店日</th>
              <td colspan="2" style="text-align:center">{{ detail.shop.shop_open_date }}</td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="12">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>店舗名</th>
              <td> {{ detail.shop.shop_name }}</td>
            </tr>
            <tr>
              <th>FAX</th>
              <td>{{ detail.shop.shop_fax_number }}</td>
            </tr>
            <tr>
              <th>店舗担当</th>
              <td>{{ userName }}</td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-divider />
    <h3>担当者メール</h3>
    <!-- <table class="detail-table">
      <tr>
        <td></td>
        <td>名称</td>
        <td>担当者</td>
        <td>メール宛先</td>
        <td>メールCC</td>
      </tr>
      <tr>
        <td>営業部</td>
        <th>{{ detail.mail_data11[0]['department_name'] ? detail.mail_data11[0]['department_name'] : '' }}</th>
        <td>{{ detail.mail_data1[0]['name'] }}</td>
        <td prop="to">
          <template slot-scope="scope">
            <el-checkbox v-model="scope.row.to" />
          </template>
        </td>
        <td prop="cc">
          <template slot-scope="scope">
            <el-checkbox v-model="scope.row.cc" />
          </template>
        </td>
      </tr>
      <tr>
        <th>{{ detail.mail_data11[0]['department_name'] ? detail.mail_data11[0]['department_name'] : '' }}</th>
        <td>{{ detail.mail_data1[0]['name'] }}</td>
        <td prop="to">
          <template slot-scope="scope">
            <el-checkbox v-model="scope.row.to" />
          </template>
        </td>
        <td prop="cc">
          <template slot-scope="scope">
            <el-checkbox v-model="scope.row.cc" />
          </template>
        </td>
      </tr>
    </table> -->
    <el-table :data="tableData" :show-header="true" border style="width: 100%; margin:auto;">
      <el-table-column align="center" prop="title" class-name="header-1" label="" />
      <el-table-column align="center" prop="name" label="名称" />
      <el-table-column align="center" prop="manager" label="担当者" />
      <el-table-column align="center" prop="to" label="メール宛先">
          <template slot-scope="scope">
            <el-checkbox v-model="scope.row.to" />
          </template>
      </el-table-column>
      <el-table-column align="center" prop="cc" label="メールCC">
        <template slot-scope="scope">
          <el-checkbox v-model="scope.row.cc" />
        </template>
      </el-table-column>
    </el-table>
    <div style="text-align:right;margin-top:10px;">
      <span>宛先とCC宛先、それぞれ選択してください。</span> 
      <el-button type="primary" size="small" @click="getsend()" >メーラー起動</el-button>
    </div>

    <el-divider />
    <h3>特記情報</h3>
    <table class="detail-table">
      <tbody>
        <tr>
          <th>特記①</th>
          <td>{{ detail.shop.note1 }}</td>
        </tr>
        <tr>
          <th>特記②</th>
          <td>{{ detail.shop.note2 }}</td>
        </tr>
      </tbody>
    </table>
    <div style="text-align:right;margin-top:10px;">
      <el-button type="primary" size="small" @click="createNotesShow()">特記編集</el-button>
    </div>
    <!-- <transition name="notetransition">
      <template v-if="createNotesVisible"> -->
    <el-dialog
      title="【特記情報 編集】"
      :visible.sync="createNotesVisible"
      width="43%"
      custom-class="slide-dialog"
      top="0px"
      :modal="false"
    >

        <CreateNotes :detail="detail"/>

    </el-dialog>
      <!-- </template>
    </transition> -->
  </div>
</template>
<style>
.notetransition-enter-active, .notetransition-leave-active {
  transition: opacity .5s;
}
.notetransition-enter, .notetransition-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
</style>
<script>
import MaintenanceResource from '@/api/maintenance';

import CreateNotes from './sub/CreateNotes.vue';

export default {
  components: { MaintenanceResource, CreateNotes },
  props: {
    detail: {
      type: Object,
      default: () => {
        return {};
      },
    },
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
  },
  data() {
    return {
      mail_data: 'mailto:' + this.detail.user.email,
      userName: '', 
      createNotesVisible: false,
      visibleflag: true,
 

      tableData: [
        { title: '地域会社', name: '-', manager: '-', to: false, cc: false },
        { title: '営業部', name: this.detail.mail_data11[0]['department_name'], manager: this.detail.mail_data1[0]['name'], email: this.detail.mail_data1[0]['email'], to: false, cc: false },
        { title: 'ディストリクト', name: this.detail.mail_data22[0]['district_name'], manager: this.detail.mail_data2[0]['name'], email: this.detail.mail_data2[0]['email'], to: false, cc: false },
        { title: 'ブロック', name: this.detail.mail_data33[0]['block_name'], manager: this.detail.mail_data3[0]['name'], email: this.detail.mail_data3[0]['email'], to: false, cc: false },
        // { title: 'エリア', name: '安城', manager: '細川', to: false, cc: false },
      ],
    };
  },  
  created(){
    this.$store.dispatch('user/getInfo').then(user => {
      this.userName = user.name;
    });
  },
  methods: {
    createNotesShow() {
      this.createNotesVisible = true;
      document.querySelector('#app > div > div.main-container > section > div > div.el-row > div:nth-child(1) > div > div.el-card__body > div:nth-child(10) > div > div.el-dialog__body > div > div.el-dialog__wrapper').classList.remove('close-css');
    },
    getsend() {
      var emails_ge = "", emails_cc = "", emails = "", subject="";
      var flag = 0, flag_re = 0, first_check = 0;

      this.tableData.forEach(element => {
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
      if(emails_ge == "") {
        emails = emails_cc;
      } else if((emails_cc != "")){
        emails = emails_ge + "?" + emails_cc;
      } else if(emails_ge != ""){
        emails = emails_ge; 
      }

      subject = '?subject='
      if(this.detail.shop.shop_id != '') {
        subject += '店舗CD: ' + this.detail.shop_id + ' '; 
      }
      if(this.detail.shop.shop_name) {
        subject += '店舗名: ' + this.detail.shop_id + ' ';
      }
      if(this.detail.sub_category.sub_category_name) {
        subject += '中分類: ' + this.detail.sub_category.sub_category_name + ' ';
      }
      var mailhref = "mailto:" + emails + subject;
      // console.log(mailhref);
      window.location.href = mailhref;
    },
  },
};
</script>

<style>
@keyframes dialog-fade-in {
  0% {
    transform: translate3d(0, 100%, 0);
    opacity: 0;
  }
  100% {
    transform: translate3d(0, 0, 0);
    opacity: 1;
  }
}
@keyframes dialog-fade-out {
  0% {
    transform: translate3d(0, 0, 0);
    opacity: 1;
  } 
  100% {
    transform: translate3d(0, -100%, 0);
    opacity: 0;
  }
}
</style>