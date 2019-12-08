<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class rating_branch_model extends CI_Model
{
	
	function __construct()
	{
		parent:: __construct();
	}


	public function getRating($where="",$options=array())
	{
		$this->db->select('R.rating_id,R.rating,R.review,R.created_at,U.user_id,U.email,U.full_name as user_full_name');
		$this->db->from('branch_rating as R');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('user as U','U.user_id = R.user_id');
		$this->db->order_by("R.rating_id",'DESC');

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
