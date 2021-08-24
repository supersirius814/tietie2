<?php

namespace App\Http\Controllers\V2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Http\File;
use Carbon\Carbon;
use Storage;

use App\Block;
use App\Block_manager;
use App\Business_category;
use App\Category;
use App\Client;
use App\Client_equipment;
use App\District_manager;
use App\Equipment;
use App\Final_status;
use App\Maintenance;
use App\Maintenance_image;
use App\Maintenance_order_reason;
use App\Maintenance_progress;
use App\Manufacturer;
use App\Order_type;
use App\Progress;
use App\Role;
use App\Shop;
use App\Sub_category;
use App\User;

use Illuminate\Support\Facades\Mail;
use App\Mail\MaintenanceRequestMail;
use App\Mail\MaintenanceEditMail;
use App\Mail\ApprovalMail;
use App\Mail\SendbackMail;
use App\Mail\SuspendMail;
use App\Mail\RejectMail;

use DB;
use Log;

class MaintenanceController extends Controller
{
    use AuthenticatesUsers;

    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $request->input('action');
        $business_category_id = $request->input('business_category_id', 0);
        $shop_id = $request->input('shop_id', 0);
        $progress_id = $request->input('progress_id', 0);

        $limit = $request->input('limit', 15);
        $page = $request->input('page', 1);
        $offset = $limit * ($page - 1);

        $qb = Maintenance::with(['shop.business_category', 'orderType', 'progress', 'user'])->whereNotNull('shop_id');

        if ($shop_id != 0) {
            $qb->where('shop_id', $shop_id);
        } else {
            if ($business_category_id != 0) {
                $qb = Maintenance::with(['shop.business_category', 'orderType', 'progress', 'user'])->join('shops', 'shops.shop_id', '=', 'maintenances.shop_id')->join('business_categories', 'business_categories.business_category_id', '=', 'shops.business_category_id')->where('shops.business_category_id', $business_category_id);
            }
        }

        if ($progress_id != 0) {
            $progress_id = explode(',', $progress_id);
            $qb->whereIn('progress_id', $progress_id);
        }

        $total = $qb->count();

        $qb->offset($offset)->limit($limit);

        $maintenances = $qb->orderBy('maintenance_id', 'desc')->take($limit)->get();
        return response(['data' => $maintenances, 'meta' => ['total' => $total]]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function confirm(Request $request)
    {
        //		$this->validate($request, [
        //			'shop_id'      => 'required',
        //			'equipment'    => 'required',
        //			'manufacturer' => 'required',
        //			'model_number' => 'required',
        //			'when'         => 'required',
        //			'situation'    => 'required',
        //			'image_1'      => 'required|file|image',
        //			'image_2'      => 'required|file|image',
        //			'image_3'      => 'required|file|image',
        //		]);
        //
        $form = $request->except('image_1', 'image_2', 'image_3');
        $request_all = $request->all();
        $request_keys = array_keys($request_all);
        $request_images = preg_grep('/^image/', $request_keys);
        $request_images_count = count($request_images);

        $images = [];
        for ($i = 1; $i <= $request_images_count; $i++) {
            $image_name = uniqid('tmp_') . "." . $request->file('image_' . $i)->guessExtension();
            $request->file('image_' . $i)->move(public_path('/img/tmp'), $image_name);
            $images[] = $image_name;
        }

        $order_type_id = $request->input('order_type_id');
        if ($order_type_id === '1') {
            $order_type = '修理をしてほしい';
        }
        if ($order_type_id === '2') {
            $order_type = '部品を送ってほしい';
        }
        if ($order_type_id === '3') {
            $order_type = '調査してほしい';
        }
        if ($order_type_id === '4') {
            $order_type = 'その他';
        }

        $request->session()->flash('form', [
            'business_category_id'  => $request->input('business_category_id'),
            'shop_id'               => $request->input('shop_id'),
            'applicant_id'          => $request->input('applicant_id'),
            'equipment'             => $request->input('equipment'),
            'manufacturer'          => $request->input('manufacturer'),
            'model_number'          => $request->input('model_number'),
            'when'                  => $request->input('when'),
            'situation'             => $request->input('situation'),
            'order_type_id'         => $request->input('order_type_id'),
            'order_type'            => $order_type,
            'order_reason_ids'      => $request->input('order_reason_ids'),
            'order_type_other_text' => $request->input('order_type_other_text'),
        ]);
        $request->session()->flash('images', $images);
        return response()->json([
            'url' => url('maintenance/add/confirm'),
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($maintenance_id)
    {
        $maintenance = Maintenance::with([
            'shop.business_category',
            'orderType', 'progress',
            'user',
            'maintenanceProgress.entered_by',
            'maintenanceImages',
            'orderReasons',
        ])->find($maintenance_id);
        return response($maintenance);
    }

    /**
     * Display the specified resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function error(Request $request)
    {
        $business_category_id = Auth::user()->business_category_id;
        $shop_id              = Auth::user()->shop_id;
        $role                 = Role::find(Auth::user()->role_id)->role_name;
        $block_name           = '';
        if ('BM' === $role) {
            $block_id   = Block_manager::where('user_id', Auth::user()->user_id)->first()->block_id;
            $block_name = Block::find($block_id)->block_name;
        }

        $errorText = 'エラーが発生しました。';
        if ($request->session()->get('errorText')) {
            $errorText = $request->session()->get('errorText');
        }

        return view('maintenance.error', [
            'page_title'        => '新規メンテナンス申請',
            'text'              => $errorText,
            'business_category' => Business_category::find($business_category_id),
            'block_name'        => $block_name,
            'shop'              => Shop::find($shop_id),
            'role'              => $role,
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($maintenance_id)
    {
        Maintenance::find($maintenance_id)->delete(); // 論理削除です
        return redirect('/maintenance/' . $maintenance_id . '/delete/completed');
    }


    public function changeProgress(Request $request, $maintenance_id)
    {
        $progress_id = $request->input('progress_id');
        $role = Role::find(Auth::user()->role_id)->role_name;
        if ($role === '管理者') {

            DB::beginTransaction();
            try {
                $maintenance = Maintenance::find($maintenance_id);
                $maintenance->progress_id = $progress_id;
                $maintenance->save();

                $maintenance_progress = new Maintenance_progress;
                $maintenance_progress->maintenance_id = $maintenance_id;
                $maintenance_progress->progress_id    = $progress_id;
                $maintenance_progress->comment        = '';
                $maintenance_progress->entered_by     = Auth::user()->user_id;
                $maintenance_progress->save();

                DB::commit();

                $request->session()->flash('flash_message', 'ID:' . $maintenance_id . 'のステータスを更新しました');
            } catch (\Exception $e) {

                DB::rollback();
                $request->session()->flash('flash_message', $e->getMessage());
                return redirect('maintenance');
            }

            return redirect('maintenance');
        }
    }
}
