<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Kolkata");
class adminApi extends Base_Controller {
	
	public function __construct()
	{
		parent:: __construct();
		// $this->checkAuth();		
		$this->load->helper(
        	array('common')
		);
		$this->load->library('email');
		$this->load->model("escort_model");
		header('Access-Control-Allow-Origin: *');
		header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
		header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Request-With');
		header('Access-Control-Allow-Credentials: true');
	}	
	

	public function login()
	{				
		$_REQUEST['password'] = md5($_REQUEST['password']);
		$result = $this->common->getData('admin',array('email' => $_REQUEST['email'], 'password' => $_REQUEST['password']),array('single'));

	
		if($result){

			

			$this->common->updateData('escort',array('deviceToken' =>$_REQUEST['deviceToken']), array('escort_id' => $result['escort_id']));		
			
			$token = AUTHORIZATION::generateToken(['escort_id' => $result["escort_id"],'email' => $result["email"],'phone_number' => $result["phone_number"]]);

			if(!empty($result["profile_image"])) {
				$result["profile_image"] = base_url($result["profile_image"]);
			} else {
				$result["profile_image"] = base_url($result["profile_image"]);
			}
			
			$this->response(true,'Successfully Login',array("escort_id" => $result["escort_id"],"email" => $result["email"],"profile_image" => $result["profile_image"],"phone_number" => $result["phone_number"],"token"=>$token,"expiresIn"=>3600,"progress_status"=>$result["progress_status"],"mobile_verify"=>$result["mobile_verify"]));				
		}else{
			$message = "Wrong phone number or password";			
			$this->response(false,$message);
		}
	}


	function onlineUserSendNotification($escort_id)
	{
	   $followUserResult = $this->common->getData('escort_follow',array('escort_id'=>$escort_id));

	
	   if(!empty($followUserResult)) {
	   	foreach ($followUserResult as $key => $value) {
	   		$this->send_nodtificationWhenOnline($escort_id,$value['user_id'],"has been online now",4,'Escort Online');
	   	}
	   }
	}


	public function send_nodtificationWhenOnline($send_form,$send_to,$message,$type,$title) {

		$sendToResult = $this->common->getData('user',array('user_id'=>$send_to),array('single'));

		$sendFormResult = $this->common->getData('escort',array('escort_id'=>$send_form),array('single'));


		$message_push = $sendFormResult['first_name'].' '.$sendFormResult['last_name'].' '.$message;
		$msg_notification = array(
						"body" => $message_push,
						"title"=>$title
						);

		if(!empty($sendToResult['deviceToken'])) {
		
			send_notification($sendToResult['deviceToken'],$msg_notification);
		}
		
		$today = Date('Y-m-d H:i:s'); 
		$insert_notification = $this->common->insertData('notification_tbl',array('send_form' => $send_form,'send_to'=>$send_to,'message' => $message,'date'=>$today,'type'=>$type));
	}


