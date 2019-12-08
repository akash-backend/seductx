<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class dishes_model extends CI_Model
{
	
	function __construct()
	{
		parent:: __construct();
	}


	public function dishes_detail($where="",$options=array())
	{
		$this->db->select('D.dishes_id,D.branch_id,D.name,D.description,D.price,D.image,D.	image_thumb,D.mark,D.category,D.customization_status,D.sold_status,D.status,C.name as category_name');
		$this->db->from('dishes as D');
		if($where != ""){
			$this->db->where($where);
		}
		
		$this->db->join('dish_category as C','C.category_id = D.category');
		$this->db->order_by("D.dishes_id",'DESC');
		
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
