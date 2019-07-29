<?php

namespace App\Http\Controllers\Site;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Str;

class HomeController extends Controller
{   
    public function hello($name='')
    {   
        if($name==''){
    		return response()->json(
	        	["message" => "Please set the name on url. E.: http://hostname/hello/{name}"]
	        );
    	}else{
    		return response()->json(
	        	[ 
                    "message" => "Hello $name from ".exec('cat /etc/hostname') 
                ]
	        );
    	}

    }
}
