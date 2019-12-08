<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Kolkata");
class Agent extends Base_Controller {
	
	public function __construct()
	{
		parent:: __construct();
		// $this->checkAuth();		
		$this->load->helper(
        	array('common', 'agent', 'sendnotification')
		);
		$this->load->library('email');
		$this->load->model("agent_model");
		$this->load->model("escort_model");
		header('Access-Control-Allow-Origin: *');
		header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
		header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');
		header('Access-Control-Allow-Credentials: true');
	}	
	
	public function signup()
	{	
		if(!empty($_REQUEST['email']))
		{
			$exist = $this->common->getData('agent',array('email' => $_REQUEST['email']),array('single'));

			$existPhone = $this->common->getData('agent',array('phone_number' => $_REQUEST['phone_number'],'country_code' => $_REQUEST['country_code']),array('single'));
		
			if(!empty($exist))
			{
				$response = $this->response(false,"This email already exists.");				
			}
			else if(!empty($existPhone))
			{
				$response = $this->response(false,"This phone number already exists.");
			}
			else
			{
				$_REQUEST['password'] = md5($_REQUEST['password']);
				$_REQUEST['created_at'] = date('Y-m-d H:i:s');
								
				
				
				$post = $this->common->getField('agent',$_REQUEST); 
				$result = $this->common->insertData('agent',$post);
				$agent_id = $this->db->insert_id();
				if($result)
				{
					$countryInfo = $this->common->getData('countries',array('id' => $_REQUEST['country_code']),array('single'));
					$mobile_otp = $this->otp_verification($countryInfo['phonecode'],$_REQUEST['phone_number']);
					
					$info = get_agent_details($agent_id);	
					$info['phone_number'] = $_REQUEST['phone_number'];
					$info['country_code'] = $countryInfo['phonecode'];

					$this->response(true,"Your registration successfully completed.",array("agent_id"=>$agent_id,"mobile_otp"=>$mobile_otp,"agentinfo" => $info));					
				}
				else
				{
					$this->response(false,"There is a problem, please try again.");
				}
			}
		}
		else
		{
			$this->response(false,'Missing Parameter');
		}
	}


	public function escort_list()
	{ 	

		$agentInfo = $this->common->getData('agent', array('agent_id' => $_REQUEST['agent_id']), array('single'));

		
        $result = $this->agent_model->escortListAgent(array('E.agent_id' => $_REQUEST['agent_id'],'E.progress_status'=>4,'E.status'=> 1,'E.mobile_verify'=> 1),array(),$agentInfo['latitude'],$agentInfo['longitude']);




        $result_count = $this->agent_model->escortListAgent(array('E.agent_id' => $_REQUEST['agent_id'],'E.progress_status'=>4),array("count"),$agentInfo['latitude'],$agentInfo['longitude']);

         


       

     	
        if(!empty($result))
        {
        	foreach ($result as $key => $value) 
	        {
	        	
	       		if(!empty($result[$key]["profile_image"]))
				{
					$result[$key]["profile_image"] = base_url($result[$key]["profile_image"]);
				} else {
					$result[$key]["profile_image"] = base_url($result[$key]["profile_image"]);
				}

				if(!empty($result[$key]["image1"])) {
					$result[$key]["image1"] = base_url($result[$key]["image1"]);
				} else {
					$result[$key]["image1"] = base_url($result[$key]["profile_image"]);
				}


				if(!empty($result[$key]["image2"])) {
					$result[$key]["image2"] = base_url($result[$key]["image2"]);
				} else {
					$result[$key]["image2"] = base_url($result[$key]["profile_image"]);
				}


				if(!empty($result[$key]["image3"])){
					$result[$key]["image3"] = base_url($result[$key]["image3"]);
				} else {
					$result[$key]["image2"] = base_url($result[$key]["profile_image"]);
				}

				if(!empty($result[$key]["image4"])) {
					$result[$key]["image4"] = base_url($result[$key]["image4"]);
				} else {
					$result[$key]["image4"] = base_url($result[$key]["profile_image"]);
				}

				if(!empty($result[$key]["image5"])) {
					$result[$key]["image5"] = base_url($result[$key]["image5"]);
				} else {
					$result[$key]["image5"] = base_url($result[$key]["profile_image"]);
				}

				if(!empty($result[$key]["image6"])) {
					$result[$key]["image6"] = base_url($result[$key]["image6"]);
				} else {
					$result[$key]["image6"] = base_url($result[$key]["profile_image"]);
				}
	        }


	        $this->response(true,"Escort fetch Successfully.",array("escort_list" => $result,"maxEscorts" => $result_count));
        }
        else
        {
        	$this->response(false,"data not found.",array("escort_list" => array()));	
        }
	}



