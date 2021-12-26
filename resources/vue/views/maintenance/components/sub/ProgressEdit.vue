<template>
  <div>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <el-row style="left: 41.66%">
      <el-col :span="9" :offset="5">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>入力者</th>
              <td>{{ userName }}</td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row :gutter="15">
      <el-col :xl="10" :lg="10" :md="10" :sm="10" :xs="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>現状ステータス*</th>
              <td>
                {{ currentStatus }}
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :xl="2" :lg="2" :md="2" :sm="2" :xs="2" align="middle" style="line-height: 33px">
        <svg-icon icon-class="left-progress-arrow" />
      </el-col>
      <el-col :xl="12" :lg="12" :md="12" :sm="12" :xs="12">
        <table class="detail-table" style="width: 80%">
          <tbody>
            <tr>
              <th style="width: 40%">変更後ステータス*</th>
              <td class="input-td">
                <!-- <el-select v-model="progressId" size="small" :multiple="false" placeholder="一一一" clearable style="width: 100%" class="filter-item" v-on:change="selectProgressId()"> -->
                <el-select v-model="progressId" size="small" :multiple="false" placeholder="一一一" clearable style="width: 100%" class="filter-item">
                  <el-option label="一一一" :value="0" />
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
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>

    <el-row :gutter="20">
      <el-col :xl="12" :lg="12" :md="24" :sm="24" :xs="24" style="margin-bottom: 10px;">
        <el-row>
          <table class="detail-table" style="width: auto">
            <tbody>
              <tr>
                <th>対応期限*</th>
                <td class="input-td">
                  <!-- <datetime v-model="time1" valueType="format" placeholder="日付を選択してください。" ></datetime> -->
                  <el-date-picker
                    v-model="time1"
                    type="date"
                    format="yyyy/MM/dd"
                    value-format="yyyy-MM-dd"
                    placeholder="日付を選択してください。">
                  </el-date-picker>
                </td>
              </tr>
            </tbody>
          </table>
        </el-row>
        <el-row>
          <table class="detail-table">
            <tbody>
              <tr>
                <th>写真</th>
                <td style="border:none;padding:0 5px;">
                  <el-upload ref="uploadPhoto" :action="'/api/v2/maintenance/upload/photo/' + detail.maintenance_id" :auto-upload="false" :multiple="false" :on-success="getUploadFiles()">
                    <el-button slot="trigger" size="small" type="info">ファイル選択</el-button>
                  </el-upload>
                </td>
              </tr>
            </tbody>
          </table>
        </el-row>
        <el-row>
          <!-- <el-col :span="10"> -->
            <table class="detail-table">
              <tbody>
                <tr>
                  <th>報告書</th>
                  <td style="border:none;padding:0 5px;">
                    <el-upload ref="uploadReport" :action="'/api/v2/maintenance/upload/report/' + detail.maintenance_id" :auto-upload="false" :multiple="false" :on-success="getUploadFiles()">
                      <el-button slot="trigger" size="small" type="info">ファイル選択</el-button>
                    </el-upload>
                  </td>
                </tr>
              </tbody>
            </table>
          <!-- </el-col> -->
        </el-row>
      </el-col>


      <el-col :xl="12" :lg="12" :md="24" :sm="24" :xs="24" v-show="progressId == 10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th style="width: 7%">取</th>
              <th style="width: 25%">メンテ依頼票</th>
              <td style="width: 20%"><el-checkbox v-model="faxedToClient" style="padding: 0px 5px;" />FAX</td>
              <td><el-checkbox v-model="mailToClient" style="padding: 0px 5px" />メール</td>
              <td style="border:none;padding:0 5px;">
                <el-button type="info" size="small" @click="faxForpartner()">プレビュー</el-button>
              </td>
            </tr>
            <tr>
              <th>店</th>
              <th>依頼完了通知</th>
              <td><el-checkbox v-model="faxedToShop" style="padding: 0px 5px" />FAX</td>
              <td>
              </td>
              <td style="border:none;padding:0 5px;">
                <el-button type="info" size="small" @click="faxForshop()">プレビュー</el-button>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>

      <el-col :xl="12" :lg="12" :md="24" :sm="24" :xs="24" v-show="progressId == 18">
        <table class="detail-table">
          <tbody>
            <tr>
              <th rowspan="2" style="width: 7%">店</th>
              <th style="width: 25%">訪問予定日時</th>
              <td style="width: 48%" class="input-td">
                <el-date-picker
                  v-model="visitTime"
                  type="date"
                  format="yyyy/MM/dd"
                  value-format="yyyy/MM/dd"
                  placeholder="日付を選択してください。">
                </el-date-picker>
              </td>
              <td style="border:none;padding:0 5px;">
                <el-button type="info" size="small" @click="faxForshopnext()">プレビュー</el-button>
              </td>
            </tr>
            <tr>
              <th>連絡事項</th>
              <td class="input-td"><el-input v-model="visitComment"></el-input></td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <!-- <el-row>
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>写真</th>
              <td style="border:none;padding:0 5px;">
                <el-upload ref="uploadPhoto" :action="'/api/v2/maintenance/upload/photo/' + detail.maintenance_id" :auto-upload="false" :multiple="false" :on-success="getUploadFiles()">
                  <el-button slot="trigger" size="small" type="info">ファイル選択</el-button>
                </el-upload>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row> -->

    <el-row>
      <el-col :span="24">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>経過情報</th>
              <td style="padding:0 5px;">
                <textarea v-model="comment" style="border:none;height:70px;width:100%" />
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <!-- <el-row>
      <el-col :span="1">
        <el-checkbox v-model="faxedToShop" style="padding:10px" />
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tr>
            <th style="width:40px;">店</th>
            <th>訪問予定連絡</th>
            <td style="border:none;padding:0 5px;">
              <el-button type="info" size="small" @click="faxForshop()">プレビュー</el-button>
            </td>
          </tr>
        </table>
      </el-col>
    </el-row> -->
    <!-- <el-row>
      <el-col :span="1">
        <el-checkbox v-model="faxedToClient" style="padding:10px" />
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tr>
            <th style="width:40px;">取</th>
            <th>進捗報告依頼</th>
            <td style="border:none;padding:0 5px;">
              <el-button type="info" size="small" @click="faxForpartner()">プレビュー</el-button>
            </td>
          </tr>
        </table>
      </el-col>
    </el-row> -->


    <!-- preview data of fax -->
   <el-dialog
      custom-class="cls-fax"
     :append-to-body="true"
     :width="faxWidth"
     :visible.sync="previewFax">
     <template slot="title">
       <el-row>
         <el-col :xl="12" :lg="24" :md="24" :sm="24" :xs="24" class="fax-title">
           依頼票プレビュー
         </el-col>
         <el-col :xl="12" :lg="24" :md="24" :sm="24" :xs="24" class="btn-fax-two">
           <el-button type="info" class="fax-view-btn" round @click="viewPartner()">取引先宛プレビュー</el-button>
           <el-button type="info" class="fax-view-btn" round @click="viewStore()">店舗宛プレビュー</el-button>
         </el-col>
       </el-row>
       <hr/>
     </template>
        <partner-fax v-if="visiblePartner" :detail="detail"/>
        <store-fax v-else :detail="detail" />
     <template slot="footer"></template>
   </el-dialog>

   <el-dialog
      custom-class="cls-fax"
     :append-to-body="true"
     :width="faxWidth"
     :visible.sync="previewFaxNext"
   >
     <template slot="title">訪問予定連絡FAXプレビュー</template>
      <storenext-fax :detail="detail" :visittime="visitTime" :visitcomment="visitComment"></storenext-fax>
     <template slot="footer"></template>
   </el-dialog>

    <div style="text-align:right; padding-bottom: 15px;">
      <el-button type="primary" size="small" @click="save()">
        <span v-if="progressId == 10 || progressId == 18">登録&送信</span>
        <span v-else>登録</span>
      </el-button>
      <el-button type="default" size="small"  @click="handleClose()"  ref="Dialog" >閉じる</el-button>
    </div>
      <table  class="detail-table">
        <tr>
          <th rowspan="2">日時</th>
          <th rowspan="2">ステータス</th>
          <th rowspan="2">入力者</th>
          <th rowspan="2">コメント</th>
          <th colspan="2">
            FAX送信
          </th>       
        </tr>
        <tr>
          <th style="width: 50px">取</th>
          <th style="width: 50px">店</th>        
        </tr>
        <template v-for="item in detail.maintenance_progress">
          <tr>
            <td align="center">
              <span v-html="item.created_at"></span>
            </td>
            <td align="center">{{ progress[item.progress_id] }}</td>
            <td align="center">{{ item.entered_by.name }}</td>
            <td align="center">{{ item.comment }}</td>
            <td align="center" width="50px" class="fax-chk-symbol">{{ item.faxed_to_client == 1 ? '✔' : '' }}</td>
            <td align="center" width="50px" class="fax-chk-symbol">{{ item.faxed_to_shop == 1 ? '✔' : '' }}</td>
          </tr>
        </template>
      </table>
  <!-- <div>
    <date-picker v-model="time1" valueType="format"></date-picker>
    <date-picker v-model="time2" type="datetime"></date-picker>
    <date-picker v-model="time3" range></date-picker>
  </div> -->
  </div>
