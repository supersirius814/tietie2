<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Http\Request;
use App\Block;
use App\Block_manager;
use App\Business_category;
use App\Category;
use App\Equipment;
use App\Maintenance;
use App\Maintenance_image;
use App\Maintenance_order_reason;
use App\Order_type;
use App\Order_reason;
use App\Progress;
use App\Role;
use App\Sub_category;
use App\Shop;

Auth::routes();

Route::get('/', function () {
    return redirect('login');
});

Route::post('login', 'Auth\LoginController@authenticate');

Route::get('home', 'HomeController@index')->name('home');

Route::get('maintenance', function(Request $request) {

	$business_category_id = Auth::user()->business_category_id;
	$role                 = Role::find( Auth::user()->role_id )->role_name;

	if ( '管理者' === $role ) {
		return view('admin.maintenance.index', [
			'business_categories' => Business_category::all(),
			'shop_id'             => 'null',
			'shops'               => Shop::all(),
		]);
	}

	if ( 'BM' === $role ) {
		$block_id = Block_manager::where('user_id', Auth::user()->user_id)->first()->block_id;
		return view('maintenance.index_bm', [
			'business_category' => Business_category::find($business_category_id),
            'block_name'        => Block::where('block_id', $block_id)->first()->block_name,
			'shops'             => Shop::where('block_id', $block_id)->get(),
			'role'              => $role,
			'all_progress'      => Progress::all(),
		]);
	}

	$shop_id = Auth::user()->shop_id;
	return view('maintenance.index', [
		'business_category' => Business_category::find($business_category_id),
		'shop'              => Shop::find($shop_id),
		'role'              => $role,
//			'approved_count' => Maintenance::where('shop_id', $shop_id)->where('is_approved', 1)->count(),
//			'unapproved_count' => Maintenance::where('shop_id', $shop_id)->where('is_approved', 0)->where('is_sendbacked', 0)->count(),
//			'sendbacked_count' => Maintenance::where('shop_id', $shop_id)->where('is_sendbacked', 1)->count(),
	]);

})->middleware('auth');

Route::get('maintenance/error', 'MaintenanceController@error')->middleware('auth');

Route::get('maintenance/image/{maintenance_id}/{file_name}', 'ImageController@getImage')->middleware('auth');
Route::get('maintenance/quotationfile/{file_name}', 'FileViewController@getQuotationFile')->middleware('auth');//quotation pdf, report pdf, photo image view
Route::get('maintenance/reportfile/{file_name}', 'FileViewController@getReportFile')->middleware('auth');
Route::get('maintenance/photofile/{file_name}', 'FileViewController@getPhotoFile')->middleware('auth');


Route::get('maintenance/add/confirm', function(Request $request) {
    $request->session()->reflash();
	$role                 = Role::find( Auth::user()->role_id )->role_name;
    if ( 'BM' === $role ) {
	   $shop = Shop::find($request->session()->get('form.shop_id'));
    } else {
	   $shop = Shop::find(Auth::user()->shop_id);
    }
	$business_category_id = Auth::user()->business_category_id;
    $block_name           = $shop->block->block_name;
	$form                 = $request->session()->get('form');
	$images               = $request->session()->get('images');

    $reasons = [];
    $order_reason_ids = '';
    if ($form['order_reason_ids']) {
        foreach ($form['order_reason_ids'] as $order_reason_id) {
            $reasons[] = Order_reason::find($order_reason_id)->reason;
        }
        $order_reason_ids = implode(',', $form['order_reason_ids']);
    }

	return view('maintenance.confirm', [
		'business_category' => Business_category::find($business_category_id),
        'block_name'        => $block_name,
		'shop'              => $shop,
		'role'              => $role,
		'form'              => $form,
		'images'            => $images,
        'reasons'           => $reasons,
        'order_reason_ids'  => $order_reason_ids,
	]);
})->middleware('auth');

