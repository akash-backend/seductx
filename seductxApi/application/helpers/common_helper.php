<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
include(APPPATH.'third_party/phpmailer/PHPMailerAutoload.php');


	function mail_smtp($email,$subject,$template)
	{


	    $mail = new PHPMailer();

	    $mail->isSMTP();

	    $mail->Host = "mail.ctinfotech.com";

	    $mail->SMTPSecure = 'ssl';

	    $mail->isHTML(true);

	    $mail->SMTPAuth = true;

	    $mail->Port = 25;

	    $mail->Username = 'akash@ctinfotech.com';

	    $mail->Password = 'JM]ITf&u.Z(x';

	    $mail->SMTPSecure = false;



	    $mail->setFrom('akash@ctinfotech.com', 'Seductx');

	    $mail->addAddress($email);

	    $mail->Subject = $subject;

	    $mail->Body = $template;

	    $mail->send();

	    $mail->SMTPDebug  = 2;

	    // echo"<pre>";

	    // print_r($mail->send());

	    // die();



	    // if ($mail->send())

	    // { 

	    //   echo "Mail sent";

	    //   die();

	    // }

	    // else

	    // {

	    //   echo "error_log(message)";

	    // }

	 

	    

	}
