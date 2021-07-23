<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;

use App\User;
use App\Shop;
use App\Business_category;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

	use AuthenticatesUsers;


	public function showLoginForm()
    {
        return view('auth.login')->with(['business_categories' => Business_category::all()]);
    }

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
//    protected $redirectTo = '/home';
    protected $redirectTo = '/maintenance';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest', ['except' => 'logout']);
    }

	public function username() {
		return 'staff_id';
	}

	protected function credentials(Request $request)
    {
        $arr = $request->only($this->username(), 'password', 'shop_code', 'business_category');
        return $arr;
    }

	public function authenticate(Request $request)
	{
		$validate_rule = [
			'business_category' => 'required',
			'shop_code' => 'required|numeric',
			'staff_id' => 'required|numeric',
		];
		$this->validate($request, $validate_rule);

		$staff_id = $request->staff_id;
		$shop_code  = $request->shop_code;
		$business_category_id = $request->business_category;
		if ( isset($request->canLogin) ) {
			$canLogin = $request->canLogin;
		} else {
			$canLogin = false;
		}

		$error_msg = '';

		$user_exists = User::where('staff_id', $staff_id)->exists();
		if ( !$user_exists ) {
			$error_msg = '入力された従業員コードは存在しません。';
			return redirect()->back()->with('error_msg', $error_msg)->withInput($request->input());
		}

		$user = User::where('staff_id', $staff_id);

		$business_category_exists = $user->where('business_category_id', $business_category_id)->exists();
		if ( !$business_category_exists ) {
			$error_msg = 'この業態には属しておりません。';
			return redirect()->back()->with('error_msg', $error_msg)->withInput($request->input());
		}
		// Cookie::queue('business_category_id', $business_category_id, time() + 60 * 60 * 24 * 7); //1week
    	setcookie('business_category_id', $business_category_id, time() + 60 * 60 * 24 * 7);

		$user = $user->first();

		if ( 'true' === $canLogin ) {
			Auth::loginUsingId($user->user_id);
			return redirect()->intended('vue');
		}

		if ( 1 === $user->role_id || 10 === $user->role_id || 20 === $user->role_id || 30 === $user->role_id ) {
			$staff_name = $user['name'];
			return redirect()->back()->with(['canLogin' => 'true', 'staff_name' => $staff_name])->withInput($request->input());
		}

		$user_shop = Shop::find($user->shop_id);
		$request_shop = Shop::where('shop_code', $shop_code)->first();
		if ( $user_shop['shop_code'] !== $request_shop['shop_code'] ) {
			$error_msg = 'この店舗には属していません。<br>店舗コードを確認してください。';
			return redirect()->back()->with('error_msg', $error_msg)->withInput($request->input());
		}

		$shop_name = $user_shop['shop_name'];
		$staff_name = $user['name'];
		return redirect()->back()->with(['canLogin' => 'true', 'shop_name' => $shop_name, 'staff_name' => $staff_name])->withInput($request->input());

	}

}
