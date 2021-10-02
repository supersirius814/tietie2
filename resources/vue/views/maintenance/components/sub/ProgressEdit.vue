<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>経過ステータス*</th>
              <td class="select-td">
                <el-select v-model="progressId" size="small" :multiple="false" placeholder="ステータス" clearable style="width: 100%" class="filter-item">
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
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="11" :offset="3">
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
    <el-row>
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>写真</th>
              <td style="border:none;padding:0 5px;">
                <el-upload ref="uploadPhoto" :action="'/api/v2/maintenance/upload/photo/' + detail.maintenance_id" :auto-upload="false" :multiple="false" :on-success="getPhotoFiles()">
                  <el-button slot="trigger" size="small" type="info">ファイル選択</el-button>
                </el-upload>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>報告書</th>
              <td style="border:none;padding:0 5px;">
                <el-upload ref="uploadReport" :action="'/api/v2/maintenance/upload/report/' + detail.maintenance_id" :auto-upload="false" :multiple="false" :on-success="getReportFiles()">
                  <el-button slot="trigger" size="small" type="info">ファイル選択</el-button>
                </el-upload>
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
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
    <el-row>
      <el-col :span="1">
        <el-checkbox v-model="faxedToShop" style="padding:10px" />
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tr>
            <th style="width:40px;">店</th>
            <th>訪問予定連絡</th>
            <td style="border:none;padding:0 5px;">
              <el-button type="info" size="small">プレビュー</el-button>
            </td>
          </tr>
        </table>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="1">
        <el-checkbox v-model="faxedToClient" style="padding:10px" />
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tr>
            <th style="width:40px;">取</th>
            <th>進捗報告依頼</th>
            <td style="border:none;padding:0 5px;">
              <el-button type="info" size="small">プレビュー</el-button>
            </td>
          </tr>
        </table>
      </el-col>
    </el-row>
    <div style="text-align:right; padding-bottom: 15px;">
      <el-button type="primary" size="small" @click="save()">登録</el-button>
      <!-- <el-button type="default" size="small"  @click="handleClose()"  ref="Dialog" >閉じる</el-button> -->
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
            <td align="center" width="50px">{{ item.faxed_to_client == 1 ? '済' : '' }}</td>
            <td align="center" width="50px">{{ item.faxed_to_shop == 1 ? '済' : '' }}</td>
          </tr>
        </template>
      </table>
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
  data() {
    return {
      cond1: true,
      userName: '',
      comment: '',
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

    save() {
      this.$refs.uploadReport.submit();
      this.$refs.uploadPhoto.submit();
      const insertData = {
        progress_id: this.progressId,
        comment: this.comment,
        faxed_to_client: this.faxedToClient,
        faxed_to_shop: this.faxedToShop,
      };
      resource.createProgress(this.detail.maintenance_id, insertData).then(res => {
        this.detail.maintenance_progress = res;
        console.log(res);
        this.detail.progress_id = this.progressId;
        this.detail.progress = {
          progress_id: this.progressId,
          status: this.progress[this.progressId],
          // updated_at: this.detail.maintenance_id,
        };
       
        this.comment = '';
        this.faxedToClient = false;
        this.faxedToShop = false;
        this.$emit('create');
      });
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
