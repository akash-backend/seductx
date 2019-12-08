<?php (defined('BASEPATH')) OR exit('No direct script access allowed');
error_reporting(0);
class Base_Controller extends CI_Controller {

	public function __construct()
	{
		parent:: __construct();
		$this->authkey = 'dfs#!df154$'; 
		$this->load->helper(
        	array('common', 'user', 'jwt', 'authorization')
		);
		
	}

	public function frontHtml($title="Taxi App",$page,$data="")
	{
		$header['title'] = $title;
		//$this->load->view('header',$header);
		$this->load->view($page,$data);
		$this->adminHtml('Dashboard','admin/dashboard',$data);
		//$this->load->view('footer');
	}

	public function adminHtml($title="Sports App",$page,$data="")
	{
		$header['title'] = $title;
		$this->load->view('admin_header',$header);
		$this->load->view('sidebar');
		$this->load->view($page,$data);
		$this->load->view('admin_footer');
	}

	public function superHtml($title="Taxi App",$page,$data="")
	{
		$header['title'] = $title;
		$this->load->view('admin_header',$header);
		$this->load->view('super-sidebar');
		$this->load->view($page,$data);
		$this->load->view('admin_footer');
	}

	public function getServiceDetail($service_id)
	{
		$service_info = $this->common->getData('service_tbl',array('service_id' => $service_id),array('single'));
		$service_image_array = $this->common->getData('service_image_tbl',array('service_id' => $service_id));
		$offer_array = $this->common->getData('offer_tbl',array('service_id' => $service_id));
		if(empty($offer_array))
		{
			$offer_array = array();
		}
		if(!empty($service_image_array))
		{
			foreach ($service_image_array as $key => $value) 
			{
				$service_image_array[$key]['service_image'] =  base_url($value['service_image']);
			}
		}
		else
		{
			$service_image_array =  array();
		}
		
		$service_info['service_image'] = $service_image_array;
		$service_info['offer'] = $offer_array;
		return $service_info;
	}


	public function checkAuth()
	{
		foreach($_SERVER as $key => $value) {
	        if (substr($key, 0, 5) <> 'HTTP_') {
	            continue;
	        }
	        $header = str_replace(' ', '-', ucwords(str_replace('_', ' ', strtolower(substr($key, 5)))));
	        $headers[$header] = $value;
	    }
	    
	    if($headers['Authorization'] == ""){	
			$response['message'] = "Auth key required";
			echo json_encode($response); exit;
		} 
		
		try {
			// Validate the token
			// Successfull validation will return the decoded user data else returns false
			$data = AUTHORIZATION::validateToken($headers['Authorization']);
			if ($data === false) {
				$response['message'] = "Unauthorized Access!";
				echo json_encode($response); exit;
			} else {
				
				echo"<pre>";
				print_r($data);
				die();
			}
		} catch (Exception $e) {
			$response['message'] = "Auth key required";
			echo json_encode($response); exit;
		}
	}


	public function block($table,$id,$url1='',$url2='',$url3='')
	{	
		$user = $this->common->getData($table,array('id'=> $id),array('field'=> 'status','single'));
		$status = 0;
		if($user['status'] == 0 ){ 
			$status = 1;
		}
		$result = $this->common->updateData($table,array('status' => $status),array('id' => $id));
		
		if($result){
			if($status == 0){
				$message = $table.' unblocked successfully';
			}else{
				$message = $table.' blocked successfully';
			}
			$this->flashMsg('success',$message);
		}else{
			$this->flashMsg('danger','Some Error occured.');
		} 
		redirect(base_url($url1.'/'.$url2.'/'.$url3));
	}


