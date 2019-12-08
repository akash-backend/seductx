<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


function get_agent_details($agent_id)
{
   $ci =& get_instance();
   $where = "A.agent_id ='".$agent_id."'";
   $info  = $ci->agent_model->agent_detail($where,array('single'));

   if(empty($info))
   {
      $info = array();
   }
   
   return $info;
}




