<template>
  <div>
    <el-row :gutter="20">
      <el-col v-for="item in detail.quotation_files" :key="item.quotation_file_id" :span="4" style="text-align:center;">
        <span>
          <i class="el-icon-picture" style="display:block; font-size:60px;margin:auto;margin-bottom:10px;" />
          {{ item.file_name }}
        </span>
      </el-col>
    </el-row>
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
};
</script>
