<?php

namespace App;


class Msg 
{

	/**
     * Return a message response formated.
     *
     * @param  $message = message to show
     * @param  $status = status of message
     * @param  $code = code message
     * @param  $data = default false
     *
     * @return \Illuminate\Http\Response
     */
	public static function responseMsg($message, $status, $code, $data=false){

		$response = [
            'message'	=> $message,
            'data' 		=> $data, 
            'status'	=> $status, 
            'code'		=> $code 
        ];

		return $response;

	}



}