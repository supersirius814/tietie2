<template>
  <div>
    <h3>同一中分類過去履歴</h3>

    <el-table :data="list" :show-header="true" border style="width: 100%">
      <el-table-column align="center" class-name="history-td" label="緊/重">
        <template slot-scope="scope">
          <span>{{ scope.row.is_emergency == 1 ? '緊急' : '' }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" class-name="history-td" label="メンテナンスNo" >
        <template slot-scope="scope">
          <router-link :to="'/maintenance/detail/'+scope.row.maintenance_id" class="link-type" target= '_blank'>
            <span v-html="scope.row.maintenance_code"></span>
          </router-link>
        </template>
      </el-table-column>
      <el-table-column align="center" class-name="history-td" label="ステータス">
        <template slot-scope="scope">
          <span>{{ scope.row.progress.status }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" class-name="history-td" prop="created_at" label="依頼日" />
      <el-table-column align="center" class-name="history-td" label="完了日">
        <template slot-scope="scope">
          <span>{{ '' }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" class-name="history-td" label="取引先名">
        <template slot-scope="scope">
          <span>{{ '' }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" class-name="history-td" label="依頼内容">
        <template slot-scope="scope">
          <span>{{ scope.row.order.substr(0, 10) }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" class-name="history-td" label="会計年月">
        <template slot-scope="scope">
          <span>{{ '' }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" class-name="history-td" label="請求金額（税抜）">
        <template slot-scope="scope">
          <span>{{ '' }}</span>
        </template>
      </el-table-column>
    </el-table>
    <div style="text-align:center;margin-top:10px;">
      <pagination v-show="total>0" :total="total" :page.sync="query.page" :limit.sync="query.limit" layout="total, prev, pager, next, jumper" @pagination="getList" />
    </div>
  </div>
</template>

<script>
import Pagination from '@/components/Pagination'; // Secondary package based on el-pagination
import MaintenanceResource from '@/api/maintenance';

const resource = new MaintenanceResource();

export default {
  components: { Pagination },
  props: {
    subCategoryId: {
      type: Number,
      default: 0,
    },
  },
  data() {
    return {
      list: null,
      total: 0,
      loading: true,
      query: {
        page: 1,
        limit: 8,
        sub_category_id: this.subCategoryId,
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    async getList() {
      const { limit, page } = this.query;
      this.loading = true;
      const { data, meta } = await resource.classHistory(this.query);
      this.list = data;
      if (!Array.isArray(data)) {
        return;
      }
      this.list.forEach((element, index) => {
        element['index'] = (page - 1) * limit + index + 1;
      });
      this.total = meta.total;
      this.loading = false;
    },
  },
};
</script>

<style scoped>
.pagination-container {
  background: #fff;
  padding: 1px 16px !important;
  margin-top: 10px !important;
}
.pagination-container.hidden {
  display: none;
}
</style>
