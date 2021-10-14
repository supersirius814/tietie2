<template>
  <div>
    <el-row :gutter="20">
      <el-col
        v-for="item in detail.uploading_files"
        :key="item.id"
        :span="4"
        style="text-align: center"
      >
        <span v-if="item.kind == 'quotation'">
          <a
                        href="#"
            @click.prevent="quotationFileView(item.file_name, item.file_path)"
            
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
      :width="viewDialogWidth"
      :modal="false"
    >
      <span slot="title" ><i class="el-icon-info"></i> {{ quotationtitleData }} </span>
        <!-- <template v-if="quotationpdfSrc">
          <VuePdfApp pdf="http://localhost:2000/zensho-mainte/quotationfile/101/dfdf" />
        </template> -->
          <!-- <embed
            v-if="quotationpdfSrc"
                  type="video/webm"
                  :src="quotationpdfSrc"
                  width="100%"
                  style="max-height: 50rem; min-height: 30rem"
            /> -->
            <template  v-if="quotationpdfSrc">
              <iframe style = "width: 100%; max-height: 50rem; min-height: 40rem" :src="quotationpdfSrc"></iframe>
            </template>
      <span slot="footer" class="dialog-footer">
        <el-button @click="quotationpdfviewVisible = false">閉じる</el-button>
      </span>
    </el-dialog>
    <!-- <embed :src="ff" type="application/pdf" /> -->
  </div>
</template>

<script>
import MaintenanceResource from '@/api/maintenance'
import VuePdfApp from "vue-pdf-app"
import pdf from 'vue-pdf'

const resource = new MaintenanceResource();
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
      quotationpdfviewVisible: false,
      quotationpdfSrc: '',
      quotationtitleData: '',
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

    quotationFileView(file_name, fiel_path) {
      // var split_path = file_path.split('/');
      // var fileName = split_path[split_path.length - 1];
      // var actionUrl =  './maintenance/quotationfile/' + fileName;
      // this.quotationtitleData = fileName;
      // console.log(actionUrl);

      /* s3 file get */
      var actionUrl = './zensho-mainte/quotationfile/' + this.detail.maintenance_id + '/' + file_name;
      this.quotationtitleData = file_name;
      
      this.quotationpdfviewVisible = true;
      this.quotationpdfSrc = actionUrl;
    },
  },
};
</script>
