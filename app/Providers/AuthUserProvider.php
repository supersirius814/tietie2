<?php

namespace App\Providers;

use Illuminate\Auth\EloquentUserProvider;
use Illuminate\Support\Facades\Log;

class AuthUserProvider extends EloquentUserProvider
{
    public function retrieveById($identifier)
    {
        return $this->createModel()->newQuery()->find($identifier);
    }
}