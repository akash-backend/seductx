<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


function get_escort_details($escort_id)
{
   $ci =& get_instance();
   $where = "E.escort_id ='".$escort_id."'";
   $info  = $ci->escort_model->escort_detail($where,array('single'));

   if(empty($info))
   {
      $info = array();
   }
   
   return $info;
}



function get_escort_full_details($escort_id)
{
   $ci =& get_instance();
   $where = "E.escort_id ='".$escort_id."'";
   $info  = $ci->escort_model->escort_full_detail($where,array('single'));

   if(empty($info))
   {
      $info = array();
   }
   
   return $info;
}


