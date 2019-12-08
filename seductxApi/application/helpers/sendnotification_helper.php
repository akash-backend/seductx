<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');





function send_notification($tokens, $message)

{	

	$url = 'https://fcm.googleapis.com/fcm/send';

	$fields = array(

			 	'notification' => $message,

			 	'to' => $tokens

			);





	$headers = array(

		'Authorization:key=AIzaSyBYHGAHeu3tKid0gT1MlSXiZULOVrl-FaM',

		'Content-Type: application/json'

	);

	

	$ch = curl_init();

	curl_setopt($ch, CURLOPT_URL, $url);

	curl_setopt($ch, CURLOPT_POST, true);

	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

	curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0);  

	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

	curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));

	$result = curl_exec($ch);           

	if ($result === FALSE) {

	   die('Curl failed: ' . curl_error($ch));

	}

	curl_close($ch);

	// echo"<pre>";

	// print_r($result);

	// die();

	return $result;



	

}



?>