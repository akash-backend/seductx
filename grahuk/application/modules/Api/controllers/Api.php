<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Kolkata");
class api extends Base_Controller {
	
	public function __construct()
	{
		parent:: __construct();
		$this->checkAuth();		
		$this->load->helper(
        	array('common','api')
		);
		
		$this->load->model("api_model");
	}	
	
	
	public function otp_verify()
	{
		if(!empty($_REQUEST['country_code']) && !empty($_REQUEST['phone_number']))
		{
			$mobile_otp =(rand(1000,9999));
			$message = $mobile_otp." is your maeda verification code";
			$phone_number = $_REQUEST['country_code'].$_REQUEST['phone_number'];
			send_otp($phone_number,$message); 
		
			$this->response(true,"otp send successfully",array('phone_number' => $phone_number,'mobile_otp' => $mobile_otp));
		}
		else
		{
			$this->response(false,"Mobile Number already exist");
		}	
	}

	
}
?>