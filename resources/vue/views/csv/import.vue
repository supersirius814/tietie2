<template>
  <div class="app-container documentation-container">
    <h1>CSVインポート</h1>
    <el-row>
      <el-tabs  type="border-card" @tab-click="handleClick">
        <el-tab-pane label="メンテナンス">
            <el-row>
              <input type="file" name="csv">
            </el-row>
            <el-row>
              <el-button type="primary">インポート</el-button>
            </el-row>
        </el-tab-pane>
        <el-tab-pane label="従業員">
            <el-row>
              <input type="file" name="csv">
            </el-row>
            <el-row>
              <el-button type="primary">インポート</el-button>
            </el-row>
        </el-tab-pane>
        <el-tab-pane label="店舗">
            <el-row>
              <input type="file" name="csv">
            </el-row>
            <el-row>
              <el-button type="primary">インポート</el-button>
            </el-row>
        </el-tab-pane>
        <el-tab-pane label="お取引先様">
            <el-row>
              <input type="file" name="csv">
            </el-row>
            <el-row>
              <el-button type="primary">インポート</el-button>
            </el-row>
        </el-tab-pane>
      </el-tabs>
    </el-row>

    <el-row>

    </el-row>

<div class="row mb-5">
	<div class="col-12">
		<div class="card card-primary card-outline card-outline-tabs">
			<div class="card-header p-0 border-bottom-0">
				<ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="custom-tabs-four-maintenance-tab" data-toggle="pill" href="#custom-tabs-four-maintenance" role="tab" aria-controls="custom-tabs-four-maintenance" aria-selected="true">メンテナンス</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="custom-tabs-four-staff-tab" data-toggle="pill" href="#custom-tabs-four-staff" role="tab" aria-controls="custom-tabs-four-staff" aria-selected="true">従業員</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="custom-tabs-four-shop-tab" data-toggle="pill" href="#custom-tabs-four-shop" role="tab" aria-controls="custom-tabs-four-shop" aria-selected="false">店舗</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="custom-tabs-four-client-tab" data-toggle="pill" href="#custom-tabs-four-client" role="tab" aria-controls="custom-tabs-four-client" aria-selected="false">お取引先様</a>
					</li>
				</ul>
			</div>

			<div class="card-body">
				<div class="tab-content" id="custom-tabs-four-tabContent">
					<div class="tab-pane fade active show" id="custom-tabs-four-maintenance" role="tabpanel" aria-labelledby="custom-tabs-four-maintenance-tab">
						<form action="" method="post">
							<div class="mb-2"><input type="file" name="csv"></div>
							<button>インポート</button>
						</form>
					</div>
					<div class="tab-pane fade" id="custom-tabs-four-staff" role="tabpanel" aria-labelledby="custom-tabs-four-staff-tab">
						<form action="" method="post">
							<div class="mb-2"><input type="file" name="csv"></div>
							<button>インポート</button>
						</form>
					</div>
					<div class="tab-pane fade" id="custom-tabs-four-shop" role="tabpanel" aria-labelledby="custom-tabs-four-shop-tab">
						<form action="" method="post">
							<div class="mb-2"><input type="file" name="csv"></div>
							<button>インポート</button>
						</form>
					</div>
					<div class="tab-pane fade" id="custom-tabs-four-client" role="tabpanel" aria-labelledby="custom-tabs-four-client-tab">
						<form action="" method="post">
							<div class="mb-2"><input type="file" name="csv"></div>
							<button>インポート</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row mb-5">
	<form action="" method="post">
		<legend>従業員</legend>
		<input type="file" name="csv">
		<button>インポート</button>
	</form>
</div>

<div class="row mb-5">
	<form action="" method="post">
		<legend>店舗</legend>
		<input type="file" name="csv">
		<button>インポート</button>
	</form>
</div>

<div class="row mb-5">
	<form action="" method="post">
		<legend>お取引先様</legend>
		<input type="file" name="csv">
		<button>インポート</button>
	</form>
</div>

  </div>
</template>
<script>

export default {
  name: 'importCsv',
  data() {
    return {
      articleList: [
        { title: 'Laravel Envoy', href: 'https://laravel.com/docs/5.8/envoy' },
        { title: 'Vuex', href: 'https://vuex.vuejs.org/' },
        { title: 'Vue Router', href: 'https://router.vuejs.org/' },
        { title: 'laravue-core', href: 'https://github.com/tuandm/laravue-core' },
        { title: 'vue-admin-template', href: 'https://github.com/PanJiaChen/vue-admin-template' },
        { title: 'Axios', href: 'https://github.com/axios/axios' },
      ],
    };
  },
};
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.documentation-container {
//   margin: 50px;
  .document-btn {
    float: left;
    margin-left: 50px;
    display: block;
    cursor: pointer;
    background: black;
    color: white;
    height: 60px;
    width: 200px;
    line-height: 60px;
    font-size: 20px;
    text-align: center;
  }
}
</style>
