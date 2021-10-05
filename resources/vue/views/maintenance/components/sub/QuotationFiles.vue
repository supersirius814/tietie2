<template>
  <div>
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
            @click.prevent="quotationFileView(item.file_name)"
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
        <template v-if="quotationpdfSrc">
          <pdf :src="quotationpdfSrc"></pdf>
        </template>
      <span slot="footer" class="dialog-footer">
        <el-button @click="quotationpdfviewVisible = false">閉じる</el-button>
      </span>
    </el-dialog>
    <!-- <embed :src="ff" type="application/pdf" /> -->
  </div>
</template>

<script>
import MaintenanceResource from '@/api/maintenance';
import pdf from 'vue-pdf'

const resource = new MaintenanceResource();
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
      quotationpdfviewVisible: false,
      quotationpdfSrc: '',
      quotationtitleData: '',
    };
    
  },
  methods: {

    quotationFileView(file_name) {
      var actionUrl = './zensho-mainte/quotationfiles/' + this.detail.maintenance_id + '/' + fileName;

      this.quotationtitleData = file_name;
      this.quotationpdfviewVisible = true;
      this.quotationpdfSrc = actionUrl;
    },
  },
};
</script>
