<template>
  <div class="app-container">
    <div style="position: fixed;top:10px;left:300px;z-index:10;">
      <el-button type="primary" size="mini" @click="bottomVisible=true"><svg-icon icon-class="upload" />  同一中分類過去履歴</el-button>
      <el-button type="primary" size="mini" @click="qaVisible=true"><svg-icon icon-class="upload" style="transform: rotate(270deg);" />  見積 / 会計 情報</el-button>
    </div>
    <el-row :gutter="20">
      <el-col :span="12">
        <request-info :user="user" />
      </el-col>
      <el-col :span="12">
        <history-info :user="user" />
      </el-col>
    </el-row>

    <el-dialog
      title=""
      :visible.sync="qaVisible"
      width="900px"
      custom-class="slide-dialog"
      top="0px"
    >
      <qa-dialog />
    </el-dialog>

    <el-dialog
      title=""
      :visible.sync="bottomVisible"
      width="100%"
      custom-class="bottom-dialog"
      top="0px"
    >
      <bottom-dialog />
    </el-dialog>

  </div>
</template>

<script>
import Resource from '@/api/resource';
import RequestInfo from './components/RequestInfo';
import HistoryInfo from './components/HistoryInfo.vue';
import QaDialog from './components/QaDialog.vue';
import BottomDialog from './components/BottomDialog.vue';

const userResource = new Resource('users');
export default {
  name: 'EditUser',
  components: { RequestInfo, HistoryInfo, QaDialog, BottomDialog },
  data() {
    return {
      qaVisible: false,
      bottomVisible: false,
      user: {},
    };
  },
  watch: {
    '$route': 'getUser',
  },
  created() {
    // const id = this.$route.params && this.$route.params.id;
    // this.getUser(id);
  },
  methods: {
    async getUser(id) {
      const { data } = await userResource.get(id);
      this.user = data;
    },
  },
};
</script>

<style lang="scss" scoped>
.el-row {
  margin-bottom: 10px;
  &:last-child {
    margin-bottom: 0;
  }
}
</style>