</template>

<style>
.fax-view-btn {
  background-color: #E3E3E3;
  color: #000000;
}

.fax-view-btn-clk {
  background-color: #3C8DBC!important;
  color: #ffffff;
}

.fax-view-btn:hover, .fax-view-btn:focus{
  background-color: #3C8DBC!important;
  color: #ffffff;
}

.cls-fax .el-dialog__body {
  padding: 5px 20px;
}

.fax-title {
  font-size: 28px;
}
  .btn-fax-two{
    font-size: 16px;
  }
  .close-css {
    display: none;
  }
  
  input.mx-input {
    font-size: 16px;
  }
  .mx-datepicker {
    width: -webkit-fill-available;
  }

  @media screen and (max-width: 720px) {
    #app > div > div.main-container > section > div > div.el-row > div:nth-child(2) > div > div.el-card__body > div.el-dialog__wrapper.slide-dialog-wrapper > div > div.el-dialog__body > div > div:nth-child(5) > div.el-col.el-col-10 {
      width: 75%;
      padding-left: 15px;
    }
    #app > div > div.main-container > section > div > div.el-row > div:nth-child(2) > div > div.el-card__body > div.el-dialog__wrapper.slide-dialog-wrapper > div > div.el-dialog__body > div > div:nth-child(6) > div.el-col.el-col-10 {
      width: 75%;
      padding: 5px 10px 10px 10px;     
    }
  }

