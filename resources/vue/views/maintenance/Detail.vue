<template>
  <div class="app-container">
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
import BaseInfo from './components/BaseInfo';
import SpecialInfo from './components/SpecialInfo';
import RequestInfo from './components/RequestInfo';
import ProgressInfo from './components/ProgressInfo';
import QuotationInfo from './components/QuotationInfo';
import AccountingInfo from './components/AccountingInfo';
import HistoryInfo from './components/HistoryInfo';

const userResource = new Resource('users');
export default {
  name: 'EditUser',
  components: { BaseInfo, SpecialInfo, RequestInfo, ProgressInfo, QuotationInfo, AccountingInfo, HistoryInfo },
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
