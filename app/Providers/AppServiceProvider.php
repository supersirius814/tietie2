<?php

namespace App\Providers;

use Illuminate\Http\Request;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot(Request $request)
    {
        $request->setTrustedProxies([ $request->getClientIp() ]);
        if ($request->ip() === '10.99.50.71') { // 踏み台サーバー
            \URL::forceRootUrl(\Config::get('app.url').':4000');
        }
        
        if ($this->app->environment() !== 'local') {
            \URL::forceSchema('https');
        }
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        if ($this->app->isLocal()) {
            $this->app->register(\Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider::class);
        }
        //
    }
}
