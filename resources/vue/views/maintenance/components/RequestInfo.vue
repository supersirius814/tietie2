<template>
  <el-card class="box-card">
    <!-- {{detail}}wwww -->
    <div slot="header" class="clearfix">
      <span>依頼情報</span>
     
      <el-button
        style="float: right"
        type="primary"
        size="small"
        @click="editVisible = true"
      >編集</el-button>
    </div>

    <br />
    <el-row :gutter="10">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th style="line-height: 3">メンテナンスNo</th>
              <td>{{ detail.maintenance_code }}</td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>店舗CD</th>
              <td style="text-align: center">{{ detail.shop.shop_id }}</td>
              <td style="text-align: center">
                {{ detail.shop.business_category.business_category }}
              </td>
            </tr>
            <tr>
              <th>店舗名</th>
              <td colspan="2" style="text-align: center">
                {{ detail.shop.shop_name }}
              </td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="4">
        <el-button
          type="info"
          size="mini"
          width="120px"
          @click="baseInfoVisible = true"
        >基本情報</el-button>
      </el-col>
    </el-row>
    <el-divider />
    <el-row :gutter="10">
      <el-col :span="10">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>大分類*</th>
              <td class="select-td">
                <el-select size="small" :multiple="false" placeholder="大分類名" clearable style="width: 100%" class="filter-item" v-model="detail.bmcategoryTable_big.big_id">
                    <el-option
                      v-for="item in detail.bmcategoryTable_big"
                      :key="item.big_id"
                      :label="item.big_name"
                      :value="item.big_id">
                    </el-option>
                </el-select>
              </td>
              <!-- <td>{{ detail.category ? detail.category.category_name : '' }}</td> -->
            </tr>
            <tr>
              <th>中分類*</th>
              <!-- <td>{{ detail.sub_category ? detail.sub_category.sub_category_name : '' }}</td> -->
              <td class="select-td">
                <el-select v-model="detail.bmcategoryTable_middle.middle_id" size="small" :multiple="false" placeholder="中分類名" clearable style="width: 100%" class="filter-item">
                    <el-option
                      v-for="item in detail.bmcategoryTable_middle"
                      :key="item.middle_id"
                      :label="item.middle_name"
                      :value="item.middle_id">
                    </el-option>
                </el-select>
              </td>
            </tr>
          </tbody>
        </table>
        <table class="detail-table">
          <tbody>
            <tr>
              <th>依頼区分*</th>
              <td>{{ detail.order_type.type }}</td>
            </tr>
          </tbody>
        </table>
      </el-col>
      <el-col :span="14">
        <table class="detail-table">
          <tbody>
            <tr>
              <th>取引先コード</th>
              <td>1111</td>
              <td style="border: none; padding: 0 5px; text-align: right">
                <el-button
                  type="info"
                  size="mini"
                  width="120px"
                  @click="createMailVisible = true"
                >取引先メール</el-button>
              </td>
            </tr>
          </tbody>
        </table>
        <table class="detail-table">
          <tbody>
            <tr>
              <th>取引先名</th>
              <td colspan="2">abc</td>
            </tr>
            <tr>
              <th>TEL/FAX</th>
              <td>0533-66-6277</td>
              <td>0533-66-6277</td>
            </tr>
          </tbody>
        </table>
      </el-col>
    </el-row>
    <table class="detail-table">
      <tbody>
        <tr>
          <th>依頼内容*</th>
          <td>{{ detail.order }}</td>
          <td rowspan="2" style="padding: 0">
            <p class="header-1" style="margin-top: 0; padding: 10px">
              添付ファイル
            </p>
            <div
              style="
                text-align: center;
                padding: 5px;
                max-height: 300px;
                overflow-x: hidden;
                overflow-y: auto;
              "
            >
              <el-image
                style="width: 100px; height: 100px; display: block; padding: 10px "
                src="https://picsum.photos/id/0/300/200"
                :preview-src-list="fileList"
              />
              <a href="#" style="margin-bottom: 10px; display: block">全体写真</a>
              <el-image
                style="width: 100px; height: 100px; display: block;  padding: 10px"
                src="https://picsum.photos/id/1/300/200"
                :preview-src-list="fileList"
              />
              <a href="#" style="margin-bottom: 10px; display: block; ">細部写真</a>
              <el-image
                style="width: 100px; height: 100px; display: block;  padding: 10px"
                src="https://picsum.photos/id/2/300/200"
                :preview-src-list="fileList"
              />
              <a href="#" style="margin-bottom: 10px; display: block">型番写真</a>
            </div>
          </td>
        </tr>
        <tr>
          <th>備考</th>
          <td>{{ detail.remark }}</td>
        </tr>
      </tbody>
    </table>
    <table class="detail-table">
      <tbody>
        <tr>
          <th rowspan="5">案件情報</th>
          <th>{{ detail.maintenance_matters[0].matter_option ? detail.maintenance_matters[0].matter_option.name : '' }}</th>
          <td style="min-width:100px;">{{ detail.maintenance_matters[0].matter_value ? detail.maintenance_matters[0].matter_value.name : '' }}</td>
          <th>{{ detail.maintenance_matters[5].matter_option ? detail.maintenance_matters[5].matter_option.name : '' }}</th>
          <td style="min-width:100px;">{{ detail.maintenance_matters[5].matter_value ? detail.maintenance_matters[5].matter_value.name : '' }}</td>
        </tr>
        <tr>
          <th>{{ detail.maintenance_matters[1].matter_option ? detail.maintenance_matters[1].matter_option.name : '' }}</th>
          <td>{{ detail.maintenance_matters[1].matter_value ? detail.maintenance_matters[1].matter_value.name : '' }}</td>
          <th>{{ detail.maintenance_matters[6].matter_option ? detail.maintenance_matters[6].matter_option.name : '' }}</th>
          <td>{{ detail.maintenance_matters[6].matter_value ? detail.maintenance_matters[6].matter_value.name : '' }}</td>
        </tr>
        <tr>
          <th>{{ detail.maintenance_matters[2].matter_option ? detail.maintenance_matters[2].matter_option.name : '' }}</th>
          <td>{{ detail.maintenance_matters[2].matter_value ? detail.maintenance_matters[2].matter_value.name : '' }}</td>
          <th>{{ detail.maintenance_matters[7].matter_option ? detail.maintenance_matters[7].matter_option.name : '' }}</th>
          <td>{{ detail.maintenance_matters[7].matter_value ? detail.maintenance_matters[7].matter_value.name : '' }}</td>
        </tr>
        <tr>
          <th>{{ detail.maintenance_matters[3].matter_option ? detail.maintenance_matters[3].matter_option.name : '' }}</th>
          <td>{{ detail.maintenance_matters[3].matter_value ? detail.maintenance_matters[3].matter_value.name : '' }}</td>
          <th>{{ detail.maintenance_matters[8].matter_option ? detail.maintenance_matters[8].matter_option.name : '' }}</th>
          <td>{{ detail.maintenance_matters[8].matter_value ? detail.maintenance_matters[8].matter_value.name : '' }}</td>
        </tr>
        <tr>
          <th>{{ detail.maintenance_matters[4].matter_option ? detail.maintenance_matters[4].matter_option.name : '' }}</th>
          <td>{{ detail.maintenance_matters[4].matter_value ? detail.maintenance_matters[4].matter_value.name : '' }}</td>
          <th>{{ detail.maintenance_matters[9].matter_option ? detail.maintenance_matters[9].matter_option.name : '' }}</th>
          <td>{{ detail.maintenance_matters[9].matter_value ? detail.maintenance_matters[9].matter_value.name : '' }}</td>
        </tr>
      </tbody>
    </table>
    <el-dialog
      title="【取引先メール作成】"
      :visible.sync="createMailVisible"
      width="700px"
    >
      <create-client-mail />
      <span slot="footer" class="dialog-footer">
        <span>宛先とCC宛先、それぞれ選択してください。</span>
        <a target="_blank" href="mailto:name@email.com?cc=name1@email.com;name2@mail.com">Link text</a>
        <el-button type="primary" @click="createMailVisible = false">メーラー起動</el-button>
        <el-button @click="createMailVisible = false">閉じる</el-button>
      </span>
    </el-dialog>
    <el-dialog title="" :visible.sync="baseInfoVisible" width="700px" top="0px">
      <base-info />
    </el-dialog>

    <el-dialog
      title="依頼情報 編集"
      :visible.sync="editVisible"
      width="60%"
      custom-class="slide-dialog"
      top="0px"
      :modal="false"
    >
      <request-info-edit ref="editForm" :detail="detail" />
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="save()">登録</el-button>
        <el-button @click="editVisible = false">閉じる</el-button>
      </span>
    </el-dialog>
  </el-card>
