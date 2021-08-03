<template>
  <div class="app-container">
    <el-button type="primary" size="mini"><svg-icon icon-class="upload" />  同一中分類過去履歴</el-button>
    <el-button type="primary" size="mini"><svg-icon icon-class="upload" style="transform: rotate(270deg);" />  見積 / 会計 情報</el-button>
    <el-row :gutter="20">
      <el-col :span="12">
        <request-info :user="user" />
      </el-col>
      <el-col :span="12">
        <history-info :user="user" />
      </el-col>
    </el-row>
  </div>
</template>

<script>
import Resource from '@/api/resource';
import RequestInfo from './components/RequestInfo';
import HistoryInfo from './components/HistoryInfo';

const userResource = new Resource('users');
export default {
  name: 'EditUser',
  components: { RequestInfo, HistoryInfo },
  data() {
    return {
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