Route::post('maintenance/add/confirm', 'MaintenanceController@confirm')->middleware('auth');

Route::get('maintenance/add', function(Request $request) {
	$business_category_id = Auth::user()->business_category_id;
	$shop_id              = Auth::user()->shop_id;
	$role                 = Role::find( Auth::user()->role_id )->role_name;
    $order_reasons        = Order_reason::all();

    if ( 'BM' === $role ) {
		$block_id = Block_manager::where('user_id', Auth::user()->user_id)->first()->block_id;
		return view('maintenance.add', [
			'business_category' => Business_category::find($business_category_id),
            'block_name'        => Block::where('block_id', $block_id)->first()->block_name,
			'shops'             => Shop::where('block_id', $block_id)->get(),
			'role'              => $role,
            'order_reasons'     => $order_reasons,
		]);
	}

	return view('maintenance.add', [
		'business_category' => Business_category::find($business_category_id),
		'shop'              => Shop::find($shop_id),
		'role'              => $role,
        'order_reasons'     => $order_reasons,
	]);
})->middleware('auth');

Route::get('maintenance/add/completed', function() {
	$business_category_id = Auth::user()->business_category_id;
	$shop_id              = Auth::user()->shop_id;
	$role                 = Role::find( Auth::user()->role_id )->role_name;
    $block_name           = '';
    if ( 'BM' === $role ) {
        $block_id   = Block_manager::where('user_id', Auth::user()->user_id)->first()->block_id;
        $block_name = Block::find($block_id)->block_name;
    }
	return view('maintenance.completed', [
		'page_title'        => '新規メンテナンス申請',
		'text'              => '申請しました。',
		'business_category' => Business_category::find($business_category_id),
        'block_name'        => $block_name,
		'shop'              => Shop::find($shop_id),
		'role'              => $role,
	]);
})->middleware('auth');

Route::get('maintenance/{maintenance_id}/approve/completed', function($maintenance_id) {
	$business_category_id = Auth::user()->business_category_id;
	$shop_id              = Auth::user()->shop_id;
	$role                 = Role::find( Auth::user()->role_id )->role_name;
    $block_name           = '';
    if ( 'BM' === $role ) {
        $block_id   = Block_manager::where('user_id', Auth::user()->user_id)->first()->block_id;
        $block_name = Block::find($block_id)->block_name;
    }
	return view('maintenance.completed', [
		'page_title'        => 'メンテナンス申請 -承認-',
		'text'              => '承認しました。',
		'business_category' => Business_category::find($business_category_id),
        'block_name'        => $block_name,
		'shop'              => Shop::find($shop_id),
		'role'              => $role,
	]);
})->middleware('auth');

Route::get('maintenance/{maintenance_id}/sendback/completed', function($maintenance_id) {
	$business_category_id = Auth::user()->business_category_id;
	$shop_id              = Auth::user()->shop_id;
	$role                 = Role::find( Auth::user()->role_id )->role_name;
    $block_id             = Block_manager::where('user_id', Auth::user()->user_id)->first()->block_id;
    $block_name           = Block::find($block_id)->block_name;
	return view('maintenance.completed', [
		'page_title'        => 'メンテナンス申請 -差戻し-',
		'text'              => '差戻しました。',
		'business_category' => Business_category::find($business_category_id),
        'block_name'        => $block_name,
		'shop'              => Shop::find($shop_id),
		'role'              => $role,
	]);
})->middleware('auth');

Route::get('maintenance/{maintenance_id}/delete/completed', function($maintenance_id) {
	$business_category_id = Auth::user()->business_category_id;
	$shop_id              = Auth::user()->shop_id;
	$role                 = Role::find( Auth::user()->role_id )->role_name;
    $block_name           = '';
    if ( 'BM' === $role ) {
        $block_id   = Block_manager::where('user_id', Auth::user()->user_id)->first()->block_id;
        $block_name = Block::find($block_id)->block_name;
    }
	return view('maintenance.completed', [
		'page_title'        => 'メンテナンス申請 -取り下げ-',
		'text'              => '申請を取り下げました。',
		'business_category' => Business_category::find($business_category_id),
        'block_name'        => $block_name,
		'shop'              => Shop::find($shop_id),
		'role'              => $role,
	]);
})->middleware('auth');

