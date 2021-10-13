<template>
  <div>
    <el-row :gutter="20">
      <el-col
        v-for="item in detail.uploading_files"
        :key="item.id"
        :span="4"
        style="text-align: center"
      >
        <span v-if="item.kind == 'photo'">
          <a
            href="#"
            @click.prevent="photoFileView(item.file_path, item.file_name)"
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

    <el-dialog :visible.sync="photoviewVisible" :width="viewDialogWidth" :modal="false">
      <span slot="title"
        ><i class="el-icon-info"></i> {{ phototitleData }}
      </span>

      <el-image
        v-if="photoSrc"
        :src="photoSrc"
        width="100%"
        style="max-height: 50rem; min-height: 30rem"
      />
      <span slot="footer" class="dialog-footer">
        <el-button @click="photoviewVisible = false">閉じる</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
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
      photoviewVisible: false,
      photoSrc: '',
      phototitleData: '',
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

    photoFileView(file_path, file_name) {
      /* local public file */

      // var split_path = file_path.split('/');
      // var fileName = split_path[split_path.length - 1];
      // var actionUrl =  './maintenance/photofile/' + fileName;
      // this.phototitleData = fileName;

      /* s3 file get */
      var actionUrl = './zensho-mainte/photofile/' + this.detail.maintenance_id + '/' + file_name;
      this.phototitleData = file_name;

      
      this.photoviewVisible = true;
      this.photoSrc = actionUrl;
    },
  },
};
</script>
