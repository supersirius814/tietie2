<?php

namespace App\Console\Commands;


use Illuminate\Console\Command;

use App\Block;
use App\Block_manager;
use App\Business_category;
use App\Business_category_option;
use App\District;
use App\District_manager;
use App\Shop;
use App\Maintenance;
use App\User;

use Carbon\Carbon;

use Illuminate\Support\Facades\Mail;
use App\Mail\NotificationMail;

use Log;


class SendNotifications extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'notifications:send';

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
        Log::debug('メンテ申請処理状況通知処理開始');
        
        $business_category_ids = Business_category::pluck('business_category_id');
                
        foreach ( $business_category_ids as $business_category_id ) {
            
            $headquarters = Business_category::where('business_category_id', $business_category_id)->value('headquarters_email');
            
            $notification_time = Business_category_option::where('business_category_id', $business_category_id)
                                    ->where('option_name', 'notification_time')
                                    ->value('option_value');
            
            if ( $notification_time ) {
                $type    = '申請処理状況通知';
                $subject = 'KMS 申請処理状況通知';
                $this->sendNotification($notification_time, $type, $subject, $headquarters);                            
            }
            
        }
        
        Log::debug('メンテ申請処理状況通知処理完了');
        
        // ログファイルのパーミッションを666にする、存在チェックしてから
        $today = Carbon::today();
        $file_name = storage_path('logs/').'laravel-'.$today->format('Y-m-d').'.log';
        if ( file_exists( $file_name ) ) {
            chmod($file_name, 0666);
        }
        
    }
    
    private function sendNotification($hours, $type, $subject, $headquarters)
    {
        
        // ○時間以上「BM承認待ち」のままの申請を取得
        $now       = Carbon::now();
        $hours_ago = $now->subHour($hours); // 現在時刻より○時間前
        $backlogged_maintenances = Maintenance::where('progress_id', 1)
                                    ->where('notify_at', '<', $hours_ago)
                                    ->select('maintenance_id', 'shop_id', 'progress_id')
                                    ->get();

        if ( 0 < $backlogged_maintenances->count() ) {

            // 未処理のメンテ申請に紐付いた店舗を取得
            $plucked_by_shop_ids = $backlogged_maintenances->pluck('shop_id'); // 申請データの中からshop_idだけを取得

            $backlogged_maintenance_count_each_shop = array_count_values($plucked_by_shop_ids->toArray()); //配列 店舗毎の申請データの数

            $shop_ids = $plucked_by_shop_ids->unique()->values(); // shop_idの重複を削除し、添字付け直し
            $shops    = Shop::whereIn('shop_id', $shop_ids)->select('shop_id', 'shop_name', 'block_id')->get();

            foreach ( $shops as $shop ) {
                $shop['backlogged_maintenance_count'] = $backlogged_maintenance_count_each_shop[$shop->shop_id];
            }

            // 店舗に紐付いたブロックを取得
            $block_ids = $shops->pluck('block_id')->unique()->values(); // 店舗に紐付いたblock_idだけを取得、重複を削除し、添字付け直し
            $blocks    = Block::whereIn('block_id', $block_ids)->select('block_id', 'block_name', 'district_id')->get();

            // 送信データの共通部分セット
            $data = [
                'type'    => $type,
                'subject' => $subject . '（BM）',
                'now'     => Carbon::now()->format('Y年n月j日 G時i分'),
                'hours'   => $hours,                
            ];

            // 各ブロックごとの送信データを追加して担当BMにメール送信
            foreach ( $blocks as $block ) {

                $shops_in_block = $shops->where('block_id', $block->block_id);

                $data['shops'] = $shops_in_block;

                $block_managers = Block_manager::where('block_id', $block->block_id)->get();
                $BM = [];
                foreach ( $block_managers as $block_manager ) {
                    $BM[] = User::find($block_manager->user_id);
                }
                Mail::to($BM)->send(new NotificationMail($data));


                // DMに送る用のデータを準備
                foreach ( $shops_in_block as $shop ) {
                    $block['backlogged_maintenance_count'] += $shop['backlogged_maintenance_count'];
                }

                //$block['shops'] = $shops_in_block;

            }

            // ブロックに紐付いたディストリクトを取得
            $district_ids = $blocks->pluck('district_id')->unique()->values();
            $districts    = District::whereIn('district_id', $district_ids)->select('district_id', 'district_name', 'department_id')->get();

            // DMへの送信データの共通部分セット&BM用のshopsデータ削除
            $data['subject'] = $subject . '（DM）';
            unset($data['shops']);

            // 各ディストリクトごとの送信データを追加して担当DMと本部にメール送信
            foreach ( $districts as $district ) {

                $blocks_in_district = $blocks->where('district_id', $district->district_id);

                $data['blocks'] = $blocks_in_district;

                $district_managers = District_manager::where('district_id', $district->district_id)->get();
                $DM = [];
                foreach ( $district_managers as $district_manager ) {
                    $DM[] = User::find($district_manager->user_id);
                }
                if ( config('app.env') == 'staging' ){
                    $headquarters = [
                        'fukuhara810@gmail.com'
                    ];
                }
                if ( config('app.env') == 'local' ) {
                    $headquarters = [
                        'yasu.fukuhara@interface-design.jp',
                    ];
                }
                Mail::to($DM)->cc($headquarters)->send(new NotificationMail($data));

            }
        } else {
            logger($hours.'時間以上経過した承認待ちの申請はありません');
        }
    }
    
}
