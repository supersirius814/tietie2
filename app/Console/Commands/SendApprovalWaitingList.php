<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Block;
use App\Block_manager;
use App\Business_category;
use App\Business_category_option;
use App\District;
use App\District_manager;
use App\Maintenance;
use App\Shop;
use App\User;

use Carbon\Carbon;

use Illuminate\Support\Facades\Mail;
use App\Mail\NotificationMail;

class SendApprovalWaitingList extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'approvalwaitinglist:send';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        logger('承認待ちリスト送信処理開始');
        
        $business_category_ids = Business_category::pluck('business_category_id');
        foreach ( $business_category_ids as $business_category_id ) {
            
            $headquarters = Business_category::where('business_category_id', $business_category_id)->value('headquarters_email');
            
            $renotification_time = Business_category_option::where('business_category_id', $business_category_id)
                ->where('option_name', 'renotification_time')
                ->value('option_value');
            
            if ( !empty( $renotification_time ) ) {
                $now = Carbon::now();
                $backlogged_maintenances = Maintenance::where('progress_id', 1)
                    ->where('notify_at', '<', $now->subHour($renotification_time))
                    ->select('maintenance_id', 'shop_id', 'progress_id')
                    ->get(); // object
                if ( 0 < $backlogged_maintenances->count() ) {
                    $plucked_shop_ids = $backlogged_maintenances->pluck('shop_id');
                    $backlogged_maintenance_count_each_shop = array_count_values($plucked_shop_ids->toArray());
                    $shop_ids = $plucked_shop_ids->unique()->values();
                    $shops    = Shop::whereIn('shop_id', $shop_ids)->select('shop_id', 'shop_name', 'block_id')->get();
                    foreach ( $shops as $shop ) {
                        $shop['backlogged_maintenance_count'] = $backlogged_maintenance_count_each_shop[$shop->shop_id];
                    }
                    $block_ids = $shops->pluck('block_id')->unique()->values();
                    $blocks    = Block::whereIn('block_id', $block_ids)->select('block_id', 'block_name', 'district_id')->get();
                    $data = [
                        'type'    => '承認待ちリスト',
                        'subject' => 'KMS 本日の承認待ちリスト（BM）',
                        'now'     => Carbon::now()->format('Y年n月j日 G時i分'),
                        'hours'   => $renotification_time,
                    ];
                    foreach ( $blocks as $block ) {
                        $shops_in_block = $shops->where('block_id', $block->block_id);
                        $data['shops']  = $shops_in_block;
                        $block_managers = Block_manager::where('block_id', $block->block_id)->get();
                        $BM = [];
                        foreach ( $block_managers as $block_manager ) {
                            $BM[] = User::find($block_manager->user_id);
                        }
						if ( config('app.env') == 'local' ) {
							$BM = 'yasu.fukuhara@interface-design.jp';
						}
                        Mail::to($BM)->send(new NotificationMail($data));

						foreach ( $shops_in_block as $shop ) {
							$block['backlogged_maintenance_count'] += $shop['backlogged_maintenance_count'];
						}
                    }

					// DM
					$district_ids = $blocks->pluck('district_id')->unique()->values();
					$districts    = District::whereIn('district_id', $district_ids)
                                    ->select('district_id', 'district_name', 'department_id')
                                    ->get();
					$data['subject'] = 'KMS 本日の承認待ちリスト（DM）';
					unset($data['shops']);
					foreach ( $districts as $district ) {
						$blocks_in_district = $blocks->where('district_id', $district->district_id);
						$data['blocks'] = $blocks_in_district;
						$district_managers = District_manager::where('district_id', $district->district_id)->get();
						$DM = [];
						foreach ( $district_managers as $district_manager ) {
							$DM[] = User::find($district_manager->user_id);
						}
						if ( config('app.env') == 'staging' ) {
							$headquarters = [
                                'fukuhara810@gmail.com'
                            ];
						}
						if ( config('app.env') == 'local' ) {
                            $DM = [
                                'yasu.fukuhara@interface-design.jp'
                            ];
							$headquarters = [];
						}
						Mail::to($DM)->cc($headquarters)->send(new NotificationMail($data));
						
					}

                } else {
                    logger($renotification_time.'時間以上経過した承認待ちの申請はありません');
                }
                
            }
        }
        
        logger('承認待ちリスト送信処理完了');
        
        // ログファイルのパーミッションを666にする、存在チェックしてから
        $today = Carbon::today();
        $file_name = storage_path('logs/').'laravel-'.$today->format('Y-m-d').'.log';
        if ( file_exists( $file_name ) ) {
            chmod($file_name, 0666);
        }

    }
}
