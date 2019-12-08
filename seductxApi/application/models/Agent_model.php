<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class Agent_model extends CI_Model
{
	
	function __construct()
	{
		parent:: __construct();
	}


	public function agent_detail($where="",$options=array())
	{
		$this->db->select('A.agent_id,A.first_name,A.last_name,A.agency_name,A.email,A.deviceToken,A.reset_code,A.country_code,A.phone_number,A.latitude,A.longitude,A.	token,A.created_at,A.mobile_verify,A.status');
		$this->db->from('agent as A');
		if($where != ""){
			$this->db->where($where);
		}
		// $this->db->join('tag_tbl as T','T.tag_id = R.tags');
		$this->db->order_by("A.agent_id",'DESC');
		
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



	public function agent_list($where="",$options=array())
	{
		$this->db->select('A.agent_id,A.first_name,A.last_name,A.email,A.deviceToken,A.reset_code,A.country_code,A.phone_number,A.latitude,A.longitude,A.	token,A.created_at,A.mobile_verify,A.status,C.phonecode,A.agency_name');
		$this->db->from('agent as A');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('countries as C','C.id = A.country_code');
		$this->db->order_by("A.agent_id",'DESC');
		

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



	public function escortListAgent($where="",$options=array(),$latitude,$longitude,$hour='')
	{
		
		$this->db->select('E.escort_id,E.first_name,E.last_name,E.email,E.profile_image,E.image1,E.image2,E.image3,E.image4,E.image5,E.image6,E.reset_code,E.country_code,E.phone_number,E.age,E.height,E.status,E.progress_status,E.latitude,E.longitude,C.id as country_id,C.name as country_name,B.body_type_id,B.name as body_type_name,CT.id as city_id,CT.name as city_name,G.gender_id,G.name as gender,BUST.bust_size_id,BUST.size as bust_size,CUP.cup_size_id,CUP.size as cup_size,W.waise_size_id,W.size as waise_size,H.hip_size_id,H.size as hip_size,ENG.english_id,ENG.type as english_type,CHI.chinese_id,CHI.type as chinese_type,JP.japanese_id,JP.type as japanese_type,K.korean_id,K.type as korean_type,(

		     3959 * acos (

		      cos ( radians("'.$latitude.'") )

		      * cos( radians( E.latitude ) )

		      * cos( radians( E.longitude ) - radians("'.$longitude.'") )

		      + sin ( radians("'.$latitude.'") )

		      * sin( radians( E.latitude ) )

		    )

		  ) * 1.609344 AS distance,E.online_status,E.avg_rating');
		

		$this->db->from('escort as E');
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
		
		
		if($where != ""){
			$this->db->where($where);
		}

		//height filter
		if(!empty($_REQUEST['start_age']) && !empty($_REQUEST['end_age']))
		{
			$where_age = "E.age >='".$_REQUEST['start_age']."' AND E.age <='".$_REQUEST['end_age']."'";	
			$this->db->where($where_age);
		} else if(!empty($_REQUEST['end_age'])) {
			$where_age = "E.age >'".$_REQUEST['end_age']."'";	
			$this->db->where($where_age);
		}

		//hour filter
		if(!empty($hour))
		{
			$where_hour = '(SELECT COUNT(escort_rate_id) FROM  escort_rate WHERE  escort_id = E.escort_id AND hour = "'.$hour.'") > 0';	
			$this->db->where($where_hour);
		}
		
		//height filter
		if(!empty($_REQUEST['start_height']) && !empty($_REQUEST['end_height']))
		{
			$where_height = "E.height >='".$_REQUEST['start_height']."' AND E.height <='".$_REQUEST['end_height']."'";	
			$this->db->where($where_height);
		} else if(!empty($_REQUEST['end_height'])) {
			$where_height = "E.height >'".$_REQUEST['end_height']."'";	
			$this->db->where($where_height);
		}

		// cup size filter
		if(!empty($_REQUEST['cup_size']))
		{
			$this->db->where(array("CUP.cup_size_id"=>$_REQUEST['cup_size']));
		}

		// body type size filter
		if(!empty($_REQUEST['body_type']))
		{
			$this->db->where(array("B.body_type_id"=>$_REQUEST['body_type']));
		}

		// gender filter
		if(!empty($_REQUEST['gender']))
		{
			$this->db->where(array("G.name"=>$_REQUEST['gender']));
		}

		// city filter
		if(!empty($_REQUEST['city']))
		{
			$this->db->where(array("CT.name"=>$_REQUEST['city']));
		}


		// online filter
		if(!empty($_REQUEST['online_status']))
		{
			$this->db->where(array("E.online_status"=>$_REQUEST['online_status']));
		}

		
		// country filter
		if(!empty($_REQUEST['country']))
		{
			$this->db->where(array("C.id"=>$_REQUEST['country']));
		}

		// favourite filter
		if(!empty($_REQUEST['favourite_status']))
		{
			$this->db->where("E.escort_id  IN (SELECT escort_id FROM favourite WHERE user_id = '".$_REQUEST['user_id']."')");
		}


		// service filter
		if(!empty($_REQUEST['searchService'])) {
			$serviceArray = explode(',',$_REQUEST['searchService']);
			 $whereService = '';$a=1;
			 foreach($serviceArray as $comm){
                        if($a>1){
                            $whereService .= " OR ";
                        }
                        $whereService .= "FIND_IN_SET('".$comm."',E.service)"; 
                        $a++;
                    }
                    $this->db->where( '('.$whereService.')' );
		}


		 
		
		
		// sorting start
		if(!empty($_REQUEST['sort_filter']))
		{
			if($_REQUEST['sort_filter'] == 1)
			{
				$this->db->order_by("shot_price");
			}
			else if($_REQUEST['sort_filter'] == 2)
			{
				$this->db->order_by("shot_price DESC");
			}
			else if($_REQUEST['sort_filter'] == 3)
			{
				$this->db->order_by("E.avg_rating DESC");
			}
			else if($_REQUEST['sort_filter'] == 4)
			{
				$this->db->order_by("distance");
			}
			else
			{
				$this->db->order_by("distance");
			}
		}
		else
		{
			$this->db->order_by("distance");
		}

		// sorting end

		if (!in_array('count', $options)) {
				
			if(!empty($_REQUEST['limit_status']))
			{
				// limit code start
		    	if(empty($_REQUEST['start']))
				{
						$this->db->limit(5, 0);
				}
				else
				{
					$this->db->limit(5, $_REQUEST['start']);
				}
				// limit code end
			}
	    }
    	
		
		// distance filter start
    	if(!empty($_REQUEST['distance_filter']))
		{
			$this->db->having("distance <= '".$_REQUEST['distance_filter']."'");	
		}
		// distance filter end


		$res = $this->db->get()->result_array();

		if (!empty($options) && in_array('count', $options)) {

			return count($res);
		}

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

	
}