	public function updateProfile()
	{
		$escort_id = $_REQUEST['escort_id']; unset($_REQUEST['escort_id']);

		if(!empty($_REQUEST['additionalService'])) {
			$this->addAdditionalService(json_decode($_REQUEST['additionalService']),$escort_id);
		}

		if(!empty($_REQUEST['online_status'])) {

			if($_REQUEST['online_status'] == 1) {
				$this->onlineUserSendNotification($escort_id);			   
			}
		}

		if(!empty($_REQUEST['rates'])) {
			
			$this->addRates(json_decode($_REQUEST['rates']),$escort_id);
		}
		
		
		
		if(!empty($_FILES['profile_image']['name']))
		{
			$image = $this->common->do_upload('profile_image','./assets/escortfile/profile/');
			$_REQUEST['profile_image'] = 'assets/escortfile/profile/'.$image['upload_data']['file_name'];
		} else {
			unset($_REQUEST['profile_image']);
		}


		if(!empty($_FILES['image1']['name']))
		{
			$image1 = $this->common->do_upload('image1','./assets/escortfile/image/');
			$_REQUEST['image1'] = 'assets/escortfile/image/'.$image1['upload_data']['file_name'];
		} else {
			unset($_REQUEST['image1']);
		}

		if(!empty($_FILES['image2']['name']))
		{
			$image2 = $this->common->do_upload('image2','./assets/escortfile/image/');
			$_REQUEST['image2'] = 'assets/escortfile/image/'.$image2['upload_data']['file_name'];
		} else {
			unset($_REQUEST['image2']);
		}

		if(!empty($_FILES['image3']['name']))
		{
			$image3 = $this->common->do_upload('image3','./assets/escortfile/image/');
			$_REQUEST['image3'] = 'assets/escortfile/image/'.$image3['upload_data']['file_name'];
		} else {
			unset($_REQUEST['image3']);
		}


		if(!empty($_FILES['image4']['name']))
		{
			$image4 = $this->common->do_upload('image4','./assets/escortfile/image/');
			$_REQUEST['image4'] = 'assets/escortfile/image/'.$image4['upload_data']['file_name'];
		} else {
			unset($_REQUEST['image4']);
		}


		if(!empty($_FILES['image5']['name']))
		{
			$image5 = $this->common->do_upload('image5','./assets/escortfile/image/');
			$_REQUEST['image5'] = 'assets/escortfile/image/'.$image5['upload_data']['file_name'];
		} else {
			unset($_REQUEST['image5']);
		}

		if(!empty($_FILES['image6']['name']))
		{
			$image6 = $this->common->do_upload('image6','./assets/escortfile/image/');
			$_REQUEST['image6'] = 'assets/escortfile/image/'.$image6['upload_data']['file_name'];
		} else {
			unset($_REQUEST['image6']);
		}


		$post = $this->common->getField('escort',$_REQUEST);
		
		if(!empty($post))
		{		
			$result = $this->common->updateData('escort',$post,array('escort_id' => $escort_id));
		}
		else
		{
			$result = "";
		}
		
		if($result)
		{
			$info = get_escort_details($escort_id);
			$this->response(true,"Profile Update Successfully",array("escort_id"=>$escort_id,"escortinfo" => $info,"escort_id"=>$escort_id));
		}
		else
		{
			$this->response(false,"There is a problem, please try again.",array("escortinfo" =>(object) array()));
		}
	}


	public function addAdditionalService($additionalService,$escort_id) {
		
		$this->common->deleteData('escort_additional_service',array('escort_id' => $escort_id));
		foreach ($additionalService as $key => $value) {
			$result = $this->common->insertData('escort_additional_service',array('service_id' =>$value->additional_service_id,'price_id' =>$value->info,'escort_id' =>$escort_id));
		}

	}


	public function addRates($rates,$escort_id) {

		
		$this->common->deleteData('escort_rate',array('escort_id' => $escort_id));
		foreach ($rates as $key => $value) {
			$result = $this->common->insertData('escort_rate',array('hour' =>$value->hour,'shot' =>$value->shot,'price' =>$value->price,'escort_id' =>$escort_id));
		}

	}


	

	public function get_profile_info()
	{
		$body_type_info = $this->common->getData('body_type',array('status' => 1));
		$bust_size_info = $this->common->getData('bust_size',array('status' => 1));
		$chinese_info = $this->common->getData('chinese',array('status' => 1));
		$countries_info = $this->common->getData('country',array('status' => 1));
		$cup_size_info = $this->common->getData('cup_size',array('status' => 1));
		$gender_info = $this->common->getData('gender',array('status' => 1));
		$hip_size_info = $this->common->getData('hip_size',array('status' => 1));
		$english_info = $this->common->getData('english',array('status' => 1));
		$japanese_info = $this->common->getData('japanese',array('status' => 1));
		$korean_info = $this->common->getData('korean',array('status' => 1));
		$waise_size_info = $this->common->getData('waise_size',array('status' => 1));

		$this->response(true,"data fetch Successfully",array("body_type_info" => $body_type_info,"bust_size_info" => $bust_size_info,"chinese_info" => $chinese_info,"gender_info" => $gender_info,"hip_size_info" => $hip_size_info,"japanese_info" => $japanese_info,"korean_info" => $korean_info,"waise_size_info" => $waise_size_info,'cup_size_info'=>$cup_size_info,'english_info'=>$english_info,'countries_info'=>$countries_info));
	}

	public function get_services_info()
	{
		$service_info = $this->common->getData('services',array('status' => 1));	

		$service_array = array();
		$addition_service_array = array();

		foreach ($service_info as $key => $value) 
		{
			if($value["service_type"] == 1)
			{
				$service_array[] = $value;
			}
			else
			{
				$add_service_array[] = $value;
			}
		}



		foreach ($add_service_array as $key_add => $value_add) 
		{
			$add_service_array[$key_add]["service_addtional_info"] = $this->common->getData('service_price',array('services_id' => $value_add["services_id"]));	
		}

		$this->response(true,"data fetch Successfully",array("service_info" => $service_array,"additional_service_info" => $add_service_array));
	}


