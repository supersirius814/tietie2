<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;
	
	protected $primaryKey = 'user_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'shop_id',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
	
	public function maintenances()
	{
		return $this->hasMany('App\Maintenance', 'applicant_id');
	}
	
	public function shop()
	{
		return $this->belongsTo('App\Shop', 'shop_id');
	}

    public function accounting_info(){
        return $this->hasMany('App\Accounting_info', 'user_id', 'modified_by');
    }
	
	public function role()
	{
		return $this->belongsTo('App\Role', 'role_id');
	}
	
	public function business_category()
	{
		return $this->belongsTo('App\Business_category', 'shop_category', 'business_category_id');
	}

	public function maintenance_progress()
	{
		return $this->hasMany('App\Maintenance_progress', 'user_id', 'entered_by');
	}
	
    public function partner(){
        return $this->belongsTo('App\Partner', 'partner_code');
    }
}
