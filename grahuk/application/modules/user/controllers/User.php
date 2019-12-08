<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Kolkata");
class User extends Base_Controller {
	
	public function __construct()
	{
		parent:: __construct();
		$this->checkAuth();		
		$this->load->helper(
        	array('common', 'user')
		);
		$this->load->library('email');
		$this->load->model("user_model");
	}	
	
	public function signup()
	{	
		if(!empty($_REQUEST['email']))
		{
			$exist = $this->common->getData('user',array('email' => $_REQUEST['email']),array('single'));

			$existPhone = $this->common->getData('user',array('phone_number' => $_REQUEST['phone_number'],'country_code' => $_REQUEST['country_code']),array('single'));
		
			if(!empty($exist))
			{
				$response = $this->response(false,"This email already exists.",array("userinfo" => (object) array()));				
			}
			else if(!empty($existPhone))
			{
				$response = $this->response(false,"This phone number already exists.",array("userinfo" => (object) array()));
			}
			else
			{
				$iname = '';
				if(isset($_FILES['profile_image']))
				{
					$image = $this->common->do_upload('profile_image','./assets/userfile/profile/');
					if(isset($image['upload_data']))
					{
						$iname = 'assets/userfile/profile/'.$image['upload_data']['file_name'];
					}
				}

				

				$_REQUEST['profile_image'] = $iname;
				$_REQUEST['password'] = md5($_REQUEST['password']);
				$_REQUEST['created_at'] = date('Y-m-d H:i:s');
								
				$old_device = $old_ios = false;
				if(isset($_REQUEST['android_token']))
				{
					$old_device = $this->common->getData('user',array('android_token' => $_REQUEST['android_token']),array('single','field'=>'user_id'));
				}
				if(isset($_REQUEST['ios_token']))
				{
					$old_ios =  $this->common->getData('user',array('ios_token' => $_REQUEST['ios_token']),array('single','field'=>'user_id'));
				}
				
				if($old_device || $old_ios)
				{
					$this->common->updateData('user',array('android_token' => "", "ios_token" => ""),array('user_id' => $old_device['user_id']));
				}
				
				$post = $this->common->getField('user',$_REQUEST); 
				$result = $this->common->insertData('user',$post);

				if($result)
				{
					$user_id = $this->db->insert_id();
					$info = get_user_details($user_id);	
					$this->response(true,"Your registration successfully completed.",array("userinfo" => $info));					
				}
				else
				{
						$this->response(false,"There is a problem, please try again.",array("userinfo" => (object) array()));
				}
			}
		}
		else
		{
			$this->response(false,'Missing Parameter');
		}
	}



	public function login()
	{				
		$_REQUEST['password'] = md5($_REQUEST['password']);

		if(!empty($_REQUEST['phone_number']) && !empty($_REQUEST['country_code'])) {
			$result = $this->common->getData('user',array('phone_number' => $_REQUEST['phone_number'],'country_code' => $_REQUEST['country_code'], 'password' => $_REQUEST['password']),array('single'));
		} else {

			$result = $this->common->getData('user',array('email' => $_REQUEST['email'], 'password' => $_REQUEST['password']),array('single'));
		}
		
	
		
		
		if($result){
			if(isset($_REQUEST['android_token'])){
				$old_device = $this->common->getData('user',array('android_token' => $_REQUEST['android_token']),array('single','field'=>'user_id'));	
			}		
			if (isset($_REQUEST['ios_token'])) {
				$old_device = $this->common->getData('user',array('ios_token' => $_REQUEST['ios_token']),array('single','field'=>'user_id'));	
			}
			if($old_device){
				$this->common->updateData('user',array('android_token' => "", "ios_token" => ""),array('user_id' => $old_device['user_id']));
			}
			$this->common->updateData('user',array('ios_token' =>$_REQUEST['ios_token'], 'android_token' => $_REQUEST['android_token']), array('user_id' => $result['user_id']));
			
			if(!empty($_REQUEST['session_id']))
			{
				session_manage($result['user_id'],$_REQUEST['session_id']);
			}

			$user_info = get_user_details($result['user_id']);
			
			$this->response(true,'Successfully Login',array("userinfo" => $user_info));					
		}else{
			$message = "Wrong phone number or password";			
			$this->response(false,$message,array("userinfo" => (object) array()));
		}
	}



