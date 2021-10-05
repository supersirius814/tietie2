<template>
  <div>
    <el-row :gutter="20">
      <el-col v-for="item in detail.report_files" :key="item.report_file_id" :span="4" style="text-align:center;">
        <span>
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
      width="45%"
      :modal="false"
    >
      <span slot="title" ><i class="el-icon-info"></i> {{ reporttitleData }} </span>
            <template  v-if="reportpdfSrc">
              <pdf :src="reportpdfSrc" />
            </template>
          <!-- <embed
            v-if="reportpdfSrc"
                  type="video/webm"
                  :src="reportpdfSrc"
                  width="100%"
                  style="max-height: 50rem; min-height: 30rem"
            /> -->
      <span slot="footer" class="dialog-footer">
        <el-button @click="reportpdfviewVisible = false">閉じる</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import pdf from 'vue-pdf'

export default {
  components: {
    pdf
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
    };
    
  },
  methods: {

    reportFileView(file_name, file_path) {
      var fileName = split_path[split_path.length - 1];
      var actionUrl =  './maintenance/reportfile/' + fileName;

      // var actionUrl = './zensho-mainte/reportfiles/' + this.detail.maintenance_id + '/' + file_name;
      // this.reporttitleData = file_name;

      this.reporttitleData = fileName;
      this.reportpdfviewVisible = true;
      this.reportpdfSrc = actionUrl;
    },
  },
};
</script>
