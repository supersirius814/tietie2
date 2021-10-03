<template>
  <div>
    <el-row :gutter="20">
      <el-col>
        <table class="detail-table">
          <tbody>
            <tr>
              <th>特記①</th>
              <td class="input-td">
                <input value="" v-model="note1" class="el-input__inner" />
              </td>
            </tr>
            <tr>
              <th>特記②</th>
              <td class="input-td">
                <input value="" v-model="note2" class="el-input__inner" />
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <el-button type="primary" @click="saveNotes()">選択</el-button>
  </div>
</template>

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
    saveNotes() {
      const input_data = {
        note1: this.note1,
        note2: this.note2,
      };
      maintenanceresource.saveNotes(this.detail.shop.shop_id, input_data).then((res)=> {
        this.detail.shop.note1 = res[0].note1;
        this.detail.shop.note2 = res[0].note2;
      });
    },
    selectreason() {
      const data = {
        reason: this.reason,
        other: this.other,
      };

      maintenanceresource.selectreason(this.detail.maintenance_id, data).then((res) => {
        console.log(res.reason);
        this.detail.order_reason[0].order_reason_id = res.order_reason_id;
        this.detail.order_reason[0].reason = res.reason;
        this.detail.order_type_other_text = this.other;
      });
    },
  },
};
</script>
