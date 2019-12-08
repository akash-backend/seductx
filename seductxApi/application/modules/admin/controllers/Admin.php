<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$company = $this->session->userdata('admin');

		$this->load->helper(
        	array('common', 'escort','user','sendnotification')
		);

		$this->load->model("escort_model");
		$this->load->model("user_model");
		$this->load->model("agent_model");
	
		$this->id = $company['id'];

		$admin = $this->session->userdata('admin');
		if(empty($admin)){ 
			redirect(base_url('admin-login'));
		}

	}

	public function dashboard()
	{	
		$data['all_user'] = $this->common->getData('user','',array('count'));
		$data['all_escort'] = $this->common->getData('escort',array('progress_status'=>4),array('count'));
		$data['all_agent'] = $this->common->getData('agent','',array('count'));
		$this->adminHtml('Dashboard','admin/dashboard',$data);;
	}


	public function change_status() {
        $where_name = $this->uri->segment(3);
        $where_value = $this->uri->segment(4);
        $table = $this->uri->segment(5);
        $table_field = $this->uri->segment(6);
        $field_value = $this->uri->segment(7);
        $function = $this->uri->segment(8);

        //----------------Start Change Status--------------------//

        $where = array($where_name => $where_value);
        $data = array($table_field => $field_value);
      	$this->common->updateData($table, $data, $where);





        //----------------End Change Status--------------------//


        if ($table == "user" && $function == "userList") {
            if ($field_value == 2) {
                $message = 'user blocked successfully';
            } else if($field_value == 1) {
                $message = 'user unblocked successfully';
            }
        }

        if ($table == "escort" && $function == "escortList") {
            if ($field_value == 2) {
                $message = 'escort blocked successfully';
            } else if($field_value == 1) {
                $message = 'escort unblocked successfully';
            }
        }



        if ($table == "agent" && $function == "agentList") {
            if ($field_value == 2) {
                $message = 'agent blocked successfully';
            } else if($field_value == 1) {
                $message = 'agent unblocked successfully';
            }
        }



        if ($table == "subscription_plan_user" && $function == "userPlanList") {
            if ($field_value == 2) {
                $message = 'Subscription Plan User blocked successfully';
            } else if($field_value == 1) {
                $message = 'Subscription Plan User unblocked successfully';
            }
        }



        if ($table == "subscription_plan" && $function == "escortPlanList") {
            if ($field_value == 2) {
                $message = 'Subscription Plan Escort blocked successfully';
            } else if($field_value == 1) {
                $message = 'Subscription Plan Escort unblocked successfully';
            }
        }


        if ($table == "category_tbl" && $function == "categoryList") {
            if ($field_value == 0) {
                $message = 'Category blocked successfully';
            } else if($field_value == 1) {
                $message = 'Category unblocked successfully';
            }
        }


        if ($table == "service_tbl" && $function == "serviceList") 
        {
           	$id = $this->uri->segment(9);
           	$function =   $function."/".$id;
            if ($field_value == 0) {
                $message = 'Service blocked successfully';
            } else if($field_value == 1) {
                $message = 'Service unblocked successfully';
            }
        }


        if ($table == "barber_tbl" && $function == "barberList") 
        {
           	$id = $this->uri->segment(9);
           	$function =   $function."/".$id;
            if ($field_value == 0) {
                $message = 'Barber blocked successfully';
            } else if($field_value == 1) {
                $message = 'Barber unblocked successfully';
            }
        }


         if ($table == "user" && $function == "userList") {
            if ($field_value == 0) {
                $message = 'User blocked successfully';
            } else if($field_value == 1) {
                $message = 'User unblocked successfully';
            }
        }

        if ($table == "room_lock_tbl" && $function == "room_lock_list") {
            if ($field_value == 0) {
                $message = 'Room Lock blocked successfully';
            } else if($field_value == 1) {
                $message = 'Room Lock unblocked successfully';
            }
        }



         	$this->flashMsg('success',$message);
            $path = 'admin/' . $function;
            redirect($path);

    }







	


	public function addUserSubscriptionPlan()
	{
		$this->form_validation->set_rules('name','name','required');
		$this->form_validation->set_rules('count','count','required');
		$this->form_validation->set_rules('type','	type','required');
		$this->form_validation->set_rules('amount','amount','required|numeric');

		
		if($this->form_validation->run() == false){
			$this->adminHtml('Add User Subscription Plan','plan/add-subscription-plan');
		}else
		{		
			$data = $this->input->post();

			$post = $this->common->getField('subscription_plan_user',$data); 
			$result = $this->common->insertData('subscription_plan_user',$post);
			if($result){
				$this->flashMsg('success','User Subscription Plan added successfully');
				redirect(base_url('admin/userPlanList'));
			}else{
				$this->flashMsg('danger','Some error occured. Please try again');
				redirect(base_url('admin/userPlanList'));
			}
		}
	}


	public function editSubscriptionPlan()
	{
		$id = $this->uri->segment(3);
		$this->form_validation->set_rules('name','name','required');
		$this->form_validation->set_rules('count','count','required');
		$this->form_validation->set_rules('type','	type','required');
		$this->form_validation->set_rules('amount','amount','required|numeric');

		if($this->form_validation->run() == false){			
			$data['subscription_plan'] = $this->common->getData('subscription_plan_user',array('plan_id' => $id), array('single'));


			$this->adminHtml('Update User Subscription','plan/add-subscription-plan',$data);
		}else{
			$id = $this->input->post('id');	
			$data = $this->input->post();
			unset($data['id']);

			$post = $this->common->getField('subscription_plan',$data);
			$result = $this->common->updateData('subscription_plan_user',$post,array('plan_id' => $id));	
	
			
			if($result){
				 $this->flashMsg('success','User Subscription Plan update successfully');
			}else{
				$this->flashMsg('danger','Some Error occured.');
			} 			
			redirect(base_url('admin/userPlanList'),'refresh');
		}
	}


	public function addEscortSubscriptionPlan()
	{
		$this->form_validation->set_rules('name','name','required');
		$this->form_validation->set_rules('count','count','required');
		$this->form_validation->set_rules('type','	type','required');
		$this->form_validation->set_rules('amount','amount','required|numeric');

		
		if($this->form_validation->run() == false){
			$this->adminHtml('Add Escort Subscription Plan','plan/add-escort-subscription-plan');
		}else
		{		
			$data = $this->input->post();

			$post = $this->common->getField('subscription_plan',$data); 
			$result = $this->common->insertData('subscription_plan',$post);
			if($result){
				$this->flashMsg('success','Escort Subscription Plan added successfully');
				redirect(base_url('admin/escortPlanList'));
			}else{
				$this->flashMsg('danger','Some error occured. Please try again');
				redirect(base_url('admin/escortPlanList'));
			}
		}
	}



	public function editEscortSubscriptionPlan()
	{
		$id = $this->uri->segment(3);
		$this->form_validation->set_rules('name','name','required');
		$this->form_validation->set_rules('count','count','required');
		$this->form_validation->set_rules('type','	type','required');
		$this->form_validation->set_rules('amount','amount','required|numeric');

		if($this->form_validation->run() == false){			
			$data['subscription_plan'] = $this->common->getData('subscription_plan',array('plan_id' => $id), array('single'));
			$this->adminHtml('Update User Subscription','plan/add-subscription-plan',$data);
		}else{
			$id = $this->input->post('id');	
			$data = $this->input->post();
			unset($data['id']);

			$post = $this->common->getField('subscription_plan',$data);
			$result = $this->common->updateData('subscription_plan',$post,array('plan_id' => $id));	
	
			
			if($result){
				 $this->flashMsg('success','User Subscription Plan update successfully');
			}else{
				$this->flashMsg('danger','Some Error occured.');
			} 			
			redirect(base_url('admin/escortPlanList'),'refresh');
		}
	}



	public function userBookingList($user_id, $request_status)
	{ 	
		// 1, 3 , 4
		$where ="B.user_id = '".$user_id."' AND B.request_status ='".$request_status."'";
        $result = $this->common->bookingList($where);

        $array_data = array();

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
				$serviceInfo = $this->common->getData('services',$where_service);

			
				
				

				if(!empty($serviceInfo)) {
					$serviceName = "";
					foreach ($serviceInfo as $keyInfo => $valueInfo) {
						$serviceName.= $valueInfo['title'].",";
						$result[$key]['services'] = rtrim($serviceName, ',');
					}
				} else {
					$result[$key]['services'] = "";
				}
				 
			
				
				$start = date_create($value['created_at']);
				$end = date_create(Date('Y-m-d H:i:s'));
				$diff=date_diff($end,$start);

				
				$end_time  = new DateTime('00:10:00');
				$start_time  = new DateTime('00:'.$diff->i.':'.$diff->s);
				$interval = $start_time->diff($end_time);
				$result[$key]['time'] = $interval->i.':'.$interval->s;
        	}

        }
        else
        {
        	$result = array();
        }

        $data['booking_list'] = $result;

        if($request_status == 1) {
        	$request_name = 'Accept Booking List';
        } else if ($request_status == 3) {
        	$request_name = 'Started Booking List';
        } else if ($request_status == 4) {
        	$request_name = 'Completed Booking List';
        }

        $this->adminHtml($request_name,'user/booking-list',$data);
	}


	public function escortBookingList($escort_id, $request_status)
	{ 	

		$where ="B.escort_id = '".$escort_id."' AND B.request_status ='".$request_status."'";
        $result = $this->common->bookingList($where);

        $array_data = array();

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
				$serviceInfo = $this->common->getData('services',$where_service);


				if(!empty($serviceInfo)) {
					$serviceName = "";
					foreach ($serviceInfo as $keyInfo => $valueInfo) {
						$serviceName.= $valueInfo['title'].",";
						$result[$key]['services'] = rtrim($serviceName, ',');
					}
				} else {
					$result[$key]['services'] = "";
				}



				$start = date_create($value['created_at']);
				$end = date_create(Date('Y-m-d H:i:s'));
				$diff=date_diff($end,$start);

				
				$end_time  = new DateTime('00:10:00');
				$start_time  = new DateTime('00:'.$diff->i.':'.$diff->s);
				$interval = $start_time->diff($end_time);
				$result[$key]['time'] = $interval->i.':'.$interval->s;
        	}

        }
        else
        {
        	$result = array();
        }

        $data['booking_list'] = $result;

        if($request_status == 1) {
        	$request_name = 'Accept Booking List';
        } else if ($request_status == 3) {
        	$request_name = 'Started Booking List';
        } else if ($request_status == 4) {
        	$request_name = 'Completed Booking List';
        }

        $this->adminHtml($request_name,'escort/booking-list',$data);
	}


	public function categoryList()
	{
		
		$data['category'] = $this->common->getData('category_tbl','',array('sort_by'=>'category_id','sort_direction' => 'desc'));
		$this->adminHtml('Category List','category/category-list',$data);
	}




	public function addCategory()
	{
		$this->form_validation->set_rules('category_name','Category','required');
		
		if($this->form_validation->run() == false){
			$this->adminHtml('Add Category','add-category');
		}else
		{		
			$data['name'] = $this->input->post('category_name');
			$result = $this->common->insertData('category_tbl',$data);

			if($result){
				$this->flashMsg('success','Category added successfully');
				redirect(base_url('admin/categoryList'));
			}else{
				$this->flashMsg('danger','Some error occured. Please try again');
				redirect(base_url('admin/categoryList'));
			}
		}
	}



	

	public function editCategory()
	{

		 $id = $this->uri->segment(3);
		$this->form_validation->set_rules('category_name','Category','required');
		if($this->form_validation->run() == false){			
			$data['category'] = $this->common->getData('category_tbl',array('category_id' => $id), array('single'));
			$this->adminHtml('Update Category','add-category',$data);
		}else{
			
			$data['name'] = $this->input->post('category_name');
			$id = $this->input->post('id');
		
			$result = $this->common->updateData('category_tbl',$data,array('category_id'=>$id));
			
			if($result){
				 $this->flashMsg('success','Category update successfully');
			}else{
				$this->flashMsg('danger','Some Error occured.');
			} 			
			redirect(base_url('admin/categoryList'),'refresh');
		}
	}


	


	public function logout()
	{
		$this->session->sess_destroy();
		$this->session->set_flashdata('msg','Logged out successfully');
		redirect(base_url('admin-login'));
	}

	

	public function edit_term_services()
	{
		$this->form_validation->set_rules('editor','Info','required');
		if($this->form_validation->run() == false)
		{			
			$data['terms'] = $this->common->getData('terms_condition_tbl',array('id' => '1'), array('single'));
			$this->adminHtml('Update Terms and Services','edit-terms',$data);
		}
		else
		{
			
			$data['info'] = $this->input->post('editor');
			$id = $this->input->post('id');
		
			$result = $this->common->updateData('terms_condition_tbl',$data,array('id'=>$id));
			
			if($result){
				 $this->flashMsg('success','Terms and Conditions update successfully');
			}else{
				$this->flashMsg('danger','Some Error occured.');
			} 			
			redirect(base_url('admin/edit_term_services'),'refresh');
		}
	}







	public function edit_privacy_policy()
	{
		
		$this->form_validation->set_rules('editor','Info','required');
		if($this->form_validation->run() == false)
		{			
			$data['privacy'] = $this->common->getData('privacy_policy_tbl',array('id' => '1'), array('single'));
			$this->adminHtml('Update Terms and Services','edit_privacy_policy',$data);
		}
		else
		{
			
			$data['info'] = $this->input->post('editor');
			$id = $this->input->post('id');
		
			$result = $this->common->updateData('privacy_policy_tbl',$data,array('id'=>$id));
			
			if($result){
				 $this->flashMsg('success','Privacy Policy update successfully');
			}else{
				$this->flashMsg('danger','Some Error occured.');
			} 			
			redirect(base_url('admin/edit_privacy_policy'),'refresh');
		}
	}



	public function edit_faq()
	{
		
		$this->form_validation->set_rules('editor','Info','required');
		if($this->form_validation->run() == false)
		{			
			$data['faq'] = $this->common->getData('faq_tbl',array('id' => '1'), array('single'));
			$this->adminHtml('Update FAQ','edit-faq',$data);
		}
		else
		{
			
			$data['info'] = $this->input->post('editor');
			$id = $this->input->post('id');
		
			$result = $this->common->updateData('faq_tbl',$data,array('id'=>$id));
			
			if($result){
				 $this->flashMsg('success','FAQ update successfully');
			}else{
				$this->flashMsg('danger','Some Error occured.');
			} 			
			redirect(base_url('admin/edit_faq'),'refresh');
		}
	}


	


	public function escortDetail($escort_id)
	{
			$escortinfo = get_escort_full_details($escort_id);


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


			$escortinfo['addtional_service'] = $this->escort_model->escort_addtional_service(array('EA.escort_id' => $escort_id));

			$escortinfo['rate'] = $this->escort_model->escort_rate(array('ER.escort_id' => $escort_id));

			$data['escort'] = $escortinfo;
	
		$this->adminHtml('Clinet Detail','escort/escort-detail',$data);
	}


	public function serviceDetail($service_id)
	{
		$data['service'] = $this->getServiceDetail($service_id);
		$this->adminHtml('Clinet Detail','salon/service-detail',$data);
	}


	public function salonDetail($salon_id)
	{
		$data['salon'] = $this->getSalonDetailFunction($salon_id);
		$this->adminHtml('Salon Detail','salon/salon-detail',$data);
	}


	
	public function getSalonDetailFunction($salon_id)

	{

			$salon_info = $this->common->getData('salon',array('salon_id' => $salon_id),array('single'));

			if(!empty($salon_info))

			{

				if(!empty($salon_info['category']))

				{

					$arr_category=(explode(",",$salon_info['category']));

					$category_string = implode("','", $arr_category);

					$where_category = "`category_id` IN ('".$category_string."')";

					$result_category = $this->common->getData('category_tbl',$where_category);



					foreach($result_category as $category_data)

					{

						$category_array[]=array('category_id'=>$category_data['category_id'],'name'=>$category_data['name']);

					}

					if(!empty($category_array))
					{
						$category_array = $category_array;
					}
					else
					{
						$category_array = array();
					}



					$salon_info['category'] = $category_array;

				}

				else

				{

					$salon_info['category'] = array();

				}

				

				$salon_time_schedule = $this->common->getData('time_schedule_tbl',array('salon_id' => $salon_id));

				if(!empty($salon_time_schedule))

				{

					$salon_info['time_schedule'] = $salon_time_schedule;

				}

				else

				{

					$salon_info['time_schedule'] = array();

				}

				

				if(!empty($salon_info['profile_image']))

				{

					$salon_info['profile_image'] = base_url($salon_info['profile_image']);

				}

				else

				{

					$salon_info['profile_image'] = "";

				}

				

				unset($salon_info['password']);

			}

			else

			{

				$salon_info = (object) array();

			}

			

			return $salon_info;

	}





	public function getclientDetailFunction($client_id)
	{
			$client_info = $this->common->getData('client',array('client_id' => $client_id),array('single'));
			if(!empty($client_info))
			{
				if(!empty($client_info['profile_image']))
				{
					$client_info['profile_image'] = base_url($client_info['profile_image']);
				}
				else
				{
					$client_info['profile_image'] = "";
				}

				if(!empty($client_info['full_name']))
				{
					$words = explode(" ", $client_info['full_name']);
					$acronym = "";

					foreach ($words as $w) 
					{
					  $acronym .= $w[0].".";
					}

					$acronym = strtoupper(rtrim($acronym,'.'));


					$client_info['short_name'] = $acronym;
				}
				
				unset($client_info['password']);
			}
			else
			{
				$client_info = (object) array();
			}
			
			return $client_info;
	}

	
	public function userList()
	{
		$data['user'] = $this->user_model->user_list();	
		$data['link'] = 'admin/userDetail/';

	
		$this->adminHtml('User List','user/user-list',$data);
	}



	public function userDetail($user_id)
	{
		$data['user'] = $this->user_model->user_list(array('U.user_id' => $user_id),array('single'));	




		$this->adminHtml('User Detail','user/user-detail',$data);
	}


	public function agentDetail($agent_id)
	{
		$data['user'] = $this->agent_model->agent_list(array('A.agent_id' => $agent_id),array('single'));

		$this->adminHtml('Agent Detail','agent/agent-detail',$data);
	}



	public function escortSubscriptionList()
	{
		$data['escortSubscription'] = $this->common->subscription_escort();
		$data['link'] = 'admin/escortDetail/';

		$this->adminHtml('Escort Subscription List','subscription/escort-subscription-list',$data);
	}




	public function userSubscriptionList()
	{
		$data['userSubscription'] = $this->common->subscription_user();
		$data['link'] = 'admin/userDetail/';
		
		$this->adminHtml('User Subscription List','subscription/user-subscription-list',$data);
	}



	public function escortList()
	{
		$data['escort'] = $this->escort_model->eacort_list(array('E.progress_status'=>4));
		$data['link'] = 'admin/escortDetail/';
		
		$this->adminHtml('Escort List','escort/escort-list',$data);
	}






	public function escortListAgent($agent_id)
	{
		$data['escort'] = $this->common->getData('escort',array('progress_status'=>4,'agent_id' => $agent_id),array('sort_by'=>'escort_id','sort_direction' => 'desc'));
		$data['link'] = 'admin/escortDetail/';



		
		$this->adminHtml('Escort List','escort/escort-list-agent',$data);
	}



	public function agentList()
	{
		
		$data['agent'] = $this->agent_model->agent_list();
		$data['link'] = 'admin/agentDetail/';
		
		$this->adminHtml('Agent List','agent/agent-list',$data);
	}


	public function salonList()
	{
		$data['salon'] = $this->common->getData('salon','',array('sort_by'=>'salon_id','sort_direction' => 'desc'));
		$data['link'] = 'admin/salonDetail/';
		
		$this->adminHtml('Salon List','salon/salon-list',$data);
	}



	public function barberList($salon_id)
	{
		$salon_id  =  $this->uri->segment(3);
		$where="salon_id ='".$salon_id."'";
		$data['barber'] = $this->common->getData('barber_tbl',$where);
		$this->adminHtml('Barber List','salon/barber-list',$data);
	}


	public function userPlanList()
	{
		$data['userPlan'] = $this->common->getData('subscription_plan_user','',array('sort_by'=>'plan_id','sort_direction' => 'desc'));
		$this->adminHtml('User Plan List','plan/user-plan-list',$data);
	}


	public function escortPlanList()
	{
		$data['escortPlan'] = $this->common->getData('subscription_plan','',array('sort_by'=>'plan_id','sort_direction' => 'desc'));
		$this->adminHtml('Escort Plan List','plan/escort-plan-list',$data);
	}



	public function serviceList($salon_id)
	{
		$salon_id  =  $this->uri->segment(3);
		$where="salon_id ='".$salon_id."'";
		$data['service'] = $this->common->getData('service_tbl',$where);
		$data['link'] = 'admin/serviceDetail/';
		$this->adminHtml('Service List','salon/service-list',$data);
	}

}
