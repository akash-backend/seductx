<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$company = $this->session->userdata('admin');
	
		$this->id = $company['id'];

		$admin = $this->session->userdata('admin');
		if(empty($admin)){ 
			redirect(base_url('admin-login'));
		}

	}

	public function dashboard()
	{	
		$data['all_client'] = $this->common->getData('client','',array('count'));
		$data['all_salon'] = $this->common->getData('salon','',array('count'));
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


        if ($table == "client" && $function == "clientList") {
            if ($field_value == 0) {
                $message = 'Client blocked successfully';
            } else if($field_value == 1) {
                $message = 'Client unblocked successfully';
            }
        }

        if ($table == "salon" && $function == "salonList") {
            if ($field_value == 0) {
                $message = 'Salon blocked successfully';
            } else if($field_value == 1) {
                $message = 'Salon unblocked successfully';
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


	public function clientDetail($client_id)
	{
		$data['client'] = $this->getclientDetailFunction($client_id);
		$this->adminHtml('Clinet Detail','client/client-detail',$data);
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

	
	public function clientList()
	{
		$data['client'] = $this->common->getData('client','',array('sort_by'=>'client_id','sort_direction' => 'desc'));
		$data['link'] = 'admin/clientDetail/';
		
		$this->adminHtml('Client List','client/client-list',$data);
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



	public function serviceList($salon_id)
	{
		$salon_id  =  $this->uri->segment(3);
		$where="salon_id ='".$salon_id."'";
		$data['service'] = $this->common->getData('service_tbl',$where);
		$data['link'] = 'admin/serviceDetail/';
		$this->adminHtml('Service List','salon/service-list',$data);
	}

}