Route::match(['get', 'post'],'maintenance/{maintenance_id}/edit', function($maintenance_id) {
	$role                 = Role::find( Auth::user()->role_id )->role_name;
	$shop_id              = Auth::user()->shop_id;
	$business_category_id = Auth::user()->business_category_id;
    $block_name           = '';
    if ( 'BM' === $role ) {
        $block_id   = Block_manager::where('user_id', Auth::user()->user_id)->first()->block_id;
        $block_name = Block::find($block_id)->block_name;
    }

    $order_reason_ids = [];
    $maintenance_order_reasons = Maintenance_order_reason::where('maintenance_id', $maintenance_id)->get();
    foreach ( $maintenance_order_reasons as $maintenance_order_reason ) {
        $order_reason_ids[] = $maintenance_order_reason->order_reason_id;
    }

    $order_reasons = Order_reason::all();

	return view('maintenance.edit', [
		'business_category' => Business_category::find($business_category_id),
        'block_name'        => $block_name,
		'maintenance_id'    => $maintenance_id,
		'maintenance'       => Maintenance::with(['shop.business_category', 'orderType', 'progress', 'user', 'maintenanceImages', 'orderReasons'])->find($maintenance_id),
		'shop'              => Shop::find($shop_id),
		'role'              => $role,
		'images'            => Maintenance_image::where('maintenance_id', $maintenance_id)->get(),
        'order_reason_ids'  => $order_reason_ids,
        'order_reasons'      => $order_reasons,
	]);
})->middleware('auth');

Route::get('maintenance/{maintenance_id}/edit/completed', function($maintenance_id) {
	$business_category_id = Auth::user()->business_category_id;
	$shop_id              = Auth::user()->shop_id;
	$role                 = Role::find( Auth::user()->role_id )->role_name;
    $block_name           = '';
    if ( 'BM' === $role ) {
        $block_id   = Block_manager::where('user_id', Auth::user()->user_id)->first()->block_id;
        $block_name = Block::find($block_id)->block_name;
    }
	return view('maintenance.completed', [
		'page_title'        => 'メンテナンス申請 -編集-',
		'text'              => '再申請しました。',
		'business_category' => Business_category::find($business_category_id),
        'block_name'        => $block_name,
		'shop'              => Shop::find($shop_id),
		'role'              => $role,
	]);
})->middleware('auth');

Route::get('maintenance/{maintenance_id}/reject/completed', function($maintenance_id) {
	$business_category_id = Auth::user()->business_category_id;
	$shop_id              = Auth::user()->shop_id;
	$role                 = Role::find( Auth::user()->role_id )->role_name;
    $block_name           = '';
    if ( 'BM' === $role ) {
        $block_id   = Block_manager::where('user_id', Auth::user()->user_id)->first()->block_id;
        $block_name = Block::find($block_id)->block_name;
    }
	return view('maintenance.completed', [
		'page_title'        => 'メンテナンス申請 -却下-',
		'text'              => '却下しました。',
		'business_category' => Business_category::find($business_category_id),
        'block_name'        => $block_name,
		'shop'              => Shop::find($shop_id),
		'role'              => $role,
	]);
})->middleware('auth');

