<template>
  <div style="padding-bottom:10px;">
    <quotation-info />
    <accounting-info />
  </div>
</template>

<script>
import AccountingInfo from './AccountingInfo.vue';
import QuotationInfo from './QuotationInfo.vue';

export default {
  components: { QuotationInfo, AccountingInfo },
  props: {
    user: {
      type: Object,
      default: () => {
        return {
          name: '',
          email: '',
          avatar: '',
          roles: [],
        };
      },
    },
  },
  data() {
    return {
    };
  },
  mounted() {
    const dialogs = document.querySelectorAll('.slide-dialog');
    dialogs.forEach(el => {
      el.closest('.el-dialog__wrapper').classList.add('slide-dialog-wrapper');
    });
  },
  methods: {
  },
};
</script>