</style>

<script>
import MaintenanceResource from '@/api/maintenance';
import StoreFax from './StoreFax.vue';
import StorenextFax from './StorenextFax.vue';
import PartnerFax from './PartnerFax.vue';
  // import DatePicker from 'vue2-datepicker';
  // import 'vue2-datepicker/index.css';
  // import 'vue2-datepicker/locale/ja';
import 'vue-datetime/dist/vue-datetime.css';
import { Datetime } from 'vue-datetime';

const resource = new MaintenanceResource();

export default {
  components: { Datetime, StoreFax, PartnerFax, StorenextFax },
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
      faxWidth: '50%',
      previewFax: false,
      previewFaxNext: false,
      visiblePartner: false,
      visitTime: '',
      visitComment: '',
        time1: null,
        time2: null,
        time3: null,
      currentStatus: '',
      date: '',
      cond1: true,
      userName: '',
      comment: '',
      faxedToClient: 0,
      faxedToShop: 0,
      mailToClient: 0,
      progressId: 0,
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

    if(this.detail.progress) this.currentStatus = this.detail.progress.status;

    this.visitTime = this.detail.visit_schedule_date;

  },

  mounted(){
    if(this.isMobile()) {
      this.faxWidth = '100%';
    }
  },

  methods: {
    viewPartner(){
      this.visiblePartner = true;
      document.querySelectorAll('.fax-view-btn')[0].classList.add('fax-view-btn-clk');
      document.querySelectorAll('.fax-view-btn')[1].classList.remove('fax-view-btn-clk');
    },

    viewStore(){
      this.visiblePartner = false;
      document.querySelectorAll('.fax-view-btn')[1].classList.add('fax-view-btn-clk');
      document.querySelectorAll('.fax-view-btn')[0].classList.remove('fax-view-btn-clk');
    },

    faxForshopnext(){
      this.previewFaxNext = true;
    },

    faxForshop(){
      this.previewFax = true;
      this.visiblePartner = false;
      console.log(document.querySelectorAll('.fax-view-btn')[1]);
      document.querySelectorAll('.fax-view-btn')[1].classList.add('fax-view-btn-clk');
      document.querySelectorAll('.fax-view-btn')[0].classList.remove('fax-view-btn-clk');
    },

    faxForpartner(){
      this.previewFax = true;
      this.visiblePartner = true;
      document.querySelectorAll('.fax-view-btn')[0].classList.add('fax-view-btn-clk');
      document.querySelectorAll('.fax-view-btn')[1].classList.remove('fax-view-btn-clk');
    },

    isMobile() {
      var check = true;
      if(document.querySelector("body").clientWidth > 737) check = false;
      return check;
    },

    selectProgressId() {
      this.currentStatus = this.progress[this.progressId];
    },

    handleClose(){
      document.querySelector("#app > div > div.main-container > section > div > div.el-row > div:nth-child(2) > div > div.el-card__body > div.el-dialog__wrapper.slide-dialog-wrapper").click();
    },

    save() {
      // if(this.currentStatus == this.detail.progress.status) {
      //   this.$emit('create');
      //   return;
      // } 
      this.$refs.uploadReport.submit();
      this.$refs.uploadPhoto.submit();
      var other_comment = '';
      if(this.progressId == 18){
        other_comment = this.visitTime + ' ' + this.visitComment;
      }
      const insertData = {
        progress_id: this.progressId,
        comment: this.comment,
        visit_time: this.visitTime,
        visit_comment: this.visitComment,
        faxed_to_client: this.faxedToClient,                                                                                                    
        faxed_to_shop: this.faxedToShop,
        deadline_date: this.time1,
        mail_to_client: this.mailToClient,
      };
      resource.createProgress(this.detail.maintenance_id, insertData).then(res => {
        this.detail.maintenance_progress = res;
        // console.log(res);
        this.detail.progress_id = this.progressId;
        this.detail.progress = {
          progress_id: this.progressId,
          status: this.progress[this.progressId],
          // updated_at: this.detail.maintenance_id,
        };
       
        this.comment = '';
        this.progressId = 0;
        this.time1 = null;
        this.faxedToClient = 0;
        this.faxedToShop = 0;
        this.mailToClient = 0;
        this.$emit('create');
      });
    },

    filesCnt() {
      var quotation_cnt = 0,
        photo_cnt = 0,
        report_cnt = 0;
      this.detail.uploading_files.forEach((el) => {
        if (el.kind == 'quotation') quotation_cnt++;
        if (el.kind == 'photo') photo_cnt++;
        if (el.kind == 'report') report_cnt++;
      });

      this.$route.params['q_cnt'] = quotation_cnt;
      this.$route.params['p_cnt'] = photo_cnt;
      this.$route.params['r_cnt'] = report_cnt;

    },

    getUploadFiles() {
      resource.getUploadFiles(this.detail.maintenance_id).then((files) => {
        this.detail.uploading_files = files;

        this.filesCnt();
      });
    },

  },
};
</script>