	public function updateProfile()
	{
		$agent_id = $_REQUEST['agent_id']; unset($_REQUEST['agent_id']);

		$post = $this->common->getField('agent',$_REQUEST);
		
		if(!empty($post))
		{		
			$result = $this->common->updateData('agent',$post,array('agent_id' => $agent_id));
		}
		else
		{
			$result = "";
		}
		
		if($result)
		{
			$info = get_agent_details($agent_id);
			$this->response(true,"Profile Update Successfully",array("agent_id"=>$agent_id,"agentinfo" => $info,"agent_id"=>$agent_id));
		}
		else
		{
			$this->response(false,"There is a problem, please try again.",array("agentinfo" =>(object) array()));
		}
	}



	function otp_verification($country_code, $phone_number)
	{
			$mobile_otp =(rand(100000,999999));
			$message = $mobile_otp." is your seductx agent verification code";
			$phone_number = '+'.$country_code.$phone_number;
		
			send_otp($phone_number,$message); 
		
			return $mobile_otp;
	}


	public function resend_otp()
	{
		$countryInfo = $this->common->getData('countries',array('id' => $_REQUEST['country_code']),array('single'));
		$mobile_otp = $this->otp_verification($countryInfo['phonecode'],$_REQUEST['phone_number']);
		$this->response(true,'Otp sent successfully',array('mobile_otp' => $mobile_otp));
	}



	public function updatePhone()
	{
		if(!empty($_REQUEST['agent_id']) && !empty($_REQUEST['phone_number']) && !empty($_REQUEST['country_code'])) {

		$where ="agent_id != '".$_REQUEST['agent_id']."' AND phone_number = '".$_REQUEST['phone_number']."' AND country_code = '".$_REQUEST['country_code']."'";
		$result = $this->common->getData('agent',$where,array('single'));
	
   
        if(empty($result)) {
        	$updateresult = $this->common->updateData('agent',array('country_code' => $_REQUEST['country_code'],'phone_number' => $_REQUEST['phone_number']),array('agent_id' => $_REQUEST['agent_id']));
			$countryInfo = $this->common->getData('countries',array('id' => $_REQUEST['country_code']),array('single'));
        	$mobile_otp = $this->otp_verification($countryInfo['phonecode'],$_REQUEST['phone_number']);
			$this->response(true,"otp sent Successfully.",array("mobile_otp" => $mobile_otp));			
		} else {
			$this->response(false,"phone number already used by another agent",array("mobile_otp" => '0'));
		}

		} else {
			$this->response(false,"Missing Parameter.");
		}
	}


	
	


	



	public function forgot_password()
	{

		if(!empty($_REQUEST['email']))

		{

			$email = $_REQUEST['email'];

			$record = $this->common->getData('agent',array('email' => $email),array('single'));

			if(!empty($record)){

					$id = $record['agent_id'];

					$token = rand(111111111,999999999);

					$data['token'] = $token;

					$result = $this->common->updateData('agent',$data,array('agent_id' => $id));

					

				$redirect_url = "ForgerPassword/passwordAgentChange?token=".$token."&agent_id=".$id;



				$redirect_url = base_url($redirect_url);

					$template = $this->load->view('template/forgot_password',array('redirect_url' => $redirect_url),true);

					

					$headers = "MIME-Version: 1.0" . "\r\n";

					$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

					// More headers

					$headers .= 'From: <info@creativethoughtsinfo.com>' . "\r\n";

					mail_smtp($_POST['email'],'Forgot Password',$template);

					$this->response(true,'Verification link sent to your email');

			}

			else

			{

				$this->response(false,'Invalid email Id');

			}

		}

		else

		{

			$this->response(false,'Missing parameter');

		}

	}


	

	public function country_list()
	{
		
        $result = $this->common->getData('countries');
        
        if(!empty($result))
        {
			$this->response(true,"Country fetch Successfully.",array("country_list" => $result));			
		}else{
			$this->response(false,"Country not found",array("country_list" => array()));
		}

	}



	public function getAgentByEmail()
	{
		
        $result = $this->common->getData('agent',array('email' => $_REQUEST['email']), array('single'));

        
        if(!empty($result))
        {
			$this->response(true,"agent fetch Successfully.",array("agentInfo" => $result));			
		}else{
			$this->response(false,"agent not found",array("agentInfo" => array()));
		}

	}



	public function countryData_list()
	{
		
        $result = $this->common->getData('country');
        
        if(!empty($result))
        {
			$this->response(true,"Country fetch Successfully.",array("country_list" => $result));			
		}else{
			$this->response(false,"Country not found",array("country_list" => array()));
		}

	}



