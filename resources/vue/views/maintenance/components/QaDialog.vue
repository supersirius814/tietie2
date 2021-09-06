<template>

  <div style="padding-bottom:10px;">
    <quotation-info  v-if="detail" :detail="detail"  />
    <accounting-info v-if="detail" :detail="detail" />
  </div>
</template>
<!--
// <script>
// import AccountingInfo from './AccountingInfo.vue';
// import QuotationInfo from './QuotationInfo.vue';

// export default {
//   components: { QuotationInfo, AccountingInfo },
//   props: {
//     user: {
//       type: Object,
//       default: () => {
//         return {
//           name: '',
//           email: '',
//           avatar: '',
//           roles: [],
//         };
//       },
//     },
//   },
//   data() {
//     return {
//     };
//   },
//   mounted() {
//     const dialogs = document.querySelectorAll('.slide-dialog');
//     dialogs.forEach(el => {
//       el.closest('.el-dialog__wrapper').classList.add('slide-dialog-wrapper');
//     });
//   },
//   methods: {
//   },
// };
// </script>

-->
<script>

import QuotationFiles from './sub/QuotationFiles.vue';
import PhotoFiles from './sub/PhotoFiles.vue';
import ReportFiles from './sub/ReportFiles.vue';
import ProgressEdit from './sub/ProgressEdit.vue';

import AccountingInfo from './AccountingInfo.vue';
import QuotationInfo from './QuotationInfo.vue';

export default {
  components: { QuotationFiles, PhotoFiles, ProgressEdit, ReportFiles, QuotationInfo, AccountingInfo  },
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
      editVisible: false,
      quotationFilesVisible: false,
      photoFilesVisible: false,
      reportFilesVisible: false,
      progress: [],
    };
  },
  created() {
    this.progress = {
      1: 'BM承認待ち',
      2: 'BM承認',
      3: 'BM差戻し',
      4: 'BM却下',
      5: 'BM保留',
      6: '本部受付前',
      7: '本部差戻し',
      8: '本部見送り',
      9: '依頼確定',
      10: '依頼済',
      11: '見積待ち',
      12: '見積精査中',
      13: '入荷待ち',
      14: 'DM承認待ち',
      15: '稟議中',
      16: '見積発注済み',
      17: '日程調整中',
      18: '訪問待ち',
      19: '報告待ち',
      20: '店完了',
      21: '取完了',
      22: '問合せ中',
    };
  },
  mounted() {
    const dialogs = document.querySelectorAll('.slide-dialog');
    dialogs.forEach(el => {
      el.closest('.el-dialog__wrapper').classList.add('slide-dialog-wrapper');
    });
  },
  methods: {
    formatterProgress(row, column) {
      return this.progress[row.progress_id] ?? '';
    },
  },
};
</script>