<?php

namespace App\Http\Controllers\V2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;

use App\Block;
use App\Block_manager;
use App\Business_category;
use App\Maintenance;
use App\Maintenance_matter;
use App\Maintenance_progress;
use App\Role;
use App\Shop;

use DB;

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

    public function classHistory(Request $request)
    {
        $request->input('action');

        $limit = $request->input('limit', 15);
        $page = $request->input('page', 1);
        $offset = $limit * ($page - 1);

        $qb = Maintenance::with(['shop.business_category', 'orderType', 'progress', 'user'])->whereNotNull('shop_id')->where('sub_category_id', $request->input('sub_category_id'));

        $total = $qb->count();

        $qb->offset($offset)->limit($limit);

        $maintenances = $qb->orderBy('maintenance_id', 'desc')->take($limit)->get();
        return response(['data' => $maintenances, 'meta' => ['total' => $total]]);
    }

    public function shopHistory(Request $request)
    {
        $request->input('action');

        $limit = $request->input('limit', 15);
        $page = $request->input('page', 1);
        $offset = $limit * ($page - 1);

        $qb = Maintenance::with(['shop.business_category', 'orderType', 'progress', 'user'])->whereNotNull('shop_id')->where('shop_id', $request->input('shop_id'));

        $total = $qb->count();

        $qb->offset($offset)->limit($limit);

        $maintenances = $qb->orderBy('maintenance_id', 'desc')->take($limit)->get();
        return response(['data' => $maintenances, 'meta' => ['total' => $total]]);
    }

    public function createProgress(Request $request, $maintenance_id)
    {
        $row = new Maintenance_progress();
        $row->maintenance_id = $maintenance_id; 
        $row->progress_id = $request->input('progress_id'); 
        $row->comment = $request->input('comment'); 
        $row->faxed_to_client = $request->input('faxed_to_client'); 
        $row->faxed_to_shop = $request->input('faxed_to_shop'); 
        $row->entered_by = $request->user()->user_id;
        $row->save();
        
        $maintenance_progress = Maintenance_progress::with('entered_by')->where('maintenance_id', $maintenance_id)->get();
        return response($maintenance_progress);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function confirm(Request $request)
    {
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
            'category', 'subCategory',
            'maintenanceMatters.matter_value',
            'maintenanceMatters.matter_option',
        ])->find($maintenance_id);
        return response($maintenance);
    }

    public function update(Request $request, $maintenance_id)
    {
        // $order                 = $equipment . ' ' . $manufacturer . ':' . $model_number . ' ' . $when . ' ' . $situation . '手配お願いします。';

        $maintenance = Maintenance::find($maintenance_id);
        $maintenance->is_disaster     = $request->input('is_disaster');
        $maintenance->is_emergency    = $request->input('is_emergency');
        $maintenance->category_id     = $request->input('category_id');
        $maintenance->sub_category_id = $request->input('sub_category_id');
        $maintenance->order_type_id   = $request->input('order_type_id');
        $maintenance->remark          = $request->input('remark');
        $maintenance->save();

        $maintenance_matters = $request->input('maintenance_matters', []);
        foreach ($maintenance_matters as $item) {
            $maintenance_matter = null;
            if (empty($item['maintenance_matter_id'])) {
                if (empty($item['matter_option_id']) || empty($item['matter_value_id'])) {
                    continue;
                }
                $maintenance_matter = new Maintenance_matter();
            } else {
                $maintenance_matter = Maintenance_matter::find($item['maintenance_matter_id']);
                if (empty($item['matter_option_id']) || empty($item['matter_value_id'])) {
                    $maintenance_matter->delete();
                    continue;
                }
            }
            $maintenance_matter->maintenance_id  = $maintenance_id;
            $maintenance_matter->matter_option_id  = $item['matter_option_id'];
            $maintenance_matter->matter_value_id  = $item['matter_value_id'];
            $maintenance_matter->save();
        }

        return response([
            'success' => true
        ]);
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
