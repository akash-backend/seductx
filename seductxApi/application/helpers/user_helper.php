<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


function get_user_details($user_id)
{
   $ci =& get_instance();
   $where = "U.user_id ='".$user_id."'";
   $info  = $ci->user_model->user_detail($where,array('single'));

   if(empty($info))
   {
      $info = array();
   }
   
   return $info;
}


function session_manage($user_id,$session_id)
{
   $ci =& get_instance();
   
   // blank session set
   $ci->common->updateData('user',array('session_id' => ""),array('session_id' => $session_id));

   //session set
   $ci->common->updateData('user',array('session_id' => $session_id),array('user_id' => $user_id));
}

