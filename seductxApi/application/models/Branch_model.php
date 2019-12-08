<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class branch_model extends CI_Model
{
	
	function __construct()
	{
		parent:: __construct();
	}


	public function branch_detail($where="",$options=array())
	{
		$this->db->select('B.branch_id,B.restaurant_id,B.branch_name,B.phone_no,B.location,B.latitude,B.longitude,B.country_id,B.state_id,B.city_id,B.status,R.restaurant_name,R.profile_image');
		$this->db->from('branch as B');
		if($where != ""){
			$this->db->where($where);
		}
		
		$this->db->join('restaurant as R','R.restaurant_id = B.restaurant_id');
		$this->db->order_by("B.branch_id",'DESC');
		
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


	public function get_branch_by_lat_long($where="",$options=array())
	{
		$this->db->select('B.branch_id,(SELECT COUNT(branch_id) FROM   branch_favourite WHERE  branch_id = B.branch_id AND user_id = "'.$_REQUEST['user_id'].'") as favourite_status,B.restaurant_id,B.avg_rating,B.review_count,B.branch_name,B.per_person_cost,B.phone_no,B.location,B.latitude,B.longitude,B.country_id,B.state_id,B.city_id,B.delivery_time_duration,B.minimum_order_price,B.delivery_fee,B.status,R.restaurant_name,R.profile_image,R.profile_image_thumb, (
		     3959 * acos (
		      cos ( radians("'.$_REQUEST['latitude'].'") )
		      * cos( radians( B.latitude ) )
		      * cos( radians( B.longitude ) - radians("'.$_REQUEST['longitude'].'") )
		      + sin ( radians("'.$_REQUEST['latitude'].'") )
		      * sin( radians( B.latitude ) )
		    )
		  ) * 1.609344 AS distance');

		$this->db->from('branch as B');
		$this->db->join('restaurant as R','R.restaurant_id = B.restaurant_id');
		
		
		if($where != ""){
			$this->db->where($where);
		}



		//restaurant filter
		if(!empty($_REQUEST['restaurant_id']))
		{
			$this->db->where(array("B.restaurant_id"=>$_REQUEST['restaurant_id']));
		}


		// Open store filter
		if(!empty($_REQUEST['open_store']))
		{
			$this->db->where("B.branch_id  IN (SELECT branch_id FROM time_schedule_tbl WHERE day = '".date('l')."' AND '".date('H:i:s')."' BETWEEN start_time AND end_time)");
		}

		// city filter
		if(!empty($_REQUEST['city_id']))
		{
			$this->db->where(array("B.city_id"=>$_REQUEST['city_id']));
		}


		//category filter
		if(!empty($_REQUEST['category_id']))
		{
			$this->db->where("B.branch_id  IN (SELECT branch_id FROM branch_category WHERE category_id = '".$_REQUEST['category_id']."')");
		}
		


		// sorting start
		if(!empty($_REQUEST['sort_filter']))
		{
			if($_REQUEST['sort_filter'] == 1)
			{
				$this->db->order_by("B.per_person_cost");
			}
			else if($_REQUEST['sort_filter'] == 2)
			{
				$this->db->order_by("B.per_person_cost DESC");
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
    	
    	
		
		// distance filter start
    	if(!empty($_REQUEST['distance_filter']))
		{
			$this->db->having("distance <= '".$_REQUEST['distance_filter']."'");	
		}
		// distance filter end

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

	
}
