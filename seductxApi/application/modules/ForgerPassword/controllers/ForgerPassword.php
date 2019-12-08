<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Kolkata");
error_reporting(0);


class ForgerPassword extends Base_Controller {

	public function __construct()
	{
		parent:: __construct();
		$this->load->helper('common');
		$this->load->library('email');
	}


public function passwordChange()
	{	
		$where="token ='".$_REQUEST['token']."' AND user_id = '".$_REQUEST['user_id']."'";
		$userinfo_info = $this->common->getData('user',$where);

		if(!empty($userinfo_info))
		{
			$this->common->updateData('user',array('token' => ""),array('user_id' => $_REQUEST['user_id']));
			$data['token'] = $_REQUEST['token'];
			$data['user_id'] = $_REQUEST['user_id'];
			$this->load->view('template/change_password',$data);
		}
		else
		{
			$this->load->view('template/link_expired');
		}
	
	}

	public function passwordEscortChange()
	{	
		$where="token ='".$_REQUEST['token']."' AND escort_id = '".$_REQUEST['escort_id']."'";
		$escortinfo_info = $this->common->getData('escort',$where);

		if(!empty($escortinfo_info))
		{
			$this->common->updateData('escort',array('token' => ""),array('escort_id' => $_REQUEST['escort_id']));
			$data['token'] = $_REQUEST['token'];
			$data['escort_id'] = $_REQUEST['escort_id'];
			$this->load->view('template/change_escort_password',$data);
		}
		else
		{
			$this->load->view('template/link_expired');
		}
	
	}


	public function passwordAgentChange()
	{	
		$where="token ='".$_REQUEST['token']."' AND agent_id = '".$_REQUEST['agent_id']."'";
		$agentinfo_info = $this->common->getData('agent',$where);

		if(!empty($agentinfo_info))
		{
			$this->common->updateData('agent',array('token' => ""),array('agent_id' => $_REQUEST['agent_id']));
			$data['token'] = $_REQUEST['token'];
			$data['agent_id'] = $_REQUEST['agent_id'];
			$this->load->view('template/change_agent_password',$data);
		}
		else
		{
			$this->load->view('template/link_expired');
		}
	
	}

	public function updatePassword()
	{	
		$data = $this->input->post();

		$password = md5($this->input->post('password'));
		$user_id = $this->input->post('user_id');
		$this->common->updateData('user',array('password' => $password),array('user_id' => $user_id));
		$this->load->view('template/change_password_success',$data);
	}


	public function updateEscortPassword()
	{	
		$data = $this->input->post();

		$password = md5($this->input->post('password'));
		$escort_id = $this->input->post('escort_id');
		$this->common->updateData('escort',array('password' => $password),array('escort_id' => $escort_id));
		
		$this->load->view('template/change_password_escort_success',$data);
	}


	public function updateAgentPassword()
	{	
		$data = $this->input->post();

		$password = md5($this->input->post('password'));
		$agent_id = $this->input->post('agent_id');
		$this->common->updateData('agent',array('password' => $password),array('agent_id' => $agent_id));
		
		$this->load->view('template/change_password_agent_success',$data);
	}


}	