	public function state_list()
	{
		if(!empty($_REQUEST['country_id']))
		{
		
	        $result = $this->common->getData('states',array('country_id'=>$_REQUEST['country_id']));

	        
	        if(!empty($result))
	        {
	        	foreach($result as $value)
	       		{
	       			$state_list[]=array('id'=>$value['id'],'name'=>$value['name']);
				}
				$this->response(true,"State fetch Successfully.",array("state_list" => $state_list));			
			}else{
				$this->response(false,"State not found",array("state_list" => array()));
			}
		}
		else
		{
			$this->response(false,"Missing Parameter.");
		}

	}


	public function city_list()
	{
		if(!empty($_REQUEST['country_id']))
		{
		
	        $result = $this->common->getData('cities',array('country_id'=>$_REQUEST['country_id']));
	        
	        
	        if(!empty($result))
	        {
	        	foreach($result as $value)
	       		{
	       			$cities_list[]=array('id'=>$value['id'],'name'=>$value['name']);
				}
				$this->response(true,"Cities fetch Successfully.",array("cities_list" => $cities_list));			
			}else{
				$this->response(false,"Cities not found",array("cite_list" => array()));
			}
		}
		else
		{
			$this->response(false,"Missing Parameter.");
		}

	}


	public function login()
	{				
		$_REQUEST['password'] = md5($_REQUEST['password']);
		$result = $this->common->getData('agent',array('email' => $_REQUEST['email'], 'password' => $_REQUEST['password']),array('single'));

	
		if($result){

			if($result['status'] == 2) {
				$message = "Admin blocked you please contact admin";			
				$this->response(false,$message);
				die();
			}

			if(isset($_REQUEST['deviceToken']))
			{
				$old_device = $this->common->getData('agent',array('deviceToken' => $_REQUEST['deviceToken']),array('single','field'=>'agent_id'));	
			}

			if($old_device)
			{
				$this->common->updateData('agent',array('deviceToken' => ""),array('agent_id' => $old_device['agent_id']));
			}

			$this->common->updateData('agent',array('deviceToken' =>$_REQUEST['deviceToken']), array('agent_id' => $result['agent_id']));		
			
			$token = AUTHORIZATION::generateToken(['agent_id' => $result["agent_id"],'email' => $result["email"],'phone_number' => $result["phone_number"]]);

			
			$this->response(true,'Successfully Login',array("agent_id" => $result["agent_id"],"email" => $result["email"],"phone_number" => $result["phone_number"],"token"=>$token,"expiresIn"=>3600,"mobile_verify"=>$result["mobile_verify"]));				
		}else{
			$message = "Wrong phone number or password";			
			$this->response(false,$message);
		}
	}


	


	


	public function getProfile()
	{
		$agent_id = $_REQUEST['agent_id'];
		$agentinfo = get_agent_details($agent_id);

		$escort_count = $this->agent_model->escortListAgent(array('E.agent_id' => $_REQUEST['agent_id'],'E.progress_status'=>4,'E.status'=> 1,'E.mobile_verify'=> 1),array("count"),$agentinfo['latitude'],$agentinfo['longitude']);


		$resultEscort = $this->agent_model->escortListAgent(array('E.agent_id' => $_REQUEST['agent_id'],'E.progress_status'=>4,'E.status'=> 1,'E.mobile_verify'=> 1),array(),$agentinfo['latitude'],$agentinfo['longitude']);

		$available_count = 0;

		if(!empty($resultEscort)) {
			foreach ($resultEscort as $key => $value) {
				$whereEscortAvailable ="escort_id = '".$value['escort_id']."' AND request_status IN ('1','3')";
				$resultEscortAvailable = $this->common->getData('booking',$whereEscortAvailable);

				if(empty($resultEscortAvailable)) {
					$available_count++;
				}	
			}
		}
		

		$agentinfo['available_escort_count'] = $available_count;

		$agentinfo['escort_count'] = $escort_count;
		$agentinfo['earn_amount'] = 0;

		if(!empty($agentinfo))
		{	
			$this->response(true,"Profile fetch Successfully.",array("agentinfo" => $agentinfo));
		}
		else
		{
			$this->response(false,"There is a problem, please try again.",array("agentinfo" => array()));
		}			
	}


	public function get_terms_condition()
	{	
		$result = $this->common->getData('terms_condition_tbl',"",array('single','field'=>'info'));
		$this->response(true,"Terms and condition fetch successfully.",array("result" => $result));		
	}

	public function get_privacy_policy()
	{	
		$result = $this->common->getData('privacy_policy_tbl',"",array('single','field'=>'info'));
		$this->response(true,"Privacy Policy fetch successfully.",array("result" => $result));		
	}


	public function get_faq()
	{	
		$result = $this->common->getData('faq_tbl',"",array('single','field'=>'info'));
		$this->response(true,"FAQ fetch successfully.",array("result" => $result));		
	}




