@extends('admin.layout')
@section('title', 'CSVインポート')

@section('content')

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
		<button>dddddddddddd</button>
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

<!--
<div class="row">
	<form action="" method="post">
		<button>エクスポート</button>
	</form>
</div>
-->

@endsection
