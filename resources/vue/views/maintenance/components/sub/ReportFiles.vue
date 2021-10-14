<template>
  <div>
    <el-row :gutter="20">
      <el-col v-for="item in detail.uploading_files" :key="item.id" :span="4" style="text-align:center;">
        <span v-if="item.kind == 'report'">
          <a
            href="#"
            @click.prevent="reportFileView(item.file_name, item.file_path)"
          >
            <i class="el-icon-picture" style="display:block; font-size:60px;margin:auto;margin-bottom:10px;" />
            {{ item.file_name }}
          </a>
        </span>
      </el-col>
    </el-row>

    <el-dialog
      :visible.sync="reportpdfviewVisible"
      :width="viewDialogWidth"
      :modal="false"
    >
      <span slot="title" ><i class="el-icon-info"></i> {{ reporttitleData }} </span>
            <!-- <template  v-if="reportpdfSrc">
              <VuePdfApp :src="reportpdfSrc" />
            </template> -->
          <!-- <embed
            v-if="reportpdfSrc"
                  type="video/webm"
                  :src="reportpdfSrc"
                  width="100%"
                  style="max-height: 50rem; min-height: 30rem"
            /> -->
            <template  v-if="reportpdfSrc">
              <iframe id="pdf-iframe" :src="reportpdfSrc"></iframe>
            </template>
      <span slot="footer" class="dialog-footer">
        <el-button @click="reportpdfviewVisible = false">閉じる</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import pdf from 'vue-pdf'
import VuePdfApp from "vue-pdf-app"

export default {
  components: {
    pdf, VuePdfApp,
  },
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
      reportpdfviewVisible: false,
      reportpdfSrc: '',
      reporttitleData: '',
      viewDialogWidth: '45%',
    };
    
  },

  mounted() {
    if(this.isMobile()) {
      this.viewDialogWidth = '100%';
    }    
  },

  methods: {
    isMobile() {
      var check = true;
      if(document.querySelector("body").clientWidth > 737) check = false;
      return check;
    },

    reportFileView(file_name, file_path) {
      // var split_path = file_path.split('/');
      // var fileName = split_path[split_path.length - 1];
      // var actionUrl =  './maintenance/reportfile/' + fileName;

      /* s3 file get */
      var actionUrl = './zensho-mainte/reportfile/' + this.detail.maintenance_id + '/' + file_name;
      this.reporttitleData = file_name;

      // this.reporttitleData = fileName;
      this.reportpdfviewVisible = true;
      this.reportpdfSrc = actionUrl;
    },
  },
};
</script>
