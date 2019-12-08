<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class Escort_model extends CI_Model
{
	
	function __construct()
	{
		parent:: __construct();
	}


	public function escort_detail($where="",$options=array())
	{
		$this->db->select('E.escort_id,E.first_name,E.last_name,E.email,E.reset_code,E.country_code,E.phone_number,E.status');
		$this->db->from('escort as E');
		if($where != ""){
			$this->db->where($where);
		}
		// $this->db->join('tag_tbl as T','T.tag_id = R.tags');
		$this->db->order_by("E.escort_id",'DESC');
		
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


	public function eacort_list($where="",$options=array())
	{
		$this->db->select('E.escort_id,E.first_name,E.last_name,E.email,E.reset_code,E.country_code,E.phone_number,E.status,E.progress_status,E.	created_at,E.avg_rating,C.phonecode');
		$this->db->from('escort as E');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('countries as C','C.id = E.country_code');
		$this->db->order_by("E.escort_id",'DESC');
		

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



	public function escort_full_detail($where="",$options=array())
	{
		$this->db->select('E.escort_id,E.first_name,E.last_name,E.email,E.profile_image,E.image1,E.image2,E.image3,E.image4,E.image5,E.image6,E.reset_code,E.country_code,E.phone_number,E.age,E.height,E.status,E.progress_status,C.id as country_id,C.name as country_name,B.body_type_id,B.name as body_type_name,CT.id as city_id,CT.name as city_name,G.gender_id,G.name as gender,BUST.bust_size_id,BUST.size as bust_size,CUP.cup_size_id,CUP.size as cup_size,W.waise_size_id,W.size as waise_size,H.hip_size_id,H.size as hip_size,ENG.english_id,ENG.type as english_type,CHI.chinese_id,CHI.type as chinese_type,JP.japanese_id,JP.type as japanese_type,K.korean_id,K.type as korean_type,E.online_status,E.cancellation_policy,E.payment_method,E.service,E.avg_rating,IFNULL(AG.agency_name,"") as agency');
		$this->db->from('escort as E');
		if($where != ""){
			$this->db->where($where);
		}

		$this->db->join('country as C','C.id = E.country_id');
		$this->db->join('cities as CT','CT.id = E.city_id');
		$this->db->join('gender as G','G.gender_id = E.gender');
		$this->db->join('body_type as B','B.body_type_id = E.body_type');
		$this->db->join('bust_size as BUST','BUST.bust_size_id = E.bust_size');
		$this->db->join('cup_size as CUP','CUP.cup_size_id = E.cup_size');
		$this->db->join('waise_size as W','W.waise_size_id = E.waise_size');
		$this->db->join('hip_size as H','H.hip_size_id = E.hip_size');
		$this->db->join('english as ENG','ENG.english_id = E.english');
		$this->db->join('chinese as CHI','CHI.chinese_id = E.chinese');
		$this->db->join('japanese as JP','JP.japanese_id = E.japanese');
		$this->db->join('korean as K','K.korean_id = E.korean');
		$this->db->join('agent as AG','AG.agent_id = E.agent_id', 'left');
	
		$this->db->order_by("E.escort_id",'DESC');
		
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



	public function escort_addtional_service($where="",$options=array())
	{
		$this->db->select('EA.escort_additional_service_id,EA.service_id,EA.price_id,EA.escort_id,S.title as service_title,S.description as service_description,S.service_type,SP.info as price');
		$this->db->from('escort_additional_service as EA');
		if($where != ""){
			$this->db->where($where);
		}

		$this->db->join('services as S','S.services_id = EA.service_id');
		$this->db->join('service_price as SP','SP.service_price_id = EA.price_id');
		
	
		$this->db->order_by("EA.escort_additional_service_id",'DESC');
		
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


	public function escort_rate($where="",$options=array())
	{
		$this->db->select('ER.escort_rate_id,ER.hour,ER.shot,ER.price as price_id,ER.escort_id,H.name as hour_name,H.hour_time,S.name as shot_name,SP.name as price,SP.amount as amount');
		$this->db->from('escort_rate as ER');
		if($where != ""){
			$this->db->where($where);
		}

		$this->db->join('hours as H','H.hour_id = ER.hour');
		$this->db->join('shots as S','S.shot_id = ER.shot');
		$this->db->join('shots_price as SP','SP.shots_price_id = ER.price');

		
		$this->db->order_by("ER.escort_rate_id",'DESC');
		
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



	


	public function agentLocation($where="",$options=array())
	{
		$this->db->select('C.country_id,C.country_code,C.country_name,S.state_id,S.state_code,S.state_name,CT.city_id,CT.city_name');
		$this->db->from('agent as A');
		if($where != ""){
			$this->db->where($where);
		}
	   	
	   	$this->db->join('country as C','C.country_id = A.country_id');
	    $this->db->join('states as S','S.state_id = A.state_id');
	    $this->db->join('city as CT','CT.city_id = A.city_id');
		
		
		
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
