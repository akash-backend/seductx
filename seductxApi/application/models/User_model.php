<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class User_model extends CI_Model
{
	
	function __construct()
	{
		parent:: __construct();
	}


	public function user_detail($where="",$options=array())
	{
		$this->db->select('U.user_id,U.first_name,U.last_name,U.email,U.reset_code,U.country_code,U.phone_number,U.status,U.avg_rating');
		$this->db->from('user as U');
		if($where != ""){
			$this->db->where($where);
		}
		// $this->db->join('tag_tbl as T','T.tag_id = R.tags');
		$this->db->order_by("U.user_id",'DESC');
		
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



	public function user_list($where="",$options=array())
	{
		$this->db->select('U.user_id,U.first_name,U.last_name,U.email,U.reset_code,U.country_code,U.phone_number,U.created_at,U.status,U.avg_rating,C.phonecode');
		$this->db->from('user as U');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('countries as C','C.id = U.country_code');
		$this->db->order_by("U.user_id",'DESC');
		

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



	public function userLocation($where="",$options=array())
	{
		$this->db->select('C.country_id,C.country_code,C.country_name,S.state_id,S.state_code,S.state_name,CT.city_id,CT.city_name');
		$this->db->from('user as U');
		if($where != ""){
			$this->db->where($where);
		}
	   	
	   $this->db->join('country as C','C.country_id = U.country_id');
	    $this->db->join('states as S','S.state_id = U.state_id');
	    $this->db->join('city as CT','CT.city_id = U.city_id');
		
		
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
			return (object) array();
		}
	}

	
}