	public function get_rates_info()
	{
		$hours_info = $this->common->getData('hours',array('status' => 1));	

		foreach ($hours_info as $key => $value) {
			$hours_info[$key]["shots_info"] = $this->common->getData('shots',array('hour_id' => $value["hour_id"]));
			$hours_info[$key]["shots_price_info"] = $this->common->getData('shots_price',array('hour_id' => $value["hour_id"]));	
		}

		$this->response(true,"data fetch Successfully",array("rates_list" => $hours_info));
	}



	public function insertDocument($document,$agent_id)
	{
		$document = json_decode($document);
		
		foreach ($document as $key => $value) 
		{
			if($value->type == 1)
			{
				$post = $this->common->getField('id_card_documnet',$value);
				$post['agent_id'] = $agent_id;
				$result = $this->common->insertData('id_card_documnet',$post);
			}
			else if($value->type == 2)
			{
				$post = $this->common->getField('car_insurance_document',$value);
				$post['agent_id'] = $agent_id;
				$result = $this->common->insertData('car_insurance_document',$post);
			}
			else if($value->type == 3)
			{
				$post = $this->common->getField('driver_license_document',$value);
				$post['agent_id'] = $agent_id;
				$result = $this->common->insertData('driver_license_document',$post);
			}
			else if($value->type == 4)
			{
				$post = $this->common->getField('iban_number_document',$value);
				$post['agent_id'] = $agent_id;
				$result = $this->common->insertData('iban_number_document',$post);
			}
			
		}
			
	}


	public function getProfile()
	{
		$escort_id = $_REQUEST['escort_id'];
		$escortinfo = get_escort_full_details($escort_id);

		if(!empty($escortinfo))
		{		

			$arr_service=(explode(",",$escortinfo['service']));
			$service_string = implode("','", $arr_service);
			$where_service = "`services_id` IN ('".$service_string."')";
			$escortinfo['service'] = $this->common->getData('services',$where_service);


			if(!empty($escortinfo["profile_image"]))
			{
				$escortinfo["profile_image"] = base_url($escortinfo["profile_image"]);
			} else {
				$escortinfo["profile_image"] = base_url($escortinfo["profile_image"]);
			}

			if(!empty($escortinfo["image1"])) {
				$escortinfo["image1"] = base_url($escortinfo["image1"]);
			} else {
				$escortinfo["image1"] = base_url($escortinfo["profile_image"]);
			}


			if(!empty($escortinfo["image2"])) {
				$escortinfo["image2"] = base_url($escortinfo["image2"]);
			} else {
				$escortinfo["image2"] = base_url($escortinfo["profile_image"]);
			}


			if(!empty($escortinfo["image3"])){
				$escortinfo["image3"] = base_url($escortinfo["image3"]);
			} else {
				$escortinfo["image2"] = base_url($escortinfo["profile_image"]);
			}

			if(!empty($escortinfo["image4"])) {
				$escortinfo["image4"] = base_url($escortinfo["image4"]);
			} else {
				$escortinfo["image4"] = base_url($escortinfo["profile_image"]);
			}

			if(!empty($escortinfo["image5"])) {
				$escortinfo["image5"] = base_url($escortinfo["image5"]);
			} else {
				$escortinfo["image5"] = base_url($escortinfo["profile_image"]);
			}

			if(!empty($escortinfo["image6"])) {
				$escortinfo["image6"] = base_url($escortinfo["image6"]);
			} else {
				$escortinfo["image6"] = base_url($escortinfo["profile_image"]);
			}


			$escortinfo['addtional_service'] = $this->escort_model->escort_addtional_service(array('EA.escort_id' => $_REQUEST['escort_id']));

			$escortinfo['rate'] = $this->escort_model->escort_rate(array('ER.escort_id' => $_REQUEST['escort_id']));

		

			
		
			$this->response(true,"Profile fetch Successfully.",array("escortinfo" => $escortinfo));
		}
		else
		{
			$this->response(false,"There is a problem, please try again.",array("escortinfo" => array()));
		}			
	}