	public function getGenralProfile()
	{
		$agentinfo = $this->common->getData('agent',array('agent_id'=>$_REQUEST['agent_id']),array('single'));

		if(!empty($agentinfo))
		{		

			$arr_service=(explode(",",$agentinfo['service']));
			$agentinfo['service'] = $arr_service;


			if(!empty($agentinfo["profile_image"]))
			{
				$agentinfo["profile_image"] = base_url($agentinfo["profile_image"]);
			} else {
				$agentinfo["profile_image"] = base_url($agentinfo["profile_image"]);
			}

			if(!empty($agentinfo["image1"])) {
				$agentinfo["image1"] = base_url($agentinfo["image1"]);
			} else {
				$agentinfo["image1"] = base_url($agentinfo["profile_image"]);
			}


			if(!empty($agentinfo["image2"])) {
				$agentinfo["image2"] = base_url($agentinfo["image2"]);
			} else {
				$agentinfo["image2"] = base_url($agentinfo["profile_image"]);
			}


			if(!empty($agentinfo["image3"])){
				$agentinfo["image3"] = base_url($agentinfo["image3"]);
			} else {
				$agentinfo["image2"] = base_url($agentinfo["profile_image"]);
			}

			if(!empty($agentinfo["image4"])) {
				$agentinfo["image4"] = base_url($agentinfo["image4"]);
			} else {
				$agentinfo["image4"] = base_url($agentinfo["profile_image"]);
			}

			if(!empty($agentinfo["image5"])) {
				$agentinfo["image5"] = base_url($agentinfo["image5"]);
			} else {
				$agentinfo["image5"] = base_url($agentinfo["profile_image"]);
			}

			if(!empty($agentinfo["image6"])) {
				$agentinfo["image6"] = base_url($agentinfo["image6"]);
			} else {
				$agentinfo["image6"] = base_url($agentinfo["profile_image"]);
			}


			$addtional_service_result = $this->agent_model->agent_addtional_service(array('EA.agent_id' => $_REQUEST['agent_id']));

			foreach ($addtional_service_result as $key => $value) {
				$agentinfo['addtional_service'][] = array('additional_service_id' => $value['service_id'],'info' => $value['price_id']);
			}

			

			$rate_result = $this->agent_model->agent_rate(array('ER.agent_id' => $_REQUEST['agent_id']));

			foreach ($rate_result as $key => $value) {
				$agentinfo['rate'][] = array('hour' => $value['hour'],'shot' => $value['shot'],'price' => $value['price_id']);
			}


			
		
			$this->response(true,"Profile fetch Successfully.",array("agentinfo" => $agentinfo));
		}
		else
		{
			$this->response(false,"There is a problem, please try again.",array("agentinfo" => array()));
		}			
	}



	


	public function change_password()
	{
		if(!empty($_REQUEST['agent_id']) && !empty($_REQUEST['old_password']) && !empty($_REQUEST['new_password']))
		{
			$agent_id = $_REQUEST['agent_id'];
			$old_password = $_REQUEST['old_password'];
			$new_password = $_REQUEST['new_password'];
			$agent_info = $this->common->getData('agent',array('agent_id' => $agent_id),array('single'));
			$old_agent_password = $agent_info['password'];
			$old_password = md5($old_password);
			if ($old_password == $old_agent_password) 
			{
				$data['password'] = md5($new_password);
				$result = $this->common->updateData('agent',$data,array('agent_id' => $agent_id));
				$this->response(true,'Password changed successfully');
			} 
			else 
			{
				$this->response(false,'Invalid old password');
				exit();
			}
		}
		else
		{
			$this->response(false,'Missing parameter');
		}
	}


	

	public function reset_passowrd()
	{
		if(!empty($_REQUEST['reset_code']) && !empty($_REQUEST['new_password']))
		{
			$where = "reset_code = '". $_REQUEST['reset_code'] ."'";
			$result = $this->common->getData('agent',$where,array('single'));

			if(!empty($result))
			{
				$this->common->updateData('agent',array('reset_code'=>''),array('agent_id' => $result['agent_id']));

				$data['password'] = md5($_REQUEST['new_password']);
				$result = $this->common->updateData('agent',$data,array('agent_id' => $result['agent_id']));
				$this->response(true,'Password changed successfully');
			}
			else
			{
				$this->response(false,"Invalid code");
			}
		}
		else
		{
			$this->response(false,'Missing parameter');
		}
	}


	public function logout()
	{
		if(!empty($_REQUEST['agent_id']))
		{	
			$agent_id = $_REQUEST['agent_id'];
			$this->common->updateData('agent',array('deviceToken' => ""),array('agent_id' => $agent_id));	
			$this->response(true,"Logout successfully");
		}
		else
		{
			$this->response(false,"Missing Parameter.");
		}	
	}

	
}
?>