Route::get('maintenance/{maintenance_id}/suspend/completed', function($maintenance_id) {
	$business_category_id = Auth::user()->business_category_id;
	$shop_id              = Auth::user()->shop_id;
	$role                 = Role::find( Auth::user()->role_id )->role_name;
    $block_name           = '';
    if ( 'BM' === $role ) {
        $block_id   = Block_manager::where('user_id', Auth::user()->user_id)->first()->block_id;
        $block_name = Block::find($block_id)->block_name;
    }
	return view('maintenance.completed', [
		'page_title'        => 'メンテナンス申請 -保留-',
		'text'              => '保留しました。',
		'business_category' => Business_category::find($business_category_id),
        'block_name'        => $block_name,
		'shop'              => Shop::find($shop_id),
		'role'              => $role,
	]);
})->middleware('auth');

Route::get('maintenance/{maintenance_id}', function($maintenance_id) {
	$role                 = Role::find( Auth::user()->role_id )->role_name;
	$shop_id              = Auth::user()->shop_id;
	$business_category_id = Auth::user()->business_category_id;
	$progress_id          = Maintenance::find($maintenance_id)->progress_id;
	$progress_status      = Progress::find($progress_id)->status;
    $block_name           = '';

	if ( '管理者' === $role ) {
		return view('admin.maintenance.detail', [
			'maintenance_id' => $maintenance_id
		]);
	}

    if ( 'BM' === $role ) {
		$block_id = Block_manager::where('user_id', Auth::user()->user_id)->first()->block_id;
		$block_name = Block::find($block_id)->block_name;
    }

	return view('maintenance.detail', [
		'business_category' => Business_category::find($business_category_id),
        'block_name'        => $block_name,
		'maintenance_id'    => $maintenance_id,
		'progress_status'   => $progress_status,
		'shop'              => Shop::find($shop_id),
		'role'              => $role,
	]);
})->middleware('auth');

Route::get('check-server-communication', function() {
    return 'Communication success';
})->middleware('auth');

Route::get('admin/dashboard', function() {
	return view('admin.dashboard.chartjs');
})->middleware('auth');

Route::get('admin', function() {
	return view('admin.index');
})->middleware('auth');

Route::get('admin/maintenance/{maintenance_id}', function() {
	return view('admin.maintenance.detail');
})->middleware('auth');

Route::get('admin/maintenance/{shop_code}/{maintenance_id}/put', function($shopCode, $maintenance_id) {
	return view('admin.maintenance.edit', ['shop_code' => $shopCode, 'maintenance_id' => $maintenance_id]);
})->middleware('auth');

Route::get('admin/user', function() {
	return view('admin.user.index');
})->middleware('auth');

Route::get('admin/user/{user_id}', function($userId) {
	return view('admin.user.detail', ['user_id' => $userId]);
})->middleware('auth');

Route::get('admin/workflow', function() {
	return view('admin.workflow.index');
})->middleware('auth');

Route::get('admin/shop', function() {
	return view('admin.shop.index');
})->middleware('auth');

Route::get('admin/shop/{shop_code}', function($shopCode) {
	return view('admin.shop.detail', ['shop_code' => $shopCode]);
})->middleware('auth');

Route::get('admin/block', function() {
	return view('admin.block.index');
})->middleware('auth');

Route::get('admin/district', function() {
	return view('admin.district.index');
})->middleware('auth');

Route::get('admin/client', function() {
	return view('admin.client.index');
})->middleware('auth');

Route::get('admin/csv/import', function() {
	return view('admin.csv.import');
})->middleware('auth');

Route::get('admin/csv/export', function() {
	return view('admin.csv.export');
})->middleware('auth');

Route::get('master_mainte', 'MasterdataController@index')->middleware('auth');
Route::get('master_mainte/{value}/update', 'MasterdataController@update')->middleware('auth');
Route::get('master_mainte/{value}/restore', 'MasterdataController@restore')->middleware('auth');

Route::get('master_mainte_export_csv', 'MasterExportCsvController@index')->middleware('auth');
Route::get('master_mainte_export_csv/{value}', 'MasterExportCsvController@exportCsv')->middleware('auth');

Route::get('vue', function() {
	return view('admin');
})->middleware('auth');
