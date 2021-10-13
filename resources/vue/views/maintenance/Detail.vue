<template>
  <div class="app-container">
    
  <!-- {{ detail.customerInformation }} -->
    <div style="position: fixed;top:10px;left:300px;z-index:10;">
      <el-button type="primary" size="mini" @click="bottomVisible=true"><svg-icon icon-class="upload" />  同一中分類過去履歴</el-button>
      <el-button type="primary" size="mini" @click="qaVisible=true"><svg-icon icon-class="upload" style="transform: rotate(270deg);" />  見積 / 会計 情報</el-button>
    </div>
    <el-row :gutter="20">
      <el-col :span="12">
        <request-info v-if="detail" :detail="detail" @get-detail="getDetail()" />
      </el-col>
      <el-col :span="12">
        <history-info v-if="detail" :detail="detail" />
      </el-col>
    </el-row>

    <el-dialog title="" :visible.sync="qaVisible" :width="qaDialogWidth" custom-class="slide-dialog" top="0px">
      <qa-dialog v-if="detail" :detail="detail" />
    </el-dialog>

    <el-dialog v-if="detail" title="" :visible.sync="bottomVisible" width="100%" custom-class="bottom-dialog el-dialog__wrapper bottom-dialog-wrapper" top="0px">
      <bottom-dialog :shop-id="detail.shop_id" :sub-category-id="detail.sub_category_id" />
    </el-dialog>
  </div>
</template>

<script>
import Resource from '@/api/resource';
import RequestInfo from './components/RequestInfo';
import HistoryInfo from './components/HistoryInfo.vue';
import QaDialog from './components/QaDialog.vue';
import BottomDialog from './components/BottomDialog.vue';

const resource = new Resource('maintenance');
export default {
  components: { RequestInfo, HistoryInfo, QaDialog, BottomDialog },
  data() {
    return {
      qaDialogWidth: '900px',
      qaVisible: false,
      bottomVisible: false,
      detail: null,
      visibleflag: true,
    };
  },
  created() {
    this.getDetail();
  },

  mounted() {
    if(this.isMobile()) {
      this.qaDialogWidth = '100%';
    }
  },

  methods: {
    isMobile() {
      var check = true;
      if(document.querySelector("body").clientWidth > 737) check = false;
      return check;
    },

    async getDetail() {
      const id = this.$route.params && this.$route.params.id;
      this.detail = await resource.get(id);
      if (this.detail.maintenance_matters.length < 10) {
        for (let i = this.detail.maintenance_matters.length; i < 10; i++){
          this.detail.maintenance_matters.push({ maintenance_matter_id: null, matter_option_id: null, matter_value_id: null });
        }
      }
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

// bottomdialog pop up down, out setting
<style>
@keyframes dialog-fade-in {
  0% {
    transform: translate3d(0, 100%, 0);
    opacity: 0;
  }
  100% {
    transform: translate3d(0, 0, 0);
    opacity: 1;
  }
}
@keyframes dialog-fade-out {
  0% {
    transform: translate3d(0, 0, 0);
    opacity: 1;
  }
  100% {
    transform: translate3d(0, 100%, 0);
    opacity: 0;
  }
}


@media screen and (max-width: 520px) {

  #app > div > div.main-container > section > div > div:nth-child(1) {
    left: 195px!important;
    font-size: 7px!important;
    top: 13px!important;
  }

  #app > div > div.main-container > section > div > div:nth-child(1) button {
    font-size: 7px!important;
  }  

  #breadcrumb-container {
    font-size: 10px;
  }

  #app > div > div.main-container > section > div > div.el-row > div:nth-child(1) {
    width: 100%;
  }

  #app > div > div.main-container > section > div > div.el-row > div:nth-child(2) {
    width: 100%;
    padding-top: 15px;
  }

  .detail-table th {
      width: 66px;
      font-size: 8px;
  }

  #app > div > div.main-container > section > div > div.el-row > div:nth-child(1) > div > div.el-card__body > div:nth-child(4) > div.el-col.el-col-10 > table:nth-child(2) > tbody > tr > td > span {
    padding: 0px;
  }

  #app > div > div.main-container > section > div > div.el-row > div:nth-child(1) > div > div.el-card__body > div:nth-child(4) > div.el-col.el-col-10 > table:nth-child(2) > tbody > tr > td > button {
    padding: 5px;
  }

  #app > div > div.main-container > section > div > div.el-row > div:nth-child(2) > div > div.el-card__body > div.el-row > div:nth-child(2) button{
    font-size: 7px!important;
  }

  #app > div > div.main-container > section > div > div.el-row > div:nth-child(2) > div > div.el-card__body > div.el-row > div:nth-child(2) {
    display: flex;
  }
  
}
</style>