<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="24">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>特記①</th>
              <td style="padding: 0 5px">
                <textarea
                  v-model="note1"
                  style="border: none; height: 70px; width: 100%"
                />
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>

    <el-row>
      <el-col :span="24">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>特記②</th>
              <td style="padding: 0 5px">
                <textarea
                  v-model="note2"
                  style="border: none; height: 70px; width: 100%"
                />
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <div style="text-align: right; padding-bottom: 15px">
      <el-button type="primary" size="small" @click="saveNotes()"
        >登録</el-button
      >
      <el-button type="default" size="small" @click="handleClose()"
        >閉じる</el-button
      >
    </div>
  </div>
</template>

<style>
.close-css {
  display: none;
}
</style>

<script>
import MaintenanceResource from '@/api/maintenance';
const maintenanceresource = new MaintenanceResource();

export default {
  props: {
    detail: {
      type: Object,
      default: () => {
        return {};
      },
    },
  },
  created() {
    this.note1 = this.detail.shop.note1;
    this.note2 = this.detail.shop.note2;
  },
  data() {
    return {
      note1: '',
      note2: '',
    };
  },
  methods: {
    handleClose() {
      document.querySelector("#app > div > div.main-container > section > div > div.el-row > div:nth-child(1) > div > div.el-card__body > div:nth-child(9) > div > div.el-dialog__body > div > div.el-dialog__wrapper").click();
    },

    saveNotes() {
      const input_data = {
        note1: this.note1,
        note2: this.note2,
      };
      maintenanceresource
        .saveNotes(this.detail.shop.shop_id, input_data)
        .then((res) => {
          this.detail.shop.note1 = res[0].note1;
          this.detail.shop.note2 = res[0].note2;
        });
    },
    
    selectreason() {
      const data = {
        reason: this.reason,
        other: this.other,
      };

      maintenanceresource
        .selectreason(this.detail.maintenance_id, data)
        .then((res) => {
          console.log(res.reason);
          this.detail.order_reason[0].order_reason_id = res.order_reason_id;
          this.detail.order_reason[0].reason = res.reason;
          this.detail.order_type_other_text = this.other;
        });
    },
  },
};
</script>
