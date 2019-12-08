<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class restaurant_model extends CI_Model
{
	
	function __construct()
	{
		parent:: __construct();
	}


	public function restaurant_detail($where="",$options=array())
	{
		$this->db->select('R.restaurant_id,R.restaurant_name,R.branch_count,R.manager_name,R.manager_email,R.manager_contact_no,R.profile_image,R.profile_image_thumb,R.created_at,R.status');
		$this->db->from('restaurant as R');
		if($where != ""){
			$this->db->where($where);
		}
		// $this->db->join('tag_tbl as T','T.tag_id = R.tags');
		$this->db->order_by("R.restaurant_id",'DESC');
		
		$res = $this->db->get()->result_array();
		
		if($res){			
			if(isset($options) && in_array('single',$options)){ 
				return $res[0];
			}else{
				return $res;
			}
		}
		else
		{
			return false;
		}
	}



	public function restaurantLocation($where="",$options=array())
	{
		$this->db->select('C.id as country_id,C.sortname as country_sortname,C.name as country_name,S.id as state_id,S.name as state_name,CT.id as city_id,,CT.name as city_	name');
		$this->db->from('restaurant as U');
		if($where != ""){
			$this->db->where($where);
		}
	   	
	   	$this->db->join('countries as C','C.id = U.country_id');
	    $this->db->join('states as S','S.id = U.state_id');
	    $this->db->join('cities as CT','CT.id = U.city_id');
		
		
		$res = $this->db->get()->result_array();
		
		if($res){			
			if(isset($options) && in_array('single',$options)){ 
				return $res[0];
			}else{
				return $res;
			}
		}
		else
		{
			return array();
		}
	}



	





	
}
