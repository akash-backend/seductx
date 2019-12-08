<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Kolkata");
class chat extends Base_Controller {
	
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

	
	public function chatAdd()
    {
        if(!empty($_REQUEST['userFrom']) && !empty($_REQUEST['userTo']) && !empty($_REQUEST['message']) && !empty($_REQUEST['sendForm']))
        { 
            $_REQUEST['created_at'] = date('Y-m-d H:i:s');

            $post = $this->common->getField('chat',$_REQUEST); 
			$result = $this->common->insertData('chat',$post);
            $insert_id = $this->db->insert_id();

            if($result)
            {
                $this->response(true,"message sent successfully");  
            }
	        else
	        {
	            $this->response(false,"message sent successfully");  
	        }      
        }
        else
        {
            $this->response(false,'Missing Parameter');
        }

    }
	


	public function chatHistory()
	{
		$where = '(userFrom = '.$_POST['id'].' AND userTo = '.$_POST['uid'].') OR (userFrom = '.$_POST['uid'].' AND userTo = '.$_POST['id'].')';
		
		$result = $this->common->getData('chat',$where,array('field' => 'userFrom,userTo,message,sendForm'));

		if(!empty($result))
		{
			$this->response(true,'data fetch successfully',array("cahatInfo" => $result));		
		}
		else
		{
			$this->response(true,'data not found',array("cahatInfo" => $result));		
		}	 
	}
	
	
	
}
?>