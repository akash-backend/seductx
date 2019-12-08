<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class Common extends CI_Model
{
	
	function __construct()
	{
		parent:: __construct();
	}

	public function getData($table,$where="",$options=array())
	{
		if(isset($options['field'])){
			$this->db->select($options['field']);
		}
				
		if($where != ""){
			$this->db->where($where);
		}
		if(isset($options['where_in']) && isset($options['where_in'])){
			 $this->db->where_in($options['colname'] ,$options['where_in']);
		}

		if (isset($options['sort_by']) && isset($options['sort_direction'])) {
			$this->db->order_by($options['sort_by'], $options['sort_direction']);
		}
		
		if (isset($options['group_by']) ) {
			$this->db->group_by($options['group_by']);
		}
		if (isset($options['limit']) && isset($options['offset']))	{
			$this->db->limit($options['limit'], $options['offset']);
		}
		else {
			if (isset($options['limit'])) {
			    $this->db->limit($options['limit']);
			}
		}
		$query = $this->db->get($table);
		$result = $query->result_array();
		if (!empty($options) && in_array('count', $options)) {

			return count($result);
		}
		if($result){
			if(isset($options) && in_array('single',$options)){ 
				return $result[0];
			}else{
				return $result;
			}
		}else{
			return false;
		}
	}



	public function room_detail_explore($where="",$options=array())
	{
		$this->db->select('R.id,R.user_id,R.room_name,R.image,R.announcement,R.membership_fee,R.room_date,R.room_time,U.user_country,T.tag_name');
		$this->db->from('room_tbl as R');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('tag_tbl as T','T.tag_id = R.tags');
		$this->db->join('user as U','U.id = R.user_id');
		$this->db->order_by("R.id",'DESC');
		$this->db->limit(4);

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




	public function subscription_escort($where="",$options=array())
	{
		$this->db->select('SE.subscription_id,SE.escort_id,SE.plan_id,SE.created_at,SE.expiry_date,SE.subscription_status,E.first_name,E.last_name,E.email,E.phone_number,C.phonecode,SP.name as plan_name,SP.name as plan_name,SP.amount as amount');
		$this->db->from('subscription_escort as SE');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('escort as E','E.escort_id = SE.escort_id');
		$this->db->join('countries as C','C.id = E.country_code');
		$this->db->join('subscription_plan as SP','SP.plan_id = SE.plan_id');
		$this->db->order_by("SE.subscription_id",'DESC');
		

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


	public function subscription_user($where="",$options=array())
	{
		$this->db->select('SU.subscription_id,SU.user_id,SU.plan_id,SU.created_at,SU.expiry_date,SU.subscription_status,U.first_name,U.last_name,U.email,U.phone_number,C.phonecode,SP.name as plan_name,SP.name as plan_name,SP.amount as amount');
		$this->db->from('subscription_user as SU');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('user as U','U.user_id = SU.user_id');
		$this->db->join('countries as C','C.id = U.country_code');
		$this->db->join('subscription_plan_user as SP','SP.plan_id = SU.plan_id');
		$this->db->order_by("SU.subscription_id",'DESC');
		

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


	



	public function booking_detail($where="",$options=array())
	{
		$this->db->select('B.booking_id,B.book_dateTime,ST.service_id,ST.service_name,ST.service_cost,ST.descprition as service_discrption,C.client_id,C.full_name as client_name,C.profile_image as client_profile_image,C.location as client_location,S.salon_id,S.salon_name,S.profile_image as salon_profile_image,S.location as salon_location,BT.full_name as barber_name,BT.profile_image as barber_profile_image,B.status,IFNULL(NST.id,0) as notification_id,');
		$this->db->from('booking_tbl as B');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('salon as S','S.salon_id = B.salon_id');
		$this->db->join('service_tbl as ST','ST.service_id = B.service_id');
		$this->db->join('barber_tbl as BT','BT.barber_id = B.barber_id');
		$this->db->join('client as C','C.client_id = B.client_id');
		$this->db->join('notification_salon_tbl as NST','NST.booking_id = B.booking_id', 'left outer');

		$this->db->order_by("B.booking_id",'DESC');

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
	

	public function getField($table,$data)
	{
		$post = array();
		$fields = $this->db->list_fields($table);
		foreach ($data as $key => $value) {
			if(in_array($key, $fields)){
				$post[$key] = $value;
			}
		}
		return $post;
	}

	public function getFieldKey($table)
	{
		return $this->db->list_fields($table);
	}

	public function insertData($table,$data)
	{
		return $this->db->insert($table,$data);
	}

	public function updateData($table,$data,$where)
	{		
		return $this->db->update($table,$data,$where);			
	}

	public function checkTrue(){
		if($this->db->affected_rows()){
			return true;
		}else{
			return false;
		}
	}

	public function deleteData($table,$where)
	{		
		return $this->db->delete($table,$where);
	}


	public function whereIn($table,$colname,$in,$where= array())
	{
		$this->db->where($where);
		$search  = "FIND_IN_SET('".$in."', $colname)";
		$this->db->where($search);
        $query=$this->db->get($table);
         $result = $query->result_array();	
        $result = $query->result_array();
		if($result){			
			return $result[0];
			
		}else{
			return false;
		}	
		
	}

	public function arrayToName($table,$field,$array)
	{		
		foreach ($array as $value) {
			$name[] = $this->getData($table,array('id'=> $value),array('field'=>$field,'single'));
		}		
		if(!empty($name)){
			foreach ($name as $key => $value) {
				$name1[] = $value[$field];
			}
			return implode(',', $name1);			
		}else{
			return false;
		}		
	}


	public function sendMail($to,$subject,$message,$options = array())
	{
		$this->load->library('email');
		$config = array (
                  'mailtype' => 'html',
                  'charset'  => 'utf-8',
                  'priority' => '1'
                );

		// $config = Array(
		//     'protocol' => 'smtp',
		//     'smtp_host' => 'ssl://smtp.googlemail.com',
		//     'smtp_port' => 465,
		//     'smtp_user' => 'ctinfotechindore@gmail.com',
		//     'smtp_pass' => 'android@123',
		//     'mailtype'  => 'html', 
		//     'charset'   => 'utf-8'
		// );
		//charset : iso-8859-1
        $this->email->initialize($config);
        if (isset($options['fromEmail']) && isset($options['fromName'])) {
			$this->email->from($options['fromEmail'], $options['fromName']);  
        }else{
			$this->email->from('support@taxi-app.com', 'Taxi App');        	
        }
		$this->email->to($to);
		if(isset($options['replyToEmail']) && isset($options['replyToName'])){
			$this->email->reply_to($options['replyToEmail'],$options['replyToName']);
		}
		$this->email->subject($subject);
		$this->email->message($message);
		if($this->email->send()){
			return true;
		}else{
			return false;
		}
	}






public function room_detail($where="",$options=array())
	{
		$this->db->select('R.id,R.tags,R.user_id,R.room_name,R.image,R.announcement,R.membership_fee,R.room_date,R.room_time,U.user_country,T.tag_name,R.status,R.id,room_lock_staus');
		$this->db->from('room_tbl as R');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('tag_tbl as T','T.tag_id = R.tags');
		$this->db->join('user as U','U.id = R.user_id');
		$this->db->order_by("R.id",'DESC');

		$res = $this->db->get()->result_array();
		
		if($res){	

		if (!empty($options) && in_array('count', $options)) {

			return count($res);
		}
				
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



	function get_join_three_table_where($table1,$table2,$table3,$id1,$id2,$id3,$id4,$column='',$where = '',$orderby = ''){
		if($column !='')
        {
            $this->db->select($column);
        }
        else
        {
            $this->db->select('*');
        }    
        
		$this->db->from($table1);
		$this->db->join($table2,$table2.'.'.$id1.'='.$table1.'.'.$id2);
	  	$this->db->join($table3,$table3.'.'.$id3.'='.$table1.'.'.$id4);
		if($where != ''){
			$this->db->where($where);	
		}
		if($orderby!='')
			{
				$this->db->order_by($orderby, 'desc');
			}
	  	$query=$this->db->get();
	  	return $query->result_array();
	}



	public function do_upload($file,$path)
    { 	
        $config['upload_path']          = $path;
        $config['allowed_types']        = 'gif|jpg|png|gif|jpeg|wmv';
        $config['encrypt_name']        = true;
        // $config['max_size']             = 100;
        // $config['max_width']            = 1024;
        // $config['max_height']           = 768;

        $this->load->library('upload');
        $this->upload->initialize($config);
        
        if ( ! $this->upload->do_upload($file))
        {
            $error = array('error' => $this->upload->display_errors());
            return $error;
        }
        else
        {
            $data = array('upload_data' => $this->upload->data());
            return $data;
        }
    }




    public function do_upload_thumb($file,$path)
    { 	
        $config['upload_path']          = $path;
        $config['allowed_types']        = 'gif|jpg|png|gif|jpeg|wmv';
        $config['encrypt_name']        = true;
        // $config['max_size']             = 100;
        // $config['max_width']            = 1024;
        // $config['max_height']           = 768;

        $this->load->library('upload');
        $this->upload->initialize($config);
        
        if ( ! $this->upload->do_upload($file))
        {
            $error = array('error' => $this->upload->display_errors());
            return $error;
        }
        else
        {
        	$photo = $this->upload->file_name;
        	


        	$this->load->library('image_lib');
            $config['image_library'] = 'gd2';
            $config['source_image'] = $path.$photo;
            $config['new_image'] = $path.'/thumb/' . $photo;
            $config['maintain_ratio'] = TRUE;
            $config['width'] = 300;
            $config['height'] = 300;


            $this->image_lib->clear();
            $this->image_lib->initialize($config);

            if (!$this->image_lib->resize()) {
             	$error = array('error' => $this->image_lib->display_errors());
           	 	return $error;
            }



            $data = array('upload_data' => $this->upload->data());
            return $data;
        }
    }



    public function do_upload_file($file,$path)
    { 	
        $config['upload_path']          = $path;
        $config['allowed_types']        = 'gif|jpg|png|gif|3gp|mp4|avi|wmv';
        $config['encrypt_name']        = true;
        // $config['max_size']             = 100;
        // $config['max_width']            = 1024;
        // $config['max_height']           = 768;

        $this->load->library('upload');
        $this->upload->initialize($config);
        
        if ( ! $this->upload->do_upload($file))
        {
            $error = array('error' => $this->upload->display_errors());
            return $error;
        }
        else
        {
            $data = array('upload_data' => $this->upload->data());
            return $data;
        }
    }



    public function do_upload_file_document($file,$path)
    { 	
        $config['upload_path']          = $path;
        $config['allowed_types']        = '*';
        $config['encrypt_name']        = true;
        // $config['max_size']             = 100;
        // $config['max_width']            = 1024;
        // $config['max_height']           = 768;

        $this->load->library('upload');
        $this->upload->initialize($config);
        
        if ( ! $this->upload->do_upload($file))
        {
            $error = array('error' => $this->upload->display_errors());
            return $error;
        }
        else
        {
            $data = array('upload_data' => $this->upload->data());
            return $data;
        }
    }


    public function multi_upload($file,$path)
	{       
		$config = array();
	    $config['upload_path'] = $path; // upload path eg. - './resources/images/products/';
	    $config['allowed_types'] = '*';
	    $config['encrypt_name'] = true;
	    //$config['max_size']      = '0';
	    $config['overwrite']     = FALSE;
	    $this->load->library('upload',$config);
	    $dataInfo = array();
	    $files = $_FILES; 
	    	    
	    foreach ($files[$file]['name'] as $key => $image) {  
	    	
            $_FILES[$file]['name']= $files[$file]['name'][$key]; 
            $_FILES[$file]['type']= $files[$file]['type'][$key];
            $_FILES[$file]['tmp_name']= $files[$file]['tmp_name'][$key];
            $_FILES[$file]['error']= $files[$file]['error'][$key];
            $_FILES[$file]['size']= $files[$file]['size'][$key];

            $this->upload->initialize($config);

            if ($this->upload->do_upload($file)) {
               $dataInfo[] = $this->upload->data();
            } else {
                return $this->upload->display_errors();
            }
        }
	    if(!empty($dataInfo)){
	    	return $dataInfo;
	    }else{
	    	return false;
	    }
	}

	public function vehicleList($where="")
	{
		$this->db->select('VD.id,VD.vehicle_no,VD.status,VC.company,VM.model,VCl.class');
		$this->db->from('vehicle_detail as VD');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('vehicle_company as VC','VC.id = VD.vehicle_company_id');
		$this->db->join('vehicle_model as VM','VM.id = VD.model_id');
		$this->db->join('vehicle_class as VCl','VCl.id = VD.vehicle_class_id');
		$res = $this->db->get()->result_array();
		
		if($res){			
			return $res;
		}
		else
		{
			return false;
		}
	}







	public function get_eventList($where="",$options=array())
	{
		$this->db->select('SE.id,SE.title,SE.latitude,SE.longitude,SE.event_address,SE.price,SE.join_user,SE.price,SE.event_image,SE.join_user,SE.user_id,SE.game_id,SG.game_image,SE.event_user_type,SE.event_time,SE.event_duration,SE.event_participant_no,SE.event_description,SE.status,SG.game_name,');
		$this->db->from('sport_event as SE');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('sport_game as SG','SG.id = SE.game_id');
		$this->db->order_by("SE.id",'DESC');

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



	public function get_join_user($where="",$options=array())
	{
		$this->db->select('U.id,U.name,U.email,U.image');
		$this->db->from('join_event_tbl as JE');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('user as U','U.id = JE.join_id');
		$this->db->order_by("JE.id",'DESC');

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

	public function get_notification_salon($where="",$options=array())
	{
		$this->db->select('C.client_id,C.full_name,C.email,C.profile_image,NT.message,NT.date,NT.booking_id,NT.type,NT.id as Notification_id');
		$this->db->from('notification_salon_tbl as NT');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('client as C','C.client_id = NT.user_send_from');
		$this->db->order_by("NT.id",'DESC');

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



	public function get_notification_client($where="",$options=array())
	{
		$this->db->select('S.salon_id,S.full_name,S.email,S.profile_image,NT.message,NT.date,NT.type,NT.id as Notification_id');
		$this->db->from('notification_client_tbl as NT');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('salon as S','S.salon_id = NT.user_send_from');
		$this->db->order_by("NT.id",'DESC');

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



	function get_record_join_two_table($table1,$table2,$id1,$id2,$column='',$where='',$orderby=''){
        if($column !='')
        {
            $this->db->select($column);
        }
        else
        {
            $this->db->select('*');
        }    
        $this->db->from($table1);
        $this->db->join($table2,$table2.'.'.$id2.'='.$table1.'.'.$id1);        
        if($where !='')
        {
            $this->db->where($where);
        }
		if($orderby!='')
			{
				$this->db->order_by($orderby, 'desc');
			}
        $query=$this->db->get();
        return $query->result_array();
    }
		public function check_data($table_name, $where) {
		$this -> db -> select("*");
		$this -> db -> from($table_name);
		$this -> db -> where($where);
		$query = $this -> db -> get();

		if ($query -> num_rows() > 0) {
			return $query -> first_row();
		} else {
			return FALSE;
		}
	}



	public function getRatting($where="",$options=array())
	{
		$this->db->select('R.rating_id,R.rating,R.created_at,C.client_id,C.full_name as client_name,C.profile_image as client_profile_image');
		$this->db->from('rating_tbl as R');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('client as C','C.client_id = R.client_id');
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


	public function getSalonByBooking($where="",$options=array())
	{
		$this->db->select('B.booking_id, S.salon_id,S.salon_name,S.profile_image as salon_profile_image,S.location as salon_location,S.ios_token as salon_ios_token,S.android_token as salon_ndroid_token,C.client_id,C.full_name as client_name,C.profile_image as client_profile_image,C.ios_token as client_ios_token,C.android_token as client_android_token');
		$this->db->from('booking_tbl as B');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('salon as S','S.salon_id = B.salon_id');
		$this->db->join('client as C','C.client_id = B.client_id');
		$this->db->order_by("B.booking_id",'DESC');

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



	public function getOfferList($where="",$options=array(),$limit='', $start='')
	{
		$this->db->select('OT.offer_id,OT.offer_name,OT.discription,OT.discount_percent,OT.type,S.service_id,S.service_name,S.service_cost,S.descprition as serveice_discription,SA.salon_id,SA.salon_name');
		$this->db->from('offer_tbl as OT');
		if($where != ""){
			$this->db->where($where);
		}
		$this->db->join('service_tbl as S','S.service_id = OT.service_id');
		$this->db->join('salon as SA','SA.salon_id = S.salon_id');
		$this->db->order_by("OT.offer_id",'DESC');

		if($limit!='')
		{
       		$this->db->limit($limit, $start);
    	}

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



	
	public function escortList($where="",$options=array(),$latitude,$longitude,$hour='')
	{
		
		$this->db->select('E.escort_id,E.first_name,E.last_name,E.email,E.profile_image,E.image1,E.image2,E.image3,E.image4,E.image5,E.image6,E.reset_code,E.country_code,E.phone_number,E.age,E.height,E.status,E.progress_status,E.latitude,E.longitude,C.id as country_id,C.name as country_name,B.body_type_id,B.name as body_type_name,CT.id as city_id,CT.name as city_name,G.gender_id,G.name as gender,BUST.bust_size_id,BUST.size as bust_size,CUP.cup_size_id,CUP.size as cup_size,W.waise_size_id,W.size as waise_size,H.hip_size_id,H.size as hip_size,ENG.english_id,ENG.type as english_type,CHI.chinese_id,CHI.type as chinese_type,JP.japanese_id,JP.type as japanese_type,K.korean_id,K.type as korean_type,(

		     3959 * acos (

		      cos ( radians("'.$latitude.'") )

		      * cos( radians( E.latitude ) )

		      * cos( radians( E.longitude ) - radians("'.$longitude.'") )

		      + sin ( radians("'.$latitude.'") )

		      * sin( radians( E.latitude ) )

		    )

		  ) * 1.609344 AS distance,E.online_status,(SELECT COUNT(id) FROM  favourite WHERE  escort_id = E.escort_id AND user_id = "'.$_REQUEST['user_id'].'") as favouriteStatus,(SELECT shots_price.amount FROM escort_rate INNER JOIN shots_price ON escort_rate.price = shots_price.shots_price_id WHERE escort_rate.escort_id = E.escort_id AND hour = "'.$hour.'") as shot_price,E.avg_rating,,(SELECT COUNT(id) FROM  escort_follow WHERE  escort_id = E.escort_id AND user_id = "'.$_REQUEST['user_id'].'") as followStatus,IFNULL(AG.agency_name,"") as agency');
		

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
		$this->db->join('agent as AG','AG.agent_id = E.agent_id', 'left');
		
		
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


		// agent filter
		if(!empty($_REQUEST['agent_filter']))
		{
			$this->db->where(array("E.agent_id"=>$_REQUEST['agent_filter']));
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




	




	public function bookingList($where="",$options=array())
	{
		
		$this->db->select('B.booking_id,B.user_id,B.escort_id,B.hour,B.shot,B.price,B.user_name,B.user_email,B.special_request,B.hotel,B.room_no,B.booking_date,B.booking_end_date,B.booking_expiry_date,B.booking_location,B.booking_latitude,B.booking_longitude,B.total_amount,B.request_status,B.created_at,H.name as hour_name,H.hour_time,S.name as shot_name,SP.name as price,U.first_name as user_first_name,U.last_name as user_last_name,U.email as user_email,U.country_code as user_country_code,U.phone_number as user_phone_number,E.first_name as escort_first_name,E.last_name as escort_last_name,E.latitude as escort_latitude,E.longitude as escort_longitude,E.email as escort_email,E.profile_image as escort_profile_image,E.country_code as escort_country_code,E.phone_number as escort_phone_number,B.services,E.avg_rating as escort_rating,U.avg_rating as user_rating');
		

		$this->db->from('booking as B');
		$this->db->join('user as U','U.user_id = B.user_id');
		$this->db->join('escort as E','E.escort_id = B.escort_id');
		$this->db->join('hours as H','H.hour_id = B.hour');
		$this->db->join('shots as S','S.shot_id = B.shot');
		$this->db->join('shots_price as SP','SP.shots_price_id = B.price');
		$this->db->order_by("B.booking_id",'DESC');
		
		
		
		if($where != ""){
			$this->db->where($where);
		}

		

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



	public function escortListCount($where="",$options=array())
	{
		
		$this->db->select('E.escort_id,E.first_name,E.last_name,E.email,E.profile_image,E.image1,E.image2,E.image3,E.image4,E.image5,E.image6,E.reset_code,E.country_code,E.phone_number,E.age,E.height,E.status,E.progress_status,E.latitude,E.longitude,C.id as country_id,C.name as country_name,B.body_type_id,B.name as body_type_name,CT.id as city_id,CT.name as city_name,G.gender_id,G.name as gender,BUST.bust_size_id,BUST.size as bust_size,CUP.cup_size_id,CUP.size as cup_size,W.waise_size_id,W.size as waise_size,H.hip_size_id,H.size as hip_size,ENG.english_id,ENG.type as english_type,CHI.chinese_id,CHI.type as chinese_type,JP.japanese_id,JP.type as japanese_type,K.korean_id,K.type as korean_type,(

		     3959 * acos (

		      cos ( radians("'.$_REQUEST['latitude'].'") )

		      * cos( radians( E.latitude ) )

		      * cos( radians( E.longitude ) - radians("'.$_REQUEST['longitude'].'") )

		      + sin ( radians("'.$_REQUEST['latitude'].'") )

		      * sin( radians( E.latitude ) )

		    )

		  ) * 1.609344 AS distance');
		

		$this->db->from('escort as E');
		$this->db->join('countries as C','C.id = E.country_id');
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
		} else if(!empty($_REQUEST['start_age'])) {
			$where_age = "E.age <'".$_REQUEST['start_age']."'";	
			$this->db->where($where_age);
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
			$this->db->where(array("G.gender_id"=>$_REQUEST['gender']));
		}

		
		// country filter
		if(!empty($_REQUEST['country']))
		{
			$this->db->where(array("C.id"=>$_REQUEST['country']));
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

	


	function query($sql,$options=array()) {
       $query = $this->db->query($sql);
       $result = $query->result_array();
       if($result){
			if(isset($options) && in_array('single',$options)){ 
				return $result[0];
			}else{
				return $result;
			}
		}else{
			return false;
		}
   }


}