</template>

<script>
import CreateClientMail from './sub/CreateClientMail.vue';
import BaseInfo from './BaseInfo.vue';
import RequestInfoEdit from './sub/RequestInfoEdit.vue';

export default {
  components: { CreateClientMail, BaseInfo, RequestInfoEdit },
  props: {
  
    detail: {
      type: Object,
      default: () => {
        return {
          
        };
      },
      
    },
  },
  data() {
    return {
      
     
      createMailVisible: false,
      baseInfoVisible: false,
      editVisible: false,
      fileList: [
        'https://picsum.photos/id/0/300/200',
        'https://picsum.photos/id/1/300/200',
        'https://picsum.photos/id/2/300/200',
      ],
      
      tableData: [
        { title: '特記①', value: '20’10/13〜10/25改装 浄化槽店舗' },
        {
          title: '特記②',
          value: '20’5/21エアコン全台清掃 駐車場案件は大和ハウス様へ',
        },
      ],
    };
  },
  mounted() {
    const dialogs = document.querySelectorAll('.slide-dialog');
    dialogs.forEach((el) => {
      el.closest('.el-dialog__wrapper').classList.add('slide-dialog-wrapper');
    });
  },
  created() {
  },
  methods: {
    async save(){
      this.editVisible = false;
      await this.$refs.editForm.save();
      this.$emit('get-detail');
    },
  },
};
</script>

<style lang="scss" scoped>
</style>