	public function getGenralProfile()
	{
		$escortinfo = $this->common->getData('escort',array('escort_id'=>$_REQUEST['escort_id']),array('single'));

		if(!empty($escortinfo))
		{		

			$arr_service=(explode(",",$escortinfo['service']));
			$escortinfo['service'] = $arr_service;


			if(!empty($escortinfo["profile_image"]))
			{
				$escortinfo["profile_image"] = base_url($escortinfo["profile_image"]);
			} else {
				$escortinfo["profile_image"] = base_url($escortinfo["profile_image"]);
			}

			if(!empty($escortinfo["image1"])) {
				$escortinfo["image1"] = base_url($escortinfo["image1"]);
			} else {
				$escortinfo["image1"] = base_url($escortinfo["profile_image"]);
			}


			if(!empty($escortinfo["image2"])) {
				$escortinfo["image2"] = base_url($escortinfo["image2"]);
			} else {
				$escortinfo["image2"] = base_url($escortinfo["profile_image"]);
			}


			if(!empty($escortinfo["image3"])){
				$escortinfo["image3"] = base_url($escortinfo["image3"]);
			} else {
				$escortinfo["image2"] = base_url($escortinfo["profile_image"]);
			}

			if(!empty($escortinfo["image4"])) {
				$escortinfo["image4"] = base_url($escortinfo["image4"]);
			} else {
				$escortinfo["image4"] = base_url($escortinfo["profile_image"]);
			}

			if(!empty($escortinfo["image5"])) {
				$escortinfo["image5"] = base_url($escortinfo["image5"]);
			} else {
				$escortinfo["image5"] = base_url($escortinfo["profile_image"]);
			}

			if(!empty($escortinfo["image6"])) {
				$escortinfo["image6"] = base_url($escortinfo["image6"]);
			} else {
				$escortinfo["image6"] = base_url($escortinfo["profile_image"]);
			}


			$addtional_service_result = $this->escort_model->escort_addtional_service(array('EA.escort_id' => $_REQUEST['escort_id']));

			foreach ($addtional_service_result as $key => $value) {
				$escortinfo['addtional_service'][] = array('additional_service_id' => $value['service_id'],'info' => $value['price_id']);
			}

			

			$rate_result = $this->escort_model->escort_rate(array('ER.escort_id' => $_REQUEST['escort_id']));

			foreach ($rate_result as $key => $value) {
				$escortinfo['rate'][] = array('hour' => $value['hour'],'shot' => $value['shot'],'price' => $value['price_id']);
			}


			
		
			$this->response(true,"Profile fetch Successfully.",array("escortinfo" => $escortinfo));
		}
		else
		{
			$this->response(false,"There is a problem, please try again.",array("escortinfo" => array()));
		}			
	}



	


