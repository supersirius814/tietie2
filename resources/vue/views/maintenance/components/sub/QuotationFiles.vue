<template>
  <div>
    <!-- {{this.uri}} -->
    <!-- {{detail.quotation_files}} -->
    <el-row :gutter="20">
      <el-col
        v-for="item in detail.quotation_files"
        :key="item.quotation_file_id"
        :span="4"
        style="text-align: center"
      >
        <span>
          <a
            href="#"
            @click.prevent="quotationFileView(item.file_path, item.file_name)"
          >
            <i
              class="el-icon-picture"
              style="
                display: block;
                font-size: 60px;
                margin: auto;
                margin-bottom: 10px;
              "
            />
            {{ item.file_name }}
          </a>
        </span>
      </el-col>
    </el-row>

    <el-dialog
      :visible.sync="quotationpdfviewVisible"
      width="45%"
      :modal="false"
    >
      <span slot="title" ><i class="el-icon-info"></i> {{ quotationtitleData }} </span>
          <embed
            v-if="quotationpdfSrc"
                  type="video/webm"
                  :src="quotationpdfSrc"
                  width="100%"
                  style="max-height: 50rem; min-height: 30rem"
            />
      <span slot="footer" class="dialog-footer">
        <el-button @click="quotationpdfviewVisible = false">閉じる</el-button>
      </span>
    </el-dialog>
    <!-- <embed :src="ff" type="application/pdf" /> -->
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
      quotationpdfviewVisible: false,
      quotationpdfSrc: '',
      quotationtitleData: '',
    };
    
  },
  methods: {

    quotationFileView(file_path, file_name) {
      var split_path = file_path.split('/');
      var fileName = split_path[split_path.length - 1];
      var actionUrl =  './maintenance/quotationfile/' + fileName;
      // console.log(actionUrl);

      this.quotationtitleData = file_name;
      this.quotationpdfviewVisible = true;
      this.quotationpdfSrc = actionUrl;
    },
  },
};
</script>