	public function generateToken()
	{
		$seed = str_split('abcdefghijklmnopqrstuvwxyz'
                 .'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                 .'0123456789'); // and any other characters
		shuffle($seed); // probably optional since array_is randomized;
		$rand = '';
		foreach (array_rand($seed, 8) as $k){
			$rand .= $seed[$k];	
		} 
		return md5(microtime().$rand);
	}


	public function generateCode($length=8)
	{
		if (function_exists("random_bytes")) {
	        $bytes = random_bytes(ceil($lenght / 2));
	    } elseif (function_exists("openssl_random_pseudo_bytes")) {
	        $bytes = openssl_random_pseudo_bytes(ceil($length / 2));
	    } else {
	        throw new Exception("no cryptographically secure random function available");
	    }
	    echo substr(bin2hex($bytes), 0, $length);
	}


	public function flashMsg($class,$msg)
	{
		$msg1 = '<div class="alert alert-'.$class.' alert-dismissible" role="alert">'.$msg.'
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
      	<div class="clearfix"></div>';	
        $this->session->set_flashdata('msg',$msg1);   
        return true;      
	}


	public function response($status=true,$message,$other_option= array())
	{
		$response = array(
				"success" => $status ? "1" : "0",			
				"message" => $message
		    );	
		if(!empty($other_option)){
			foreach ($other_option as $key => $value) {
				$response[$key] = $value;
			}
		}
		echo json_encode($response);
	}


	public function curl($url,$headers,$fields){
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_POST, true);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0);  
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
		$result = curl_exec($ch);           
		if ($result === FALSE) {
		   die('Curl failed: ' . curl_error($ch));
		}
		curl_close($ch);
		return $result;
	}


	function Apn($deviceToken,$message){  
		$url = 'https://fcm.googleapis.com/fcm/send';
	
		$fields = array
		(
			'to'	=> $deviceToken,
			'priority' => 'high',
			'notification' => array	('body'	=> $message['message'],	'title'	=> $message['title'],		'sound' => 'chime.aiff'),
			'data'  => $message
		);
		$headers = array
		(
			'Authorization: key=' . API_ACCESS_KEY_ios,
			'Content-Type: application/json'
		);
		$this->curl($url,$headers,$fields);
	}



	public function send_notification($tokens, $message)
	{	
	
		
		$url = 'https://fcm.googleapis.com/fcm/send';
		$fields = array(
				 	'registration_ids' => $tokens,
				 	'data' => $message
				);
		$headers = array(
			'Authorization:key = AIzaSyA67OhAT0uKHIfX_18vBM-H3LTVdKXQlvc',
			'Content-Type: application/json'
		);
		$this->curl($url,$headers,$fields);
	}


	public function pagination($url,$table,$segment)
  {
    $this->load->library('pagination');
    $config = [
      'base_url'      =>  base_url($url),
      'per_page'      =>  10,
      'total_rows'    =>  $this->common->getData($table,array(),array('count')),
      'full_tag_open'   =>  "<ul class='pagination'>",
      'full_tag_close'  =>  "</ul>",
      'first_tag_open'  =>  '<li>',
      'first_tag_close' =>  '</li>',
      'last_tag_open'   =>  '<li>',
      'last_tag_close'  =>  '</li>',
      'next_tag_open'   =>  '<li>',
      'next_tag_close'  =>  '</li>',
      'prev_tag_open'   =>  '<li>',
      'prev_tag_close'  =>  '</li>',
      'num_tag_open'    =>  '<li>',
      'num_tag_close'   =>  '</li>',
      'cur_tag_open'    =>  "<li class='active'><a>",
      'cur_tag_close'   =>  '</a></li>',
    ];
    $this->pagination->initialize($config);
    $data = $this->common->getData($table,array(),array('limit' => $config['per_page'],'offset'=> $this->uri->segment($segment) ));
    return $data;
  }


  public function Apn1()
  {
  		$passphrase = '123456';
		$ctx = stream_context_create();
		stream_context_set_option($ctx, 'ssl', 'local_cert', 'apns-dev-cert.pem');
		stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);
		$fp = stream_socket_client('ssl://gateway.sandbox.push.apple.com:2195', $err, $errstr, 60, STREAM_CLIENT_CONNECT|STREAM_CLIENT_PERSISTENT, $ctx);
		
		if (!$fp)
			exit("Failed to connect: $err $errstr" . PHP_EOL);
			//echo 'Connected to APNS' . PHP_EOL;
			
		$body['aps'] = array(
				'title' => $message['title'],
				'alert' => array('body' => $message['message'],'message_body' => $message,'type' => $message['type']),
				'badge' => 1,
				'sound' => 'chime.aiff'
				); 
		
		$payload = json_encode($body);  
		$msg = chr(0) . pack('n', 32) . pack('H*', $deviceToken) . pack('n', strlen($payload)) . $payload;
		$result = fwrite($fp, $msg, strlen($msg));
		//print_r($result);
		if (!$result)
			'Message not delivered' . PHP_EOL;
		else
			'Message successfully delivered' . PHP_EOL;
		fclose($fp);
  }


   	public function vehicle_class()
	{
		$result = $this->common->getData('vehicle_class',array('status' => 0));
		if($result){
			$this->response('true',"Vehicle class fetched Successfully.",array("vehicle_class" => $result));
		}else{
			$this->response('false',"There is a problem, please try again.",array("vehicle_class" => ""));
		}
	}	
  	
  	public function imageLib($path,$target_path,$option=array())
	{
		$config['image_library'] = 'gd2';
		$config['source_image'] = $path;
		$config['new_image'] = $target_path;
		$config['create_thumb'] = TRUE;
		$config['maintain_ratio'] = TRUE;
		$config['thumb_marker'] = '_thumb';
		$config['width']         = 150;
		$config['height']       = 150;
		// echo"<pre>";
		// 	print_r($config);
		// 	die();
		
		if(!empty($option)){
			foreach ($option as $key => $value) {
				$config[$key] = $value;
			}
		}
		$this->load->library('image_lib',$config);
	}



	public function resizeImage($path,$target_path,$config=array())
	{
		$this->imageLib($path,$target_path,$config);
		$this->image_lib->resize();
		if (!$this->image_lib->resize()) 
		{
          echo $this->image_lib->display_errors();
          die();
      	}
	}



}