	public function change_password()
	{
		if(!empty($_REQUEST['escort_id']) && !empty($_REQUEST['old_password']) && !empty($_REQUEST['new_password']))
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


	public function bookingCount()
	{ 
		$whereRequest ="B.escort_id = '".$_REQUEST['escort_id']."' AND B.request_status = 0";
        $requestCount = $this->common->bookingList($whereRequest,array("count"));

        $whereAccept ="B.escort_id = '".$_REQUEST['escort_id']."' AND B.request_status = 1";
        $acceptCount = $this->common->bookingList($whereAccept,array("count"));


         $whereOngoing ="B.escort_id = '".$_REQUEST['escort_id']."' AND B.request_status = 3";
        $ongoingCount = $this->common->bookingList($whereOngoing,array("count"));

        $whereCompleted ="B.escort_id = '".$_REQUEST['escort_id']."' AND B.request_status = 4";
        $completedCount = $this->common->bookingList($whereCompleted,array("count"));

        $this->response(true,"Booking Count fetch Successfully.",array("requestCount" => $requestCount,"acceptCount" => $acceptCount,"ongoingCount" => $ongoingCount,"completedCount" => $completedCount));
	}



	public function support()
	{
		if(!empty($_REQUEST['escort_id']) && !empty($_REQUEST['comment']) && !empty($_REQUEST['email']))
		{
			   
			   $post = $this->common->getField('support',$_REQUEST); 
				$this->common->insertData('support',$post);

				$template = $this->load->view('template/admin_message',array('comment' => $_REQUEST['comment'],'email' => $_REQUEST['email']),true);
				
				// mail_smtp('akash.ctinfotech@gmail.com','Support',$template);
				$this->response(true,'message send successfully');
			}
			else
			{
				$this->response(false,'Missing parameter');
			}
	}

	public function bookingList()
	{ 	

		if(!$_REQUEST['request_status'] == 0) {
			$this->checkTime();
		}
		$where ="B.escort_id = '".$_REQUEST['escort_id']."' AND B.request_status = '".$_REQUEST['request_status']."'";
        $result = $this->common->bookingList($where);
        $result_count = $this->common->bookingList($where,array("count"));
        
        if(!empty($result))
        {	
        	
        	foreach ($result as $key => $value) {

        		 
        		$old_date_timestamp = strtotime($value['booking_date']);
        	

        		$hourdiff = round((strtotime($value['booking_expiry_date']) - strtotime($value['booking_date']))/3600, 1);

        		$result[$key]['booking_date'] = date('D, d F h:iA', $old_date_timestamp);


				$result[$key]['booking_time_hour'] = $hourdiff;   


        		$arr_service=(explode(",",$value['services']));
				$service_string = implode("','", $arr_service);
				$where_service = "`services_id` IN ('".$service_string."')";
				$result[$key]['services'] = $this->common->getData('services',$where_service);

				$start = date_create($value['created_at']);
				$end = date_create(Date('Y-m-d H:i:s'));
				$diff=date_diff($end,$start);

				
				$end_time  = new DateTime('00:10:00');
				$start_time  = new DateTime('00:'.$diff->i.':'.$diff->s);
				$interval = $start_time->diff($end_time);
				$result[$key]['time'] = $interval->i.':'.$interval->s;
        	}

        	
	        $this->response(true,"Booking fetch Successfully.",array("request_list" => $result,"maxRequests" => $result_count));
        }
        else
        {
        	$this->response(true,"data not found.",array("request_list" => array(),"maxRequests" => 0));	
        }
	}


	function checkTime() {
		$resultData = $this->common->getData('booking',array('request_status' => 0));
		
		if(!empty($resultData)) {
			foreach ($resultData as $key => $value) {

				$start = date_create($value['created_at']);
				$end = date_create(Date('Y-m-d H:i:s'));
				$diff=date_diff($end,$start);

				
				
				if($diff->i >= 10)
				{
					$this->acceptRequestFunction($value['booking_id'],$value['user_id'],$value['escort_id'],2);
				}
			}
		}
	}



	public function acceptRequestFunction($booking_id,$user_id,$escort_id,$request_status)
	{
			$where="booking_id = '". $booking_id ."'";
			$result = $this->common->getData('booking',$where,array('single'));
			if(!empty($result))
			{
				if($result['request_status']==1 && $request_status==1)
				{
					return;
				}
				if($result['request_status']==2 && $request_status==3)
				{
					return;
				}

				if($result['request_status']==3 && $request_status==3)
				{
					return;
				}

				if($result['request_status']==4 && $request_status==4)
				{
					return;
				}


				if(!empty($request_status == 1))
				{
					$updateresult = $this->common->updateData('booking',array('request_status' => $request_status),array('booking_id' => $booking_id));

					$this->send_nodtificationAcceptReject($escort_id,$user_id,$booking_id,"has been accepted your request",$request_status,'Booking Accepted');
					return;
						
				} else if(!empty($request_status == 2)) {
					$updateresult = $this->common->updateData('booking',array('request_status' => $request_status),array('booking_id' => $booking_id));
					$this->send_nodtificationAcceptReject($escort_id,$user_id,$booking_id,"has been rejected your request",$request_status,'Booking Rejected');	
					return;
				} else if(!empty($request_status == 3)) {
					$updateresult = $this->common->updateData('booking',array('request_status' => $request_status),array('booking_id' => $booking_id));
					$this->send_nodtificationAcceptReject($escort_id,$user_id,$booking_id,"has been started your request",$request_status,'Booking Started');	
					return;
				} else if(!empty($request_status == 4)) {
					$updateresult = $this->common->updateData('booking',array('request_status' => $request_status),array('booking_id' => $booking_id));
					$this->send_nodtificationAcceptReject($escort_id,$user_id,$booking_id,"has been completed your request",$request_status,'Booking Completed');	
					return;
				}
			}
			else
			{
				return;
			}
	}



	public function accept_request()
	{
		if(!empty($_REQUEST['booking_id']) && !empty($_REQUEST['escort_id']) && !empty($_REQUEST['request_status']))
		{
			$where="booking_id = '". $_REQUEST['booking_id'] ."'";
			$result = $this->common->getData('booking',$where,array('single'));
			if(!empty($result))
			{
				if($result['request_status']==1 && $_REQUEST['request_status']==1)
				{
					$this->response(false,"Already Accepted");
					exit();
				}
				if($result['request_status']==2 && $_REQUEST['request_status']==3)
				{
					$this->response(false,"Already Rejected");
					exit();
				}

				if($result['request_status']==3 && $_REQUEST['request_status']==3)
				{
					$this->response(false,"Already Started");
					exit();
				}

				if($result['request_status']==4 && $_REQUEST['request_status']==4)
				{
					$this->response(false,"Already Completed");
					exit();
				}


				if(!empty($_REQUEST['request_status'] == 1))
				{
					$updateresult = $this->common->updateData('booking',array('request_status' => $_REQUEST['request_status']),array('booking_id' => $_REQUEST['booking_id']));

					$this->send_nodtificationAcceptReject($_REQUEST['escort_id'],$_REQUEST['user_id'],$_REQUEST['booking_id'],"has been accepted your request",$_REQUEST['request_status'],'Booking Accepted');
						$this->response(true,"Booking Accepted Successfully");
						exit();
				} else if(!empty($_REQUEST['request_status'] == 2)) {
					$updateresult = $this->common->updateData('booking',array('request_status' => $_REQUEST['request_status']),array('booking_id' => $_REQUEST['booking_id']));
					$this->send_nodtificationAcceptReject($_REQUEST['escort_id'],$_REQUEST['user_id'],$_REQUEST['booking_id'],"has been rejected your request",$_REQUEST['request_status'],'Booking Rejected');
					$this->response(true,"Booking Rejected Successfully");
						exit();		
				} else if(!empty($_REQUEST['request_status'] == 3)) {
					$updateresult = $this->common->updateData('booking',array('request_status' => $_REQUEST['request_status']),array('booking_id' => $_REQUEST['booking_id']));
					$this->send_nodtificationAcceptReject($_REQUEST['escort_id'],$_REQUEST['user_id'],$_REQUEST['booking_id'],"has been started your request",$_REQUEST['request_status'],'Booking Started');
					$this->response(true,"Booking Started Successfully");
						exit();		
				} else if(!empty($_REQUEST['request_status'] == 4)) {
					$updateresult = $this->common->updateData('booking',array('request_status' => $_REQUEST['request_status']),array('booking_id' => $_REQUEST['booking_id']));
					$this->send_nodtificationAcceptReject($_REQUEST['escort_id'],$_REQUEST['user_id'],$_REQUEST['booking_id'],"has been completed your request",$_REQUEST['request_status'],'Booking Completed');
					$this->response(true,"Booking Started Successfully");
						exit();		
				}
			}
			else
			{
				$this->response(false,"Booking not found");
				exit();
			}
		}
		else
		{
			$this->response(false,'Missing Parameter');
		}
	}


	


	public function send_nodtificationAcceptReject($send_form,$send_to,$booking_id,$message,$type,$title) {

		$sendToResult = $this->common->getData('user',array('user_id'=>$send_to),array('single'));

		$sendFormResult = $this->common->getData('escort',array('escort_id'=>$send_form),array('single'));


		$message_push = $sendFormResult['first_name'].' '.$sendFormResult['last_name'].' '.$message;
		$msg_notification = array(
						"body" => $message_push,
						"title"=>$title
						);

		if(!empty($sendToResult['deviceToken'])) {
		
			send_notification($sendToResult['deviceToken'],$msg_notification);
		}
		
		$today = Date('Y-m-d H:i:s'); 
		$insert_notification = $this->common->insertData('notification_tbl',array('send_form' => $send_form,'send_to'=>$send_to,'message' => $message,'date'=>$today,'type'=>$type,'booking_id'=>$booking_id));
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
		if(!empty($_REQUEST['escort_id']))
		{	
			$user_id = $_REQUEST['escort_id'];
			$this->common->updateData('escort',array('deviceToken' => ""),array('escort_id' => $user_id));	
			$this->response(true,"Logout successfully");
		}
		else
		{
			$this->response(false,"Missing Parameter.");
		}	
	}

	
}
?>