	public function social_login()
	{		
		$user = $this->common->getData('user',array('social_id' => $_POST['social_id']),array('single'));
		$url = $this->input->post('profile_image');
		$uimg = "";

		if($url != "")
		{
			$uimg = rand().time().'.png';
			file_put_contents('assets/userfile/profile/'.$uimg, file_get_contents($url));
			$_REQUEST['profile_image'] = 'assets/userfile/profile/'.$uimg;
			$uimg = 'assets/userfile/profile/'.$uimg;
		}

		if($user)
		{
			if($user['status'] == 0)
			{
				$this->response(false,'Your account are blocked by admin');
				die();
			}

			$old_device = $this->common->getData('user',array('ios_token' => $_POST['ios_token'],'android_token' => $_POST['android_token']),array('single','field'=>'user_id'));
			
			if($old_device)
			{
				$this->common->updateData('user',array('android_token' => "", "ios_token" => ""),array('user_id' => $old_device['user_id']));
			}
			
			$update = $this->common->updateData('user',array('profile_image' => $uimg, 'ios_token' =>$_POST['ios_token'], 'android_token' => $_POST['android_token']),array('user_id' => $user['user_id']));
			
			if($update)
			{				
				$user_info = get_user_details($result['user_id']);
				$this->response(true,"Login Successfully.",array("userinfo" => $user));
			}
			else
			{
				$this->response(false,"There is a problem, please try again.",array("userinfo" => ""));
			}
		}
		else
		{	
			$post = $this->common->getField('user',$_REQUEST); 
			$result = $this->common->insertData('user',$post);
			$uid  = $this->db->insert_id();
			echo $this->db->last_query();
				die();

			if($insert)
			{
				$user_info = get_user_details($result['user_id']);
				$this->response(true,'Successfully Login',array("userinfo" => $user_info));		
			}
			else 
			{
				$this->response(false,"There is a problem, please try again.",array("userinfo" => ""));
			}
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


	public function otp_verification()
	{
		$where_exist = "country_code = '".$_REQUEST['country_code']."' AND phone_number = '". $_REQUEST['phone_number'] ."'";
		$result_exist = $this->common->getData('user',$where_exist);

		if(empty($result_exist))
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


	public function forgot_passowrd()
	{
		if(!empty($_REQUEST['country_code']) && !empty($_REQUEST['phone_number']))
		{
			$where = "country_code = '".$_REQUEST['country_code']."' AND phone_number = '". $_REQUEST['phone_number'] ."'";
			$result = $this->common->getData('user',$where,array('single'));

			if(!empty($result))
			{
				$mobile_otp =(rand(1000,9999));
				$message = $mobile_otp." is your reset password code for maeda";
				$phone_number = $_REQUEST['country_code'].$_REQUEST['phone_number'];
				send_otp($phone_number,$message); 

				$this->common->updateData('user',array('reset_code'=>$mobile_otp),array('user_id' => $result['user_id']));
				
				$this->response(true,"otp send successfully",array('phone_number' => $phone_number,'mobile_otp' => $mobile_otp));
			}
			else
			{
				$this->response(false,"Invalid mobile number. Please try again.");
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
			$this->common->updateData('user',array('android_token' => "", "ios_token" => "", "session_id" => ""),array('user_id' => $user_id));	

			$info = get_user_details($user_id);
			$this->response(true,"Logout successfully",array("userinfo"=>$info));
		}
		else
		{
			$this->response(false,"Missing Parameter.");
		}	
	}
	
}
?>