<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Kolkata");
class User extends Base_Controller {
	
	public function __construct()
	{
		parent:: __construct();
		// $this->checkAuth();		
		$this->load->helper(
        	array('common', 'user', 'jwt', 'authorization', 'sendnotification')
		);
		
		$this->load->library('email');
		$this->load->model("user_model");
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
			$exist = $this->common->getData('user',array('email' => $_REQUEST['email']),array('single'));

			$existPhone = $this->common->getData('user',array('phone_number' => $_REQUEST['phone_number'],'country_code' => $_REQUEST['country_code']),array('single'));
		
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
								
				
				
				$post = $this->common->getField('user',$_REQUEST); 
				$result = $this->common->insertData('user',$post);
				$user_id = $this->db->insert_id();
				
				if($result)
				{
					$countryInfo = $this->common->getData('countries',array('id' => $_REQUEST['country_code']),array('single'));
					$mobile_otp = $this->otp_verification($countryInfo['phonecode'],$_REQUEST['phone_number']);

				
					$info = get_user_details($user_id);	

					$info['mobile_otp'] = $mobile_otp;
					$info['phone_number'] = $_REQUEST['phone_number'];
					$info['country_code'] = $countryInfo['phonecode'];
					

					$this->response(true,"Your registration successfully completed.",array("userinfo" => $info));					
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


	public function checkSubscription() {
		if(!empty($_REQUEST['user_id'])) {
			$userInfo = $this->common->getData('user',array('user_id' => $_REQUEST['user_id']), array('single'));

			$created_date = date("Y-m-d", strtotime($userInfo['created_at']));
			$new_created_date = date("Y-m-d", strtotime("+3 month", strtotime($created_date)));
			$today_date = Date('Y-m-d');	
			
			if($created_date >= $today_date) {
				$this->response(true,"user in subscription.",array("subscription_status" => 1));
				die();	
			} else {
				$subscriptionInfo = $this->common->getData('subscription_user',array('user_id' => $_REQUEST['user_id']), array('single'));
				if(!empty($subscriptionInfo)) {

					if($subscriptionInfo['expiry_date'] >= $today_date) {
						$this->response(true,"user in subscription.",array("subscription_status" => 1));
						die();	
					} else {
						$this->response(false,"user not in subscription.",array("subscription_status" => 2));
						die();	
					}
				} else {
					$this->response(false,"user not in subscription.",array("subscription_status" => 2));
					die();	
				}
			}
			
		} else {
			$this->response(false,'Missing Parameter');
		}
	}



	public function follow_escort()
	{
		if(!empty($_REQUEST['user_id']) && !empty($_REQUEST['escort_id']))
		{
			$user_id = $_REQUEST['user_id'];
			$escort_id = $_REQUEST['escort_id'];
			$status = $_REQUEST['status'];
			$today = Date('Y-m-d H:i:s');
	
			if($status == 1) 
			{
				$where="user_id	='".$user_id."' AND escort_id ='".$escort_id ."'";
				$value = $this->common->getData('escort_follow',$where,array('single'));
				;
				
				if(empty($value))
				{	
					$insert = $this->common->insertData('escort_follow',array('user_id' => $user_id,'escort_id' => $escort_id,'follow_time' => $today));
					
					$this->response(true,"Follow added");
				}
				else
				{
					$this->response(true,"Follow already added");
				}
			}
			else
		    {
            	$where="user_id	='" . $user_id . "' AND escort_id ='" . $escort_id . "' ";
            	
            	$value = $this->common->deleteData('escort_follow',$where);
            	$this->response(true,"follow deleted");
		     
		    }
		}
		else
		{
			$this->response(false,"Missing Parameter.");
		}	
	}







	public function getUserByEmail()
	{
		
        $result = $this->common->getData('user',array('email' => $_REQUEST['email']), array('single'));

        
        if(!empty($result))
        {
			$this->response(true,"escort fetch Successfully.",array("userInfo" => $result));			
		}else{
			$this->response(false,"Wrong email Id",array("userInfo" => array()));
		}

	}



	public function updatePhone()
	{
		if(!empty($_REQUEST['user_id']) && !empty($_REQUEST['phone_number']) && !empty($_REQUEST['country_code'])) {

		$where ="user_id != '".$_REQUEST['user_id']."' AND phone_number = '".$_REQUEST['phone_number']."' AND country_code = '".$_REQUEST['country_code']."'";
		$result = $this->common->getData('user',$where,array('single'));
	
   
        if(empty($result)) {
        	$updateresult = $this->common->updateData('user',array('country_code' => $_REQUEST['country_code'],'phone_number' => $_REQUEST['phone_number']),array('user_id' => $_REQUEST['user_id']));

			$countryInfo = $this->common->getData('countries',array('id' => $_REQUEST['country_code']),array('single'));
        	$mobile_otp = $this->otp_verification($countryInfo['phonecode'],$_REQUEST['phone_number']);
			$this->response(true,"otp sent Successfully.",array("mobile_otp" => $mobile_otp));			
		} else {
			$this->response(false,"phone number already used by another user",array("mobile_otp" => '0'));
		}

		} else {
			$this->response(false,"Missing Parameter.");
		}
	}


	public function subscriptionPlanList() {
        $result = $this->common->getData('subscription_plan_user',array('status'=>1));
        
        if(!empty($result))
        {
			$this->response(true,"plan fetch Successfully.",array("plan_list" => $result));			
		}else{
			$this->response(false,"plan not found",array("plan_list" => array()));
		}
	}

	


	public function addRating()
	{
		if(!empty($_REQUEST['escort_id'])&& !empty($_REQUEST['user_id']))
		{		
			$where = "escort_id ='".$_REQUEST['escort_id'] ."' AND user_id ='".$_REQUEST['user_id'] ."' ";
            $result = $this->common->getData('rating_escort',$where);
            
            	if(empty($result))
            	{   
            		$_POST['created_at'] = date('Y-m-d H:i:s');
					$post = $this->common->getField('rating_escort',$_POST);
					$result_insert = $this->common->insertData('rating_escort',$post);
					$avg_rating = $this->rating_count($_REQUEST['escort_id']);
					$this->common->updateData('escort',array('avg_rating' => $avg_rating),array('escort_id' => $_REQUEST['escort_id']));
					
					$this->response(true,"Rating add Successfully.",array("rating" =>$avg_rating));
    			}
    			else
    			{
    				unset($_POST['salon_id']);
    				unset($_POST['client_id']);
    				$_POST['created_at'] = date('Y-m-d H:i:s');
    				$post = $this->common->getField('rating_escort',$_POST);
    				$where_update = "escort_id ='".$_REQUEST['escort_id']."' AND user_id ='".$_REQUEST['user_id']."' ";
    				
					$result = $this->common->updateData('rating_escort',$post,$where_update); 
					$avg_rating = $this->rating_count($_REQUEST['escort_id']);
					
					$this->common->updateData('escort',array('avg_rating' => $avg_rating),array('escort_id' => $_REQUEST['escort_id']));
					$this->response(true,"Rating Edited Successfully.",array("rating" =>$avg_rating));
				}
		}
		else
		{
			$this->response(false,"Missing Parameter.");
		}
	}


	function rating_count($escort_id)
	{
		
		$count_escort = $this->common->getData('rating_escort',array('escort_id'=>$escort_id),array('count'));
		if($count_escort)
		{
			$query="SELECT SUM(`rating`) AS rating_count FROM rating_escort  WHERE escort_id='".$escort_id."'";
			$total_rating = $this->common->query($query,array('single'));
			if(!empty($total_rating))
			{
				$total_rating_escort = $total_rating['rating_count'];
				$avg=$total_rating_escort/$count_escort;
			}
			else
			{
				$avg = 0;
			}	
		}
		else
		{
			$avg = 0;
		}
		return $avg;
	}


	


	
	public function loginUser()
	{
		$result = $this->common->getData('user_tbl',array('email' => $_REQUEST['email'],'password' => $_REQUEST['password']),array('single'));
		if($result){
			$token = AUTHORIZATION::generateToken(['user_id' => $result["id"],'email' => $result["email"],'phone_number' => $result["phone_number"]]);
			
			$this->response(true,'Successfully Login',array("user_id" => $result["id"],"email" => $result["email"],"phone_number" => $result["phone_number"],"token"=>$token,"expiresIn"=>3600));	
		}
		else
		{
			$this->response(false,$message,array("userinfo" => (object) array()));
		}
	}

	public function login()
	{				
		$_REQUEST['password'] = md5($_REQUEST['password']);
		$result = $this->common->getData('user',array('email' => $_REQUEST['email'], 'password' => $_REQUEST['password']),array('single'));
	
		if($result){


			if($result['status'] == 2) {
				$message = "Admin blocked you please contact admin";			
				$this->response(false,$message);
				die();
			}

			if(isset($_REQUEST['deviceToken']))
			{
				$old_device = $this->common->getData('user',array('deviceToken' => $_REQUEST['deviceToken']),array('single','field'=>'user_id'));	
			}

			if($old_device)
			{
				$this->common->updateData('user',array('deviceToken' => ""),array('user_id' => $old_device['user_id']));
			}

			$this->common->updateData('user',array('deviceToken' =>$_REQUEST['deviceToken']), array('user_id' => $result['user_id']));		
			
			
			$token = AUTHORIZATION::generateToken(['user_id' => $result["user_id"],'email' => $result["email"],'phone_number' => $result["phone_number"]]);
			
			$this->response(true,'Successfully Login',array("user_id" => $result["user_id"],"email" => $result["email"],"phone_number" => $result["phone_number"],"token"=>$token,"expiresIn"=>3600,"mobile_verify" => $result['mobile_verify']));				
		}else{
			$message = "Wrong phone number or password";			
			$this->response(false,$message);
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


	

	public function updateProfile()
	{
		chmod('./assets/userfile/profile/',0777);
		
		$user_id = $_REQUEST['user_id']; unset($_REQUEST['user_id']);
		
		if(!empty($_FILES['profile_image']))
		{
			$image = $this->common->do_upload('profile_image','./assets/userfile/profile/');
			$_REQUEST['profile_image'] = 'assets/userfile/profile/'.$image['upload_data']['file_name'];
			$old_image = $this->common->getData('user',array('user_id'=>$user_id),array('single','field'=>'profile_image'));
		
			if(!empty($old_image['profile_image']))
			{
				if(file_exists('./assets/userfile/profile/'.$old_image['profile_image']))
				{ 
					unlink('./assets/userfile/profile/'.$old_image['profile_image']);
				}
			}
		}

		$post = $this->common->getField('user',$_REQUEST);
		
		if(!empty($post))
		{		
			$result = $this->common->updateData('user',$post,array('user_id' => $user_id));
		}
		else
		{
			$result = "";
		}
		
		if($result)
		{
			$info = get_user_details($user_id);
			$this->response(true,"Profile Update Successfully",array("userinfo" => $info));
		}
		else
		{
			$this->response(false,"There is a problem, please try again.",array("userinfo" =>(object) array()));
		}
	}


	public function updateBooking()
	{
		$booking_id = $_REQUEST['booking_id']; unset($_REQUEST['booking_id']);
		
		$post = $this->common->getField('booking',$_REQUEST);
		
		if(!empty($post))
		{		
			$result = $this->common->updateData('booking',$post,array('booking_id' => $booking_id));
		}
		else
		{
			$result = "";
		}
		
		if($result)
		{
			$this->response(true,"Profile Update Successfully");
		}
		else
		{
			$this->response(false,"There is a problem, please try again.");
		}
	}



	public function getProfile()
	{
		$user_id = $_REQUEST['user_id'];
		$userinfo = get_user_details($user_id);

		if(!empty($userinfo))
		{	
			$this->response(true,"Profile fetch Successfully.",array("userinfo" => $userinfo));
		}
		else
		{
			$this->response(false,"There is a problem, please try again.",array("userinfo" => array()));
		}			
	}





	public function change_password()
	{
		if(!empty($_REQUEST['user_id']) && !empty($_REQUEST['old_password']) && !empty($_REQUEST['new_password']))
		{
			$user_id = $_REQUEST['user_id'];
			$old_password = $_REQUEST['old_password'];
			$new_password = $_REQUEST['new_password'];
			$user_info = $this->common->getData('user',array('user_id' => $user_id),array('single'));
			$old_user_password = $user_info['password'];
			$old_password = md5($old_password);
			if ($old_password == $old_user_password) 
			{
				$data['password'] = md5($new_password);
				$result = $this->common->updateData('user',$data,array('user_id' => $user_id));
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


	function otp_verification($country_code, $phone_number)
	{
			$mobile_otp =(rand(100000,999999));
			$message = $mobile_otp." is your seductx user verification code";
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


	public function forgot_password()
	{
		if(!empty($_REQUEST['email']))
		{
			$email = $_REQUEST['email'];
			$record = $this->common->getData('user',array('email' => $email),array('single'));
			if(!empty($record)){
					$id = $record['user_id'];
					$token = rand(111111111,999999999);
					$data['token'] = $token;
					$result = $this->common->updateData('user',$data,array('user_id' => $id));
					
				$redirect_url = "ForgerPassword/passwordChange?token=".$token."&user_id=".$id;
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


	public function reset_passowrd()
	{
		if(!empty($_REQUEST['reset_code']) && !empty($_REQUEST['new_password']))
		{
			$where = "reset_code = '". $_REQUEST['reset_code'] ."'";
			$result = $this->common->getData('user',$where,array('single'));

			if(!empty($result))
			{
				$this->common->updateData('user',array('reset_code'=>''),array('user_id' => $result['user_id']));

				$data['password'] = md5($_REQUEST['new_password']);
				$result = $this->common->updateData('user',$data,array('user_id' => $result['user_id']));
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
		if(!empty($_REQUEST['user_id']))
		{	
			$user_id = $_REQUEST['user_id'];
			$this->common->updateData('user',array('deviceToken' => ""),array('user_id' => $user_id));	
			$this->response(true,"Logout successfully");
		}
		else
		{
			$this->response(false,"Missing Parameter.");
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


	public function escort_list()
	{ 	

		$userInfo = $this->common->getData('user', array('user_id' => $_REQUEST['user_id']), array('single'));

		$hourInfo = $this->common->getData('hours', array('hour_time' => $_REQUEST['hour']), array('single'));

        $result = $this->common->escortList(array('E.status'=> 1,'E.progress_status'=> 4,'E.mobile_verify'=> 1),array(),$userInfo['latitude'],$userInfo['longitude'],$hourInfo['hour_id']);


         


       	$result_count = $this->common->escortList("",array("count"),$userInfo['latitude'],$userInfo['longitude']);

     	
        if(!empty($result))
        {
        	foreach ($result as $key => $value) 
	        {
	        	
	       		$request_status = $this->checkBookOrNotFunction($value['escort_id'],$_REQUEST['searchTime']);
	       		$result[$key]["request_status"] = $request_status;
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


				$rateResult = $this->escort_model->escort_rate(array('ER.escort_id'=>$value['escort_id'],'H.hour_time'=>$_REQUEST['hour']),array('single'));

				$result[$key]["hour_time"] = $rateResult['hour_time'];
				$result[$key]["amount"] = $rateResult['amount'];
	        }


	        $this->response(true,"Escort fetch Successfully.",array("escort_list" => $result,"maxEscorts" => $result_count));
        }
        else
        {
        	$this->response(false,"data not found.",array("escort_list" => array()));	
        }
	}


	function checkBookOrNotFunction($escort_id, $searchTime) {
		
		$where_booking = 'UNIX_TIMESTAMP(booking_date) <= '.strtotime($searchTime).' AND UNIX_TIMESTAMP(booking_end_date) >= '.strtotime($searchTime).' AND request_status!=2 AND request_status!=4 AND escort_id ='.$escort_id;

        $bookingResult = $this->common->getData('booking',$where_booking);
		

		
		if(!empty($bookingResult)) {
				// 1 -> already booking , 2 - not booking
				$booking_status = 1;
				return $booking_status;
			} else {
				$booking_status = 2;
				return $booking_status;
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


	public function bookingAdd()
    {
        if(!empty($_REQUEST['user_id']) && !empty($_REQUEST['escort_id']) && !empty($_REQUEST['rate_id']))
        { 
            $_REQUEST['created_at'] = date('Y-m-d H:i:s');

            // rate data set
            $rateData = $this->common->getData('escort_rate',array('escort_rate_id' => $_REQUEST['rate_id']),array('single'));
            $_REQUEST['hour'] = $rateData['hour'];
            $_REQUEST['shot'] = $rateData['shot'];
            $_REQUEST['price'] = $rateData['price'];


            // service set data set
            $escortData = $this->common->getData('escort',array('escort_id' => $_REQUEST['escort_id']),array('single'));
           	$_REQUEST['services'] = $escortData['service'];

			$hourData = $this->common->getData('hours',array('hour_id' => $_REQUEST['hour']),array('single'));

			$booking_date = date("Y-m-d H:i:s", strtotime($_REQUEST['booking_date']));

			// booking end date set
			$datetime = new DateTime($booking_date);
			$datetime->modify("+".$hourData['hour_time']." hours");
			$_REQUEST['booking_end_date'] = $datetime->format('Y-m-d H:i:s');

			// booking expiry date set
			$expiryHourDate = $hourData['hour_time']+1;
			$datetimeExpiry = new DateTime($booking_date);
			$datetimeExpiry->modify("+".$expiryHourDate." hours");
			$_REQUEST['booking_expiry_date'] = $datetimeExpiry->format('Y-m-d H:i:s');
			
            $post = $this->common->getField('booking',$_REQUEST); 
			$result = $this->common->insertData('booking',$post);
            $insert_id = $this->db->insert_id();

            if($result)
            {

            	$this->send_nodtificationAcceptReject($_REQUEST['user_id'],$_REQUEST['escort_id'],$insert_id,"you have a new booking request :",'3','Booking Request');
                $this->response(true,"booking Added successfully");  
            }
	        else
	        {
	            $this->response(false,"There is a problem, please try again.");
	        }      
        }
        else
        {
            $this->response(false,'Missing Parameter');
        }
    }


    public function addFavourite()
	{
		if(!empty($_REQUEST['user_id']) && !empty($_REQUEST['escort_id'])) {
			if ($_REQUEST['status'] == 1) {
				
				$where="user_id	='".$_REQUEST['user_id'] ."' AND escort_id ='".$_REQUEST['escort_id'] ."' ";
				$result = $this->common->getData('favourite',$where,array('single'));
				
				if(empty($result)) {	
					$insert = $this->common->insertData('favourite',array('user_id' => $_REQUEST['user_id'],'escort_id' => $_REQUEST['escort_id'],'created_at' => Date('Y-m-d H:i:s')));
						$this->response(true,"add Favourite successfully");
				} else {
					$this->response(false,"Favourite already added");
				}
			} else {                   
            	$where="user_id	='".$_REQUEST['user_id']."' AND escort_id ='".$_REQUEST['escort_id']."' ";
            	$value = $this->common->deleteData('favourite',$where);
            	$this->response(true,"Unfavourite successfully");
            }
		} else {
			$this->response(false,"Missing Parameter.");
		}	
	}


	



    public function send_nodtificationAcceptReject($send_form,$send_to,$booking_id,$message,$type,$title) {

		$sendToResult = $this->common->getData('escort',array('escort_id'=>$send_to),array('single'));

		

		$sendFormResult = $this->common->getData('user',array('user_id'=>$send_form),array('single'));


		$message_push = $message.' '.$sendFormResult['first_name'].' '.$sendFormResult['last_name'];
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



    public function bookingList()
	{ 	
		$where ="B.user_id = '".$_REQUEST['user_id']."' AND B.user_booking_status=1";
        $result = $this->common->bookingList($where);
        $result_count = $this->common->bookingList($where,array("count"));
        
        if(!empty($result))
        {	
        	
        	foreach ($result as $key => $value) {

        		 
        		$old_date_timestamp = strtotime($value['booking_date']);
        	

        		$hourdiff = round((strtotime($value['booking_expiry_date']) - strtotime($value['booking_date']))/3600, 1);

        		$booking_date = date('d M Y', $old_date_timestamp);

        		$booking_time = date('h:i A', $old_date_timestamp);


        		$result[$key]['booking_date'] = $booking_date." (at ".$booking_time.")";

        	
				$result[$key]['booking_time_hour'] = $hourdiff; 

				if($result[$key]['request_status']) {
        			if($result[$key]['request_status'] == 0) {
        				$result[$key]['request_status_name'] = 'Pending';
        			} else if ($result[$key]['request_status'] == 1) {
        				$result[$key]['request_status_name'] = 'Accepted';
        			} else if ($result[$key]['request_status'] == 2) {
        				$result[$key]['request_status_name'] = 'Canceled';
        			} else if ($result[$key]['request_status'] == 3) {
        				$result[$key]['request_status_name'] = 'Started';
        			} else if ($result[$key]['request_status'] == 4) {
        				$result[$key]['request_status_name'] = 'Completed';
        			}
        		}

        		$arr_service=(explode(",",$value['services']));
				$service_string = implode("','", $arr_service);
				$where_service = "`services_id` IN ('".$service_string."')";
				$result[$key]['services'] = $this->common->getData('services',$where_service);
        	}
        
	        	
	        $this->response(true,"Booking fetch Successfully.",array("request_list" => $result,"maxRequests" => $result_count));
        }
        else
        {
        	$this->response(true,"data not found.",array("request_list" => array(),"maxRequests" => 0));	
        }
	}

}
?>