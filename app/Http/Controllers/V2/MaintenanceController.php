<?php

namespace App\Http\Controllers\V2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\File;
use Storage;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;

use App\Block;
use App\Block_manager;
use App\Business_category;
use App\Maintenance;
use App\Maintenance_matter;
use App\Maintenance_progress;
use App\Quotation_info;
use App\Accounting_info;
use App\Accounting_subjects;
use App\Photo_file;
use App\Report_file;
use App\Quotation_file;
use App\Uploading_files;
use App\Bmcategory_table;
use App\Partner;
use App\General_manager;
use App\Department;
use App\District;
use App\District_manager;
use App\Order_reason;
use App\Role;
use App\Shop;
use App\User;
use App\Sub_category;
use App\Category;
use App\Maintenance_order_reason;
use DB;
use PDF;
use Mail;
use Log;
use Validator;

use Carbon\Carbon;

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
        $progress_ids = $request->input('progress_id');
        
        $flag = 0;
        $res = '';
        if (is_array($progress_ids)) {

            foreach ($progress_ids as $key => $value) {
                if ($flag > 0) {
                    $res .= ',' . $value;
                } else {
                    $res = $value;
                    $flag++;
                }
            }

        }

        $progress_id = $res;

        $limit = $request->input('limit', 15);
        $page = $request->input('page', 1);
        $offset = $limit * ($page - 1);

        $qb = Maintenance::with(['shop.business_category', 'shop.business_category_option', 'orderReasons', 'orderType', 'category', 'subCategory', 'progress', 'user'])->whereNotNull('shop_id');

        // $maintenance = Maintenance::with([
        //     'shop.business_category',
        //     'orderType', 'progress',
        //     'user',
        //     'maintenanceProgress.entered_by',
        //     'maintenanceImages',
        //     'orderReasons',
        //     'category', 'subCategory',
        //     'maintenanceMatters.matter_value',
        //     'maintenanceMatters.matter_option',
        //     'uploadingFiles',
        //     'quotationInfo', 'accountingInfo.accounting_info'
        // ])->find($maintenance_id);

        $keyword = $request->input('keyword');

        if ($keyword) {
            $qb->where('order', 'like', '%' . $keyword . '%');
        }

        $eventCheck = $request->input('eventCheck');
        // var_export($eventCheck); die;

        if($eventCheck == 'true') {
            $qb->whereDate('deadline_date', '<', Carbon::today())->where('progress_id', '!=', 21);
            // $qb->whereRaw("DATE_FORMAT(created_at,'%m/%d/%Y') > DATE_FORMAT(deadline_date,'%m/%d/%Y')");
        }

        $emergencyCheck = $request->input('emergencyCheck');
        if($emergencyCheck == 'true') {
            $qb->whereRaw("is_emergency > 0 and progress_id != 21");
        }


        $disasterCheck = $request->input('disasterCheck');
        if($disasterCheck == 'true') {
            $qb->whereRaw("is_disaster > 0 and progress_id != 21");
        }


        if ($shop_id != 0) {
            $qb->where('shop_id', $shop_id);
        } else {
            if ($business_category_id != 0) {
                $qb = Maintenance::with(['shop.business_category', 'orderType', 'shop.business_category_option', 'progress', 'user'])->join('shops', 'shops.shop_id', '=', 'maintenances.shop_id')->join('business_categories', 'business_categories.business_category_id', '=', 'shops.business_category_id')->where('shops.business_category_id', $business_category_id);
            }
        }

        if ($progress_id != 0) {
            $progress_id = explode(',', $progress_id);
            $qb->whereIn('progress_id', $progress_id);
        }

        $total = $qb->count();

        $qb->offset($offset)->limit($limit);

        //compeleted_date sort
        $bycomplete = $request->input('bycomplete');
        if($bycomplete == 1){
            $maintenances = $qb->orderBy(DB::raw('ISNULL(completed_date), completed_date'), 'ASC');
        } else if($bycomplete == 2){
            $maintenances = $qb->orderBy('completed_date', 'desc');
        } 

        //maintenance_code sort
        $bycode = $request->input('bycode');
        if($bycode == 1){
            $maintenances = $qb->orderBy('maintenance_code', 'asc');
        } else if($bycode == 2){
            $maintenances = $qb->orderBy('maintenance_code', 'desc');
        } 

        //deadline_date sort
        $bydeadline = $request->input('bydeadline');
        if($bydeadline == 1){
            $maintenances = $qb->orderBy(DB::raw('ISNULL(deadline_date), deadline_date'), 'asc');
        } else if($bydeadline == 2){
            $maintenances = $qb->orderBy('deadline_date', 'desc');
        } 

        //created_at sort
        $bycreate = $request->input('bycreate');
        if($bycreate == 1){
            $maintenances = $qb->orderBy('created_at', 'asc');
        } else if($bycreate == 2){
            $maintenances = $qb->orderBy('created_at', 'desc');
        } 
       
        $maintenances = $qb->orderBy('maintenance_id', 'desc')->take($limit)->get();
        return response(['data' => $maintenances,'meta' => ['total' => $total]]);
    }

    public function exportTables(Request $request){
        $progress_ids = $request->input('progress_id');
        $business_category_id = $request->input('business_category_id', 0);
        $shop_id = $request->input('shop_id', 0);
        $startdate = $request->startdate;
        $completedate = $request->completedate;
        
        $flag = 0;
        $res = '';
        if (is_array($progress_ids)) {

            foreach ($progress_ids as $key => $value) {
                if ($flag > 0) {
                    $res .= ',' . $value;
                } else {
                    $res = $value;
                    $flag++;
                }
            }

        }

        $progress_id = $res;

        $qb = Maintenance::with([
            'shop.business_category', 'orderReasons', 'orderType', 
            'category', 'subCategory', 'progress', 'user', 'quotationInfo', 
            'accountingInfo.accounting_info'
        ])->whereNotNull('shop_id');

        if ($shop_id != 0) {
            $qb->where('shop_id', $shop_id);
        } else {
            if ($business_category_id != 0) {
                $qb = Maintenance::with(['shop.business_category', 'orderType', 'progress', 'user'])->join('shops', 'shops.shop_id', '=', 'maintenances.shop_id')->join('business_categories', 'business_categories.business_category_id', '=', 'shops.business_category_id')->where('shops.business_category_id', $business_category_id);
            }
        }

        if($startdate && $completedate){
            $qb->whereBetween('created_at', [$startdate, $completedate]);
        }

        if ($progress_id != 0) {
            $progress_id = explode(',', $progress_id);
            $qb->whereIn('progress_id', $progress_id);
        }

        $statement = 'SELECT maintenance_id, maintenance_code, partners.partner_name, maintenances.partner_code FROM maintenances LEFT JOIN partners on maintenances.partner_code = partners.partner_code GROUP BY maintenance_id ORDER BY maintenance_id DESC';


        $partners = DB::select($statement);

        $limit = $request->input('limit', 15);
        $page = $request->input('page', 1);
        $offset = $limit * ($page - 1);

        $total = $qb->count();

        // $qb->offset($offset)->limit($limit);
        $tblsData = $qb->orderBy('maintenance_id', 'desc')->get();
        // $tblsData = $qb->orderBy('maintenance_id', 'desc')->take($limit)->get();

        return response(['data' => $tblsData, 'meta' => ['total' => $total], 'partners' => $partners]);
    }

    public function importTables(Request $request){
        $csv_data = $request->csvdata;
        $valid = $request->valid;
        $userId = $request->userId;
        // if(array_sum($valid) == 0) return response(0);
        // echo $userId; die;
        foreach ($csv_data as $key => $line) {
            // if(count($line) < 2) continue;
            // if($valid[$key] > 0) continue;
            // echo $line['取引先コード']."<br/>";
            $partners = DB::table('partners')->where('partner_code', $line['取引先コード'])->first();
            $pname = $partners->partner_name;
            $pid = $partners->partner_id;
            $tax = $line['請求金額（税込）'] - $line['請求金額（税抜）'];
            $maintenances = DB::table('maintenances')->where('maintenance_code', $line['メンテナンスNO'])->first()->completed_date;
            $cmp_check = $maintenances->completed_date;
            $maintenance_id = $maintenances->maintenance_id;
            $shop_id = DB::table('shops')->where('shop_code', $line['店舗コード'])->first()->shop_id;

            //maintenances table update

            if(!$cmp_check){
                $comment = $line['完了日']." 請求情報取り込みにより登録";
                $progress_id = 21;
                $completed_date = $line['完了日'];

                //maintenace_progress table insert
                $row_mprogress = new Maintenance_progress();
                $row_mprogress->maintenance_id = $maintenance_id;
                $row_mprogress->progress_id = $progress_id;
                $row_mprogress->comment = $comment;
                $row_mprogress->save();
                

                $row_main = new Maintenance();
                $row_main->maintenance_id = $maintenance_id;
                $row_main->maintenance_code = $line['メンテナンスNO'];
                $row_main->shop_id = $shop_id;
                $row_main->partner_code = $line['取引先コード'];
                $row_main->progress_id = $progress_id;
                $row_main->comment = $comment;  
                $row_main->completed_date = $completed_date;
                $row_main->save();
            } else{
                $row_main = new Maintenance();
                $row_main->maintenance_id = $maintenance_id;
                $row_main->maintenance_code = $line['メンテナンスNO'];
                $row_main->shop_id = $shop_id;
                $row_main->partner_code = $line['取引先コード'];
                $row_main->save();
            }
            
            

            //accounting_info table insert
            $row_accinfo = new Accounting_info();
            $row_accinfo->maintenance_id = $line['メンテナンスNO'];
            $row_accinfo->partner_id = $pid;
            $row_accinfo->partner_name = $pname;
            $row_accinfo->tax = $tax;
            $row_accinfo->unincluding_price = $line['請求金額（税抜）'];
            $row_accinfo->including_price = $line['請求金額（税込）'];
            $row_accinfo->modified_by = $userId;
            $row_accinfo->accounting_year = $line['会計年月'];
            $row_accinfo->save();
        }

        return response(1);
    }

    public function eventCheckCountfunc(){
        $eventCheckCnt = Maintenance::whereRaw("DATE_FORMAT(CURDATE(),'%m/%d/%Y') > DATE_FORMAT(deadline_date,'%m/%d/%Y') and progress_id != 21")->count();
        $emergencyCnt = Maintenance::whereRaw("is_emergency > 0 and progress_id != 21")->count();
        $disasterCnt = Maintenance::whereRaw("is_disaster > 0 and progress_id != 21")->count();
        return response()->json(['eventCheckCnt' => $eventCheckCnt, 'emergencyCnt' => $emergencyCnt, 'disasterCnt' => $disasterCnt]); 
    }

    public function getParents(Request $request){
        $partner_code = $request->partner_code;//partner_code to parent_id
        $data = DB::table('partners')->select('partner_code', 'partner_id', 'partner_name')->where('parent_id', $partner_code)->get();
        return response($data);
    }

    
    public function getPartners_staff(Request $request){
        $partner_id = $request->partner_id;//partner_code to parent_id
        $data = DB::table('partners_staff')->where('partner_id', $partner_id);
        $name_arr = $data->pluck('name');
        $email_arr = $data->pluck('email');

        foreach($name_arr as $key => $val){
            $rlt[$key]['name'] = $name_arr[$key];
            $rlt[$key]['email'] = $email_arr[$key];
            $rlt[$key]['to'] = false;
            $rlt[$key]['cc'] = false;
        }
        return response($rlt);
    }

    public function chkMaintenanceId(){
        $result = Maintenance::join('shops', 'shops.shop_id', '=', 'maintenances.shop_id')->wherenotNull('maintenance_code');
        $id = $result->pluck('maintenance_id');
        $code = $result->pluck('maintenance_code');
        $shop_code = $result->pluck('shop_code');
        foreach ($code as $key => $value) {
            $rlt_code[$value] = $id[$key];
            $rlt_shop[$value] = $shop_code[$key];
        }
        return response()->json(['code' => $rlt_code, 'shop' => $rlt_shop]);
    }

    public function chkShopCode(){
        $result = Shop::groupBy('shop_code');
        $id = $result->pluck('shop_id');
        $code = $result->pluck('shop_code');
        foreach ($code as $key => $value) {
            $rlt[$value] = $id[$key];
        }
        return response($rlt);
    }

    public function chkpartner(){
        $result = Partner::groupBy('partner_code');
        $id = $result->pluck('partner_id');
        $code = $result->pluck('partner_code');
        foreach ($code as $key => $value) {
            $rlt[$value] = $id[$key];
        }
        return response($rlt);
    }

    public function csvExport($tableName){
        echo $tableName;
    }

    public function classHistory(Request $request)
    {
        if ($request->input('sub_category_id') == NULL) return array();
        $request->input('action');

        $limit = $request->input('limit', 15);
        $page = $request->input('page', 1);
        $offset = $limit * ($page - 1);

        $business_category_id = Shop::where('shop_id', $request->input('shop_id'))->first()->business_category_id;
        // var_export($business_category_id); die;

        $qb = Maintenance::with(['accountingInfo', 'shop',  'orderType', 'progress', 'user'])
                    ->whereNotNull('shop_id')
                    ->where('shop_id', $request->input('shop_id'))
                    // ->where('business_category_id', $business_category_id)
                    ->where('sub_category_id', $request->input('sub_category_id'));
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

        $qb = Maintenance::with(['shop.business_category', 'accountingInfo', 'orderType', 'progress', 'user'])
        ->whereNotNull('shop_id')->where('shop_id', $request->input('shop_id'));

        $total = $qb->count();

        $qb->offset($offset)->limit($limit);

        $maintenances = $qb->orderBy('maintenance_id', 'desc')->take($limit)->get();
        return response(['data' => $maintenances, 'meta' => ['total' => $total]]);
    }


    public function customsList(Request $request) {
        $customerNC = Partner::select('partner_name', 'partner_code')
                        ->groupBy('partner_code')
                        ->get();
        
        foreach ($customerNC as $key => $value) {
            $result[$value['partner_code']] = $value['partner_name'];
        }
        return response($result);
    }
    
    public function createProgress(Request $request, $maintenance_id)
    {

        // view()->share('employee',$data);
        
        // $pdf = PDF::loadView('pdf_view', $data);
        // return $pdf->download('pdf_file.pdf');
        // echo "alll================"."<br/>";
        // var_export($fax_data);
        $maintenance_data = Maintenance::with([
            'shop.business_category',
            'shop.business_category_option',
            'shop.users',
            'orderType', 'progress',
            'user',
            'maintenanceProgress.entered_by',
            'maintenanceImages',
            'orderReasons',
            'category', 'subCategory',
            'maintenanceMatters.matter_value',
            'maintenanceMatters.matter_option',
            'uploadingFiles',
            'quotationInfo', 'accountingInfo.accounting_info'
        ])->find($maintenance_id);

        $qb_maintenanceTopartners =  DB::select("SELECT partner_id, partner_no, partner_name, TEL, FAX FROM `maintenances` LEFT JOIN partners ON maintenances.partner_code=partners.partner_code WHERE maintenance_id= ?", [$maintenance_id]);

        $maintenance_data['partner_id'] = $qb_maintenanceTopartners['0']->partner_id;
        // $maintenance_data['partner_no'] = $qb_maintenanceTopartners['0']->partner_no;
        $maintenance_data['partner_name'] = $qb_maintenanceTopartners['0']->partner_name;
        $maintenance_data['TEL'] = $qb_maintenanceTopartners['0']->TEL;
        $maintenance_data['FAX'] = $qb_maintenanceTopartners['0']->FAX;

        $partner_staff = DB::table('partners_staff')->where('partner_id', $maintenance_data['partner_id'])->first();

        if(!empty($partner_staff)) {
            $maintenance_data['partner_email'] = $partner_staff->email;
        } else {
            $maintenance_data['partner_email'] = '';
        }

        $order_reason = Order_reason::select('order_reason_id', 'reason')
            ->distinct()
            ->where('order_reason_id', $maintenance_data['order_reason_id'])
            ->get();

        if ($order_reason->isEmpty()) {
            $order_reason[0] = array(
                'order_reason_id' => '',
                'reason' => '',
            );
        }

        $maintenance_data['order_reason'] = $order_reason;

        // before inputing comment
        // $maintenance_data['visit_data'] = $request->input('comment');
        $visit_data = $request->input('visit_time').' '.$request->input('visit_comment');
        $maintenance_data['visit_data'] = $visit_data;
        

        
        // return view('pdf_one', $maintenance_data);

        $mytime = Carbon::now();

        if($request->input('progress_id') == 10){
            if($request->input('faxed_to_client') > 0){
                $fax_count = DB::table('uploading_files')->where('kind', 'fax')->count();

                $pdf_count = $fax_count + 1;

                $flag = sprintf('%03d', $pdf_count);

                $file_name = $maintenance_data['FAX'].'-'.$maintenance_data['partner_code'].'-'.$maintenance_data['partner_name'].'-'.$flag.'.pdf';
                
                $pdf = PDF::loadView('pdf_one', $maintenance_data)
                // $pdf = PDF::loadView('pdf_two', $maintenance_data)
                // $pdf = PDF::loadView('pdf_three', $maintenance_data)
                ->setPaper('a4')
                ->setWarnings(false)
                ->setOptions(['isFontSubsettingEnabled' => true]);
                Storage::put('public/pdf/'.$file_name, $pdf->output());

                // Uploading_files table save  file history
                $upload = new Uploading_files();
                $upload->maintenance_id = $maintenance_id;
                $upload->kind = 'fax';
                $upload->file_name = $file_name;
                $upload->save();


            }

            if($request->input('faxed_to_shop') > 0){

                $fax_count = DB::table('uploading_files')->where('kind', 'fax')->count();

                $pdf_count = $fax_count + 1;

                $flag = sprintf('%03d', $pdf_count);
                $file_name = $maintenance_data['FAX'].'-'.$maintenance_data['shop']['shop_id'].'-'.$maintenance_data['shop']['shop_name'].'-'.$flag.'.pdf';

                $pdf = PDF::loadView('pdf_two', $maintenance_data)
                ->setPaper('a4')
                ->setWarnings(false)
                ->setOptions(['isFontSubsettingEnabled' => true]);
                Storage::put('public/pdf/'.$file_name, $pdf->output());


                // Uploading_files table save  file history
                $upload = new Uploading_files();
                $upload->maintenance_id = $maintenance_id;
                $upload->kind = 'fax';
                $upload->file_name = $file_name;
                $upload->save();

            }

            if($request->input('mail_to_client') > 0){
                $mail_data["email"] = $maintenance_data['partner_email'];
                $mail_data["title"] = "From ".$maintenance_data['user']['email'];
                $mail_data["body"] = $maintenance_data['partner_code'].'-'.$maintenance_data['partner_name'];


                // $file_name = $maintenance_data['partner_code'].'-'.$maintenance_data['partner_name'].'-'.$mytime->format('YmdHis').'.pdf';
                
                $pdf = PDF::loadView('pdf_one', $maintenance_data)
                ->setPaper('a4')
                ->setWarnings(false)
                ->setOptions(['isFontSubsettingEnabled' => true]);

                if($maintenance_data['partner_email'] && $maintenance_data['user']['email']){
                    Mail::send('mail', $mail_data, function($message)use($mail_data, $pdf) {
                        $message->to($mail_data["email"], $mail_data["email"])
                                ->subject($mail_data["title"])
                                ->attachData($pdf->output(), "partner-shop.pdf");
                    });
    
                    echo "<script>console.log('Mail sent successfully')</script>";
                }
                
                else{
                    echo "<script>console.log('Mail don't send successfully')</script>";
                }
                
                
            }
        }

        if($request->input('progress_id') == 18) {
            // if($request->input('faxed_to_shop') > 0){
                $fax_count = DB::table('uploading_files')->where('kind', 'fax')->count();

                $pdf_count = $fax_count + 1;

                $flag = sprintf('%03d', $pdf_count);
                $file_name = $maintenance_data['FAX'].'-'.$maintenance_data['shop']['shop_id'].'-'.$maintenance_data['shop']['shop_name'].'-'.$flag.'.pdf';


                $pdf = PDF::loadView('pdf_three', $maintenance_data)
                ->setPaper('a4')
                ->setWarnings(false)
                ->setOptions(['isFontSubsettingEnabled' => true]);
                Storage::put('public/pdf/'.$file_name, $pdf->output());

                // Uploading_files table save  file history
                $upload = new Uploading_files();
                $upload->maintenance_id = $maintenance_id;
                $upload->kind = 'fax';
                $upload->file_name = $file_name;
                $upload->save();
            // }
        }
        

        // return view('pdf_one', $maintenance_data);
        // return $pdf->stream();
        

        // $pdf = mb_convert_encoding($pdf, 'HTML-ENTITIES', 'UTF-8');
        

        // return $pdf->download('pdf_file.pdf');

        // $view = view('pdf_one', $maintenance_data);
        // $html = mb_convert_encoding($view, 'HTML-ENTITIES', 'UTF-8');
        // $html_decode = html_entity_decode($html);
        // $pdf = \PDF::loadHTML($view)
        //     ->setPaper('a4', 'landscape')
        //     ->setWarnings(false)
        //     ->setOptions(['isFontSubsettingEnabled' => true]);
        // // Storage::put('public/pdf/invoice.pdf', $pdf->output());
        // return $pdf->download('pdf_file.pdf','UTF-8');
        // return view('pdf_one', $maintenance_data);

        // $path = public_path();
        // $pdf = PDF::loadView('pdf_one');
        // $pdf = mb_convert_encoding($pdf, 'HTML-ENTITIES', 'UTF-8');
        // $pdf->save($path.'/my_pdf_name.pdf', 'UTF-8');
        // return response()->download($path.'/my_pdf_name.pdf');

        // die;
        $row = new Maintenance_progress();
        $row->maintenance_id = $maintenance_id;
        $row->progress_id = $request->input('progress_id');
        $row->comment = $request->input('comment');
        $row->faxed_to_client = $request->input('faxed_to_client');
        $row->faxed_to_shop = $request->input('faxed_to_shop');
        $row->entered_by = $request->user()->user_id;
        $row->save();

        $maintenance_progress = Maintenance_progress::with('entered_by')->where('maintenance_id', $maintenance_id)->orderBy('updated_at', 'desc')->get();

        $maintenance = Maintenance::find($maintenance_id);
        $maintenance->progress_id = $request->input('progress_id');

        if($request->input('progress_id') == 18){
            $maintenance->visit_schedule_date = $request->input('visit_time');
            $maintenance->remark = $request->input('visit_comment');
        }
        if($request->input('progress_id') == 21) {
            $maintenance->completed_date = $maintenance_progress[0]['updated_at'];
        } else {
            $maintenance->completed_date = null;
        }

        if($request->input('deadline_date')) {
            $maintenance->deadline_date = $request->input('deadline_date');
        }
        $maintenance->save();

        // $maintenance_progress = Maintenance_progress::with('entered_by')->where('maintenance_id', $maintenance_id)->orderBy('updated_at', 'desc')->get();

        return response($maintenance_progress);
    }

    //9.5 tietie add
    public function createQuotation(Request $request, $maintenance_id)
    {
        $row = new Quotation_info();
        $row->maintenance_id = $maintenance_id;
        $row->date = $request->input('date');
        $row->comment = $request->input('comment');
        $row->amount = $request->input('amount');
        $row->photo_files_cnt = $request->input('photo_files_cnt');
        $row->kind = $request->input("kind");
        // $row->report_files_cnt = $request->input('report_files_cnt');
        $row->quotation_files_cnt = $request->input('quotation_files_cnt');
        $row->editor = $request->input('editor');
        // $row->entered_by = $request->user()->user_id;
        $row->save();

        // $maintenance = Maintenance::find($maintenance_id);
        // $maintenance->progress_id = $row->progress_id;
        // $maintenance->save();

        $quotation_info = Quotation_info::where('maintenance_id', $maintenance_id)->get();
        return response($quotation_info);
    }

    public function getAccountingSubjects($maintenance_id, Request $request){
        $subjectsList = Accounting_subjects::where('business_category_id', $request->input('business_category_id'))->orderBy('accounting_subjects_id', 'desc')->get();
        return response($subjectsList);
    }

    public function getSubjects(){
        $subjectsList = Accounting_subjects::orderBy('accounting_subjects_id', 'desc')->get();
        return response($subjectsList);        
    }

    public function createAccounting(Request $request, $maintenance_id)
    {
        $accounting_info_id = $request->input('accounting_info_id');
        $accounting_year = $request->input('accounting_year');
        if($request->input('accounting_info_id') > 0){
            Accounting_info::where('accounting_info_id', $request->input('accounting_info_id'))
            ->update([
                'partner_id' => $request->input('partner_id'),
                'partner_name' => $request->input('partner_name'),
                'accounting_year' => $request->input('accounting_year'),
                'tax' => $request->input('tax'),
                'including_price' => $request->input('including_price'),
                'unincluding_price' => $request->input('unincluding_price'),
                'accounting_subject_id' => $request->input('accounting_subject_id'),
             ]);

            //  DB::statement("UPDATE maintenances LEFT JOIN accounting_info ON maintenances.maintenance_id = accounting_info.maintenance_id SET accounting_ym = '$accounting_year' WHERE accounting_info_id = '$accounting_info_id'");
        } else{
            $row = new Accounting_info();
            $row->maintenance_id = $maintenance_id;
            $row->accounting_year = $request->input('accounting_year');
            $row->partner_id = $request->input('partner_id');
            $row->partner_name = $request->input('partner_name');
            $row->tax = $request->input('tax');
            $row->including_price = $request->input('including_price');
            $row->unincluding_price = $request->input('unincluding_price');
            $row->accounting_subject_id = $request->input('accounting_subject_id');
            $row->modified_by = $request->input('modified_by');
            $row->save();

            // DB::statement("UPDATE maintenances  SET accounting_ym = '$accounting_year' WHERE maintenance_id = '$maintenance_id'");
        }

        $accounting_info = Accounting_info::with('accounting_info')->where('maintenance_id', $maintenance_id)->orderBy('updated_at', 'desc')->get();
        return response($accounting_info);
    }

    public function editAccountingId(Request $request, $maintenance_id)
    {
        Accounting_info::where('accounting_info_id', $request->input('accounting_info_id'))
        ->update([
            'partner_id' => $request->input('partner_id'),
            'partner_name' => $request->input('partner_name'),
            'tax' => $request->input('tax'),
            'including_price' => $request->input('including_price'),
            'unincluding_price' => $request->input('unincluding_price'),
            'accounting_subject_id' => $request->input('accounting_subject_id'),
         ]);

        $accounting_info = Accounting_info::where('maintenance_id',  $maintenance_id)->get();
        return response($accounting_info);
    }    


    public function deleteAccountingId(Request $request, $accounting_info_id)
    {
        Accounting_info::where('accounting_info_id', $accounting_info_id)
        ->delete();

        $accounting_info = Accounting_info::where('maintenance_id', $request->input('maintenance_id'))->orderBy('updated_at', 'desc')->get();
        return response($accounting_info);
    } 

    public function uploadReport(Request $request, $maintenance_id)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'file' => 'required|mimes:pdf|max:204800',
            ]
        );

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }

        if ($request->file('file')) {

            //store file into document folder
            // $file = $request->file->store('public/reports');

            $file_name = $request->file('file')->getClientOriginalName();
            $file_data =  $request->file('file');

            $filePath = '/zensho-mainte/reportfiles/'.$maintenance_id.'/'. $file_name;
            Storage::disk('s3')->put($filePath, file_get_contents($file_data), 'private');

            //store your file into database
            $reportFile = new Uploading_files();
            // $reportFile->file_path = $file;
            $reportFile->file_name = $request->file('file')->getClientOriginalName();;
            $reportFile->maintenance_id = $maintenance_id;
            $reportFile->kind = 'report';
            $reportFile->save();

            return response()->json([
                "success" => true,
                "message" => "File successfully uploaded",
                "file" => $file_name
            ]);
        }
    }

    public function uploadPhoto(Request $request, $maintenance_id)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'file' => 'required|mimes:jpg,jpeg,png|max:204800',
            ]
        );

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }

        if ($request->file('file')) {

            //store file into document folder
            // $file = $request->file->store('public/photos');

            $file_name = $request->file('file')->getClientOriginalName();
            $file_data =  $request->file('file');

            /* s3 file upload  */



            // Storage::disk('local')->put("zensho-mainte/photofiles/$maintenance_id/$file_name",file_get_contents($file_data), 'public');   

            if (!Storage::disk('s3')->exists('/zensho-mainte/photofiles/'.$maintenance_id)) {
                Storage::disk('s3')->makeDirectory('/zensho-mainte/photofiles/'.$maintenance_id);
            }

            $filePath = '/zensho-mainte/photofiles/'.$maintenance_id.'/'. $file_name;
            Storage::disk('s3')->put($filePath, file_get_contents($file_data), 'private');



            //store your file into database
            $reportFile = new Uploading_files();

            /* local file upload */
            // $reportFile->file_path = $file;
            // $reportFile->file_name = $request->file('file')->getClientOriginalName();

            /* s3 file upload */
            $reportFile->file_name = $file_name;
            $reportFile->maintenance_id = $maintenance_id;
            $reportFile->kind = 'photo';
            $reportFile->save();



            return response()->json([
                "success" => true,
                "message" => "File successfully uploaded",
                "file" => $file_name,
            ]);
        }
    }

    public function uploadQuotationPhoto(Request $request, $maintenance_id)
    {

        $validator = Validator::make(
            $request->all(),
            [
                'file' => 'required|mimes:jpg,jpeg,png|max:204800',
            ]
        );

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }

        if ($request->file('file')) {


            $file_name = $request->file('file')->getClientOriginalName();
            $file_data =  $request->file('file');

            if (!Storage::disk('s3')->exists('/zensho-mainte/quotation_photo_files/'.$maintenance_id)) {
                Storage::disk('s3')->makeDirectory('/zensho-mainte/quotation_photo_files/'.$maintenance_id);
            }

            $filePath = '/zensho-mainte/quotation_photo_files/'.$maintenance_id.'/'. $file_name;
            Storage::disk('s3')->put($filePath, file_get_contents($file_data), 'private');



            //store your file into database
            $quotationId = Quotation_info::latest()->first();
            $reportFile = new Uploading_files();

            $reportFile->file_name = $file_name;
            $reportFile->maintenance_id = $maintenance_id;
            $reportFile->info_id = $quotationId['quotation_info_id'];
            $reportFile->kind = 'quotation_photo';
            $reportFile->save();



            return response()->json([
                "success" => true,
                "message" => "File successfully uploaded",
                "file" => $file_name,
            ]);
        }
    }

    public function uploadQuotation(Request $request, $maintenance_id)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'file' => 'required|mimes:pdf|max:204800',
            ]
        );

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }

        if ($request->file('file')) {

            //store file into document folder
            // $file = $request->file->store('public/quotations');
            // if (!Storage::disk('s3')->exists('/zensho-mainte/quotationfiles/'.$maintenance_id)) {
            //     Storage::disk('s3')->makeDirectory('/zensho-mainte/quotationfiles/'.$maintenance_id);
            // }

            $file_name = $request->file('file')->getClientOriginalName();
            $file_data =  $request->file('file');
            $filePath = '/zensho-mainte/quotationfiles/'.$maintenance_id.'/'. $file_name;
            Storage::disk('s3')->put($filePath, file_get_contents($file_data), 'private');


            //store your file into database
            $reportFile = new Uploading_files();
            // $reportFile->file_path = $file;
            $reportFile->file_name = $request->file('file')->getClientOriginalName();;
            $reportFile->maintenance_id = $maintenance_id;
            $reportFile->kind = 'quotation';
            $reportFile->save();

            return response()->json([
                "success" => true,
                "message" => "File successfully uploaded",
                "file" => $file_name
            ]);
        }
    }


    public function ultimateCustomSearch($maintenance_id, Request $request)
    {
        $result = Partner::select('partner_code', 'partner_name', 'partner_id', 'TEL', 'FAX', 'name_alias')
            ->distinct()
            ->groupBy('partner_code');
        if ($request->input('partner_code')) {
            $result->where('partner_code', 'like', '%' . $request->input('partner_code') . '%');
        }

        if ($request->input('partner_id')) {
            $result->where('partner_id', 'like', '%' . $request->input('partner_id') . '%');
        }

        if ($request->input('partner_name')) {
            $result->where('partner_name', 'like', '%' . $request->input('partner_name') . '%');
        }

        if ($request->input('partner_tel')) {
            $result->where('TEL', 'like', '%' . $request->input('partner_tel') . '%');
        }

        if ($request->input('name_alias')) {
            $result->where('name_alias', 'like', '%' . $request->input('name_alias') . '%');
        }

        if ($request->input('partner_fax')) {
            $result->where('FAX', 'like', '%' . $request->input('partner_fax') . '%');
        }

        // if ($request->input('customergroup_code')) {
        //     $result->where('customergroup_code', 'like', '%' . $request->input('customergroup_code') . '%');
        // }

        // if ($request->input('customergroup')) {
        //     $result->where('customergroup', 'like', '%' . $request->input('customergroup') . '%');
        // }

        $result_again = $result->get();
        if ($result_again->count()) {
            return response($result_again);
        } else return response(0);
    }


    public function big_middleconnect(Request $request, $category_id)
    {
        if($category_id == 0) {
            $result = Sub_category::select('sub_category_id', 'category_id', 'sub_category_name')
            ->distinct()
            ->get();
        } else {
            $result = Sub_category::select('sub_category_id', 'category_id', 'sub_category_name')
            ->distinct()
            ->where('category_id', $category_id)
            ->get();
        }


        if ($result->isEmpty()) {
            $result[0] = array(
                'sub_category_id' => '',
                'category_id' => '',
                'sub_category_name' => '',
            );
        }
        // echo $result;
        return response($result);
    }

    public function middle_bigconnect(Request $request, $sub_category_id)
    {
        $category_ids = Sub_category::select('category_id')
                        ->distinct()
                        ->where('sub_category_id', $sub_category_id)
                        ->get();
        // var_export($category_ids[0]['category_id']);
        $result = Category::select('category_id', 'category_name')
            ->distinct()
            ->where('category_id', $category_ids[0]['category_id'])
            ->get();

        if ($result->isEmpty()) {
            $result[0] = array(
                'category_id' => '',
                'category_name' => '',
            );
        }
        return response($result);
    }


    public  function deleteQuotationId(Request $request, $quotation_info_id)
    {
        Quotation_info::where('quotation_info_id', $quotation_info_id)->delete();

        Uploading_files::where('kind', 'quotation_photo')
                        ->where('maintenance_id', $request->input('maintenance_id'))
                        ->where('info_id', $quotation_info_id)->delete();

        $result = Quotation_info::where('maintenance_id', $request->input('maintenance_id'))->get();

        return response($result);
    }
    

    // public function depart_name(Request $request, $customergroup_code)
    // {
    //     $result = Partner::select('customergroup')
    //         ->distinct()
    //         ->where('customergroup_code', $customergroup_code)
    //         ->groupBy('customergroup')
    //         ->get();

    //     if ($result->isEmpty()) {
    //         $result[0] = array(
    //             'customergroup_code' => '',
    //         );
    //     }
    //     // echo $result;
    //     return response($result);
    // }



    public function selectreason(Request $request, $maintenance_id)
    {
        $maintenance = Maintenance::find($maintenance_id);
        $maintenance->order_reason_id = $request->input('reason');

        if ($request->input('other')) $maintenance->order_type_other_text = $request->input('other');
        $maintenance->save();

        $order_reason = Order_reason::find($request->input('reason'));

        return response($order_reason);
    }

    public function update_customerid(Request $request, $maintenance_id)
    {
        $partner_id = $request->input('partner_id');
        if ($partner_id > 0) {
            $partner_code = $request->input('partner_code');
        } else {
            $row = new Partner();
            $row->partner_code = $request->input('partner_code');
            $row->partner_name = $request->input('partner_name');
            $row->name_alias = $request->input('name_alias');
            // $row->customergroup = $request->input('customergroup');
            // $row->customergroup_code = $request->input('customergroup_code');
            $row->TEL = $request->input('partner_tel');
            $row->FAX = $request->input('partner_fax');
            $row->save();

            $partner_code = $request->input('partner_code');
            $maintenance = Maintenance::find($maintenance_id);
            $maintenance->partner_code = $request->input('partner_code');
            $maintenance->save();
        }


        $files = Maintenance::where('maintenance_id', $maintenance_id)->update(['partner_code' => $partner_code]);


        $result = Partner::select('partner_code', 'partner_name', 'partner_id', 'TEL', 'FAX', 'name_alias')
            ->distinct()
            ->where('partner_code', $partner_code)
            ->groupBy('partner_code')
            ->get();
        return response($result);
    }

    

    public function getUploadFiles(Request $request, $maintenance_id)
    {
        $files = Uploading_files::where('maintenance_id', $maintenance_id)
        ->get();
        return response($files);
    }


    public function saveNotes(Request $request, $shop_id)
    {
        $note1 = $request->input('note1');
        $note2 = $request->input('note2');

        $update_state = Shop::where('shop_id', $shop_id)->update(['note1' => $note1, 'note2' => $note2]);

        $files = Shop::where('shop_id', $shop_id)->get();
        return $files;
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
            'shop.business_category_option',
            'shop.users',
            'orderType', 'progress',
            'user',
            'maintenanceProgress.entered_by',
            'maintenanceImages',
            'orderReasons',
            'category', 'subCategory',
            'maintenanceMatters.matter_value',
            'maintenanceMatters.matter_option',
            'uploadingFiles',
            'quotationInfo', 'accountingInfo.accounting_info'
        ])->find($maintenance_id);

        $qb_maintenanceTopartners =  DB::select("SELECT partner_id, partner_no, partner_name, TEL, FAX FROM `maintenances` LEFT JOIN partners ON maintenances.partner_code=partners.partner_code WHERE maintenance_id= ?", [$maintenance_id]);

        $maintenance['partner_id'] = $qb_maintenanceTopartners['0']->partner_id;
        $maintenance['partner_no'] = $qb_maintenanceTopartners['0']->partner_no;
        $maintenance['partner_name'] = $qb_maintenanceTopartners['0']->partner_name;
        $maintenance['TEL'] = $qb_maintenanceTopartners['0']->TEL;
        $maintenance['FAX'] = $qb_maintenanceTopartners['0']->FAX;
        

        $partner_staff = DB::table('partners_staff')->where('partner_id', $maintenance['partner_id'])->first();

        if(!empty($partner_staff)) {
            $maintenance['partner_email'] = $partner_staff->email;
        } else {
            $maintenance['partner_email'] = '';
        }


        $block_ids = Shop::select('block_id')->where('shop_id', $maintenance['shop_id'])->get();
        $block_names = Block::select('block_name')->where('block_id', $block_ids[0]['block_id'])->get();
        $blockUser_ids = Block_manager::select('user_id')->where('block_id', $block_ids[0]['block_id'])->get();
        $blockUsersNEs = User::select('name', 'email')->where('user_id', $blockUser_ids[0]['user_id'])->get();
        $maintenance['blockUsersNEs'] = $blockUsersNEs;
        $maintenance['block_names'] = $block_names;


        $district_ids = Block::select('district_id')->where('block_id', $block_ids[0]['block_id'])->get();
        $district_names = District::select('district_name')->where('district_id', $district_ids[0]['district_id'])->get();
        $districtUser_ids = District_manager::select('user_id')->where('district_id', $district_ids[0]['district_id'])->get();
        $districtUserNEs = User::select('name', 'email')->where('user_id', $districtUser_ids[0]['user_id'])->get();
        $maintenance['districtUserNEs'] = $districtUserNEs;
        $maintenance['district_names'] = $district_names;

        $department_ids = District::select('department_id')->where('district_id', $district_ids[0]['district_id'])->get();
        $department_names = Department::select('department_name')->where('department_id', $department_ids[0]['department_id'])->get();
        $generalManagerUserids = General_manager::select('user_id')->where('department_id', $department_ids[0]['department_id'])->get();
        $departmentUserNEs = User::select('name', 'email')->where('user_id', $generalManagerUserids[0]['user_id'])->get();

        $maintenance['departmentUserNEs'] = $departmentUserNEs;
        $maintenance['department_names'] = $department_names;


        // $quotationcus = Partner::select('partner_code', 'partner_name', 'partner_id', 'TEL', 'FAX')
        //     ->distinct()
        //     ->where('partner_code', $maintenance['partner_code'])
        //     ->groupBy('partner_code')
        //     ->get();


        // if ($quotationcus->isEmpty()) {
        //     $quotationcus[0] = array(
        //         'partner_code' => '',
        //         'customer_name' => '',
        //         'customer_id' => '',
        //         'TEL' => '',
        //         'FAX' => '',
        //     );
        // }

        // $maintenance['customerInformation'] = $quotationcus;

        // $customgroup_list = Partner::select('customergroup',  'customergroup_code')
        //     ->distinct()
        //     ->whereNotNull('customergroup_code')
        //     ->get();

        // $maintenance['customgroup_list'] = $customgroup_list;
            
        $order_reason = Order_reason::select('order_reason_id', 'reason')
            ->distinct()
            ->where('order_reason_id', $maintenance['order_reason_id'])
            ->get();

        if ($order_reason->isEmpty()) {
            $order_reason[0] = array(
                'order_reason_id' => '',
                'reason' => '',
            );
        }

        $maintenance['order_reason'] = $order_reason;


        // $quotation = DB::table('quotation_files')
        //     ->where('maintenance_id',$maintenance_id)
        //     ->get();
        // $maintenance['quotation_files'] = $quotation; 
        return response($maintenance);
    }

    // public function getStatusDeadline()
    // {
    //     $qb = DB::table('business_category_options')->where('')
    // }

    public function update(Request $request, $maintenance_id)
    {
        // $order                 = $equipment . ' ' . $manufacturer . ':' . $model_number . ' ' . $when . ' ' . $situation . '手配お願いします。';

        // var_export($request->input('order_checkList'));



        if($request->input('order_type_id') == 2 && $request->input('order_checkList')){
            $delete_status = DB::table('maintenance_order_reasons')->where('maintenance_id', $maintenance_id)->delete();

            $order_chkList = $request->input('order_checkList');
            foreach ($order_chkList as $key => $value) {
                $order_reason_id = DB::table('order_reasons')->where('reason', $value)->first()->order_reason_id;
                $maintenance_reason = new Maintenance_order_reason();
                $maintenance_reason->maintenance_id = $maintenance_id;
                $maintenance_reason->order_reason_id = $order_reason_id;
                $maintenance_reason->save();
    
            }
        }


        $maintenance = Maintenance::find($maintenance_id);
        // if($request->input('is_disaster')) {
        $maintenance->is_disaster     = $request->input('is_disaster');
        $maintenance->order_type_other_text = $request->input('order_type_other_text');
        // }
        // if($request->input('is_emergency')) {
        $maintenance->is_emergency    = $request->input('is_emergency');
        // }
        if ($request->input('category_id')) {
            $maintenance->category_id     = $request->input('category_id');
        }
        if ($request->input('category_id') == '') {
            DB::table('maintenances')
                ->where('maintenance_id', $maintenance_id)
                ->update(array('category_id' => NULL));
        }
        if ($request->input('sub_category_id')) {
            $maintenance->sub_category_id = $request->input('sub_category_id');
        }
        if ($request->input('sub_category_id') == '') {
            DB::table('maintenances')
                ->where('maintenance_id', $maintenance_id)
                ->update(array('sub_category_id' => NULL));
        }
        if ($request->input('order_type_id')) {
            $maintenance->order_type_id   = $request->input('order_type_id');
        }
        if ($request->input('remark')) {
            $maintenance->remark          = $request->input('remark');
        }
        if ($request->input('order')) {
            $maintenance->order           = $request->input('order');
        }

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
