
<link href="<?= base_url('assets/css/base.css'); ?>" rel='stylesheet' type='text/css' />
<style type="text/css">
	

	.border-box {

    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0,0,0,.125);
    border-radius:6px;
    margin: 20px 0;
    padding:10px;
}
.border-box h4 {
  margin-top: 0px;
  margin-bottom:0px;
  font-size: 2.0rem;
}
.border-box h3 {
  margin:10px 0 0 0;
  color: #9c27b0
}
.border-box h3 span.small {
  color: #929292;
  font-size: 80%;
  font-weight: normal;
}
.border-box h4 span {
  font-weight: normal;
  font-size: 80%;
  color: #929292
}
.border-box p {
  margin-bottom: 0px;
  color: #929292;
  font-size: 1.6rem;
}
.border-box img {
  width: 100%;
  height: 480px;
  object-fit: cover;
  object-position: center;
  transition: all 0.3s ease;
  -webkit-transition: all 0.3s ease;
  -moz-transition: all 0.3s ease;
}
.border-box img:hover {
    -webkit-filter: grayscale(100%); /* Safari 6.0 - 9.0 */
  filter: grayscale(100%);
  cursor: pointer;
}
.position-relative {
  position: relative;
}
.p-30 {
  padding: 30px;
}
.profile-img {
    margin-bottom: 0px;
    margin-top: 30px;
}

.profile-img img {
    width: 180px;
    height: 180px;
    margin: 0 auto;
    text-align: center;
    border: 3px solid #eee;
    border-radius: 50%;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    -o-object-fit: cover;
    object-fit: cover;
    -o-object-position: center;
    object-position: center;
}

.yellow-rate {
    color: #ffb612;
    font-size: 2.6rem;
}	



.stats-tabs {
  padding: 0;
  margin: 3.2rem 0;
}

.stats-tabs li {
  display: inline-block;
  margin: 0 1.6rem 2.4rem 0;
  padding: 0 1.5rem 0 0;
  border-right: 1px solid #ffffff52;
}

.stats-tabs li:last-child {
  margin: 0;
  padding: 0;
  border: none;
}

.stats-tabs li a {
  display: inline-block;
  font-family: "Chivo", sans-serif;
  font-weight: 700;
  font-size: 1.6rem;
  line-height: 1.6;
  border: none;
  color: #e8018a;
  text-align: center;
}

.stats-tabs li a:hover {
  color: #e8018a;
}

.stats-tabs li a em {
  display: block;
  margin: .8rem 0 0 0;
  font-family: "Nunito Sans", sans-serif;
  font-size: 1.5rem;
  line-height: 2.4rem;
  font-weight: normal;
  font-style: normal;
  color: #898989;
}

.btn.btn--primary,
button.btn--primary,
input[type="submit"].btn--primary,
input[type="reset"].btn--primary,
input[type="button"].btn--primary {
  background:#9c27b0;
  border-color:#9c27b0;
  color: #ffffff;
}

th, td {
    padding: 1.0rem 1.2rem 1.0rem;
    text-align: left;
    border-bottom: 1px solid #eaeaea;
    font-size: 1.4rem;
}


.escort-profile-main-css .tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.escort-profile-main-css .tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 15px;
  margin-bottom: 0px;
  border-radius: 0px;
}

.mt-10px {margin-top: 10px;}
.mt-15px {margin-top: 15px;}
.mt-20px {margin-top: 20px;}
.mb-10px {margin-bottom: 10px;}
.mb-15px {margin-bottom: 15px;}
.mb-20px {margin-bottom: 20px;}
.font-16 {font-size: 16px;}
.font-weight-bold {font-weight: bold;}

.escort-profile-main-css.call-tab .tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.escort-profile-main-css.call-tab .tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.escort-profile-main-css.call-tab .tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
.escort-profile-main-css.call-tab .tabcontent.active {
  display: block;
}

.badge {
      padding: 8px 14px;
    background-color: #ddd;
    border-radius: 4px;
    margin:3px 5px;
    float: left;
    font-size: 14px;
}
.badge.active {
  background-color:#e8018a;
  color: #fff;
}

.personal-details-form td {font-size: 16px;}

.float-right {float: right;}
.mb-0 {margin-bottom: 0px;}
.w-100 {width: 100%;}
.single-line-btn{
  margin: 5px;
  float:left;

}
.single-line-btn a {
  text-transform: capitalize;
  padding:8px 20px;
  margin-top: 15px;
}
</style>
    <section id="features" class="s-features search escort">
    <div class="row home-content__main">
        <div class="gutter-none">
            <div class="col-four text-center">
               <div class="border-box position-relative">
                  <div class="profile-img">
                    <img src="http://localhost/seductxApi/assets/escortfile/profile/7021b37f4eb978407016a6054dc784a2.jpg" alt="profile-image">
                  </div>
                  <h4 class="text-center"> <?php echo $escort['first_name']?> <span class="">(<?php echo $escort['age']?> year old)</span> </h4>
                  
                  <ul class="stats-tabs font-16 mt-15 mb-0">
                    <li><a href="#">Gender <em><?php echo $escort['gender']?></em></a></li>
                    <li><a href="#">Height <em><?php echo $escort['height']?> cm</em></a></li>
                    <li><a href="#">Body type <em><?php echo $escort['body_type_name']?></em></a></li>
                </ul>
                 

               </div> 
            </div>

            <div class="col-eight">
                <div class="border-box p-30 position-relative">
                <div class="profile-slide">

                </div>
                <h4 class="pb-30"> Personal details</h4>
                <div class="table-responsive">

                    <table class="w-100 personal-details-form">

                            <tbody>
                            <tr>
                                <td><strong> Agency </strong></td>
                                <td><?php echo $escort['agency']; ?></td>
                            </tr>
                            
                            <tr>
                                <td><strong> Bust Size </strong></td>
                                <td><?php echo $escort['bust_size']?></td>
                            </tr>

                            <tr>
                                <td><strong> Cup Size </strong></td>
                                <td><?php echo $escort['cup_size']?></td>
                            </tr>
                            <tr>
                                <td><strong> Waise Size </strong></td>
                                <td><?php echo $escort['waise_size']?></td>
                            </tr>

                            <tr>
                                <td><strong> Hip Size </strong></td>
                                <td><?php echo $escort['hip_size']?></td>
                            </tr>


                            <tr>
                                <td><strong> Nationality </strong></td>
                                <td><?php echo $escort['country_name']?></td>
                            </tr>

                            <tr>
                                <td><strong> Languages </strong></td>
                               
                                <td>
                                <?php if ($escort['english_id'] != '1') {?>English (<?php echo $escort['english_type']; ?>)
                             	<?php }?>


                             	<?php if ($escort['chinese_id'] != '1') {?>Chinese (<?php echo $escort['chinese_type']; ?>)
                             	<?php }?>


                             	<?php if ($escort['japanese_id'] != '1') {?>Japanese (<?php echo $escort['japanese_type']; ?>)
                             	<?php }?>


                             	<?php if ($escort['korean_id'] != '1') {?>Korean (<?php echo $escort['korean_type']; ?>)
                             	<?php }?>



                             </td>


                            </tr>

                            <tr>
                                <td><strong>Services  </strong></td>
                                <td> 
                                	<?php 
                                	if(!empty($escort['addtional_service'])) {
                                		foreach ($escort['addtional_service'] as $key => $value) {   	
                                	?>
                                    <span class="badge active"><?php echo $value['service_title'] ?></span>

                                    <?php
                                 		}}
                                    ?>


                                    <?php 
                                	if(!empty($escort['service'])) {


                                		foreach ($escort['service'] as $key => $value) {
                   
                                	?>
                                    <span class="badge"><?php echo $value['title'] ?></span>

                                    <?php
                                 		}}
                                    ?>
                                    <span class="badge">CIM</span>
                                    <span class="badge">COB</span>
                                    <span class="badge">COF</span>
                                    <span class="badge">Daty</span>
                                    <span class="badge">Message</span>
                                </td>
                            </tr>

                            <tr>
                                <td><strong> Response time   </strong></td>
                                <td>Always responds within 10 mins</td>
                            </tr>

                          

                            <tr>
                                <td><strong>Traking  </strong></td>
                                <td>Not available</td>
                            </tr>
                            </tbody>
                    </table>

                </div>
                <div class="escort-profile-main-css call-tab escort-profile-main-css mt-20px">

                    <div class="tab">
                      <button class="tablinks">Incall</button>
                      <button class="tablinks">Outcall</button>
                    </div>

                    <div id="incall" class="tabcontent active">
                      <div class="table-responsive">

                    <table class="w-100">
                        <thead>
                            <th> <strong>Duration </strong> </th>
                            <th> <strong>Price</strong> </th>
                            <th> <strong>Shots</strong> </th>
                        </thead>

                            <tbody>
                            <?php 
                              foreach ($escort['rate'] as $key => $value) {
                            ?>
                            <tr>
                                <td><?php echo $value['hour_name']?> </td>
                                <td><?php echo $value['amount']?></td>
                                <td><?php echo $value['shot_name']?></td>
                            </tr>

                        <?php } ?>
                            
                       </tbody>
                   </table>
               </div>
                    </div>

                    <div id="outcall" class="tabcontent">
                      
                      <p>Sorry incall is not available in Bangkok</p> 
                    </div>
                </div>

                <div class="payment-box">
                    <h5 class="font-16 font-weight-bold mt-20px"> Payment method </h5>
                    <p class="mt-10px"><?php echo $escort['payment_method']; ?></p>
                </div>
                <div class="payment-box">
                    <h5 class="font-16 font-weight-bold mt-20px"> Cancellation policy </h5>
                    <p class="mt-10px"><?php echo $escort['cancellation_policy']; ?></p>
                </div>
                <div class="d-flex">
                <div class="single-line-btn">
                  <a href="<?= base_url('admin/escortBookingList/'.$escort['escort_id']."/1"); ?>" class="btn btn-success user-request">accepted booking</a>
                </div>
                <div class="single-line-btn">
                  <a href="<?= base_url('admin/escortBookingList/'.$escort['escort_id']."/3"); ?>" class="btn btn-success user-request">started booking</a> 
                </div>
                <div class="single-line-btn">
                  <a href="<?= base_url('admin/escortBookingList/'.$escort['escort_id']."/4"); ?>" class="btn btn-success user-request">completed booking</a>
                </div>
              </div>  
              
            </div> <!-- border-box -->

            </div>
        </div>
    </div> <!-- home-content__main -->

    </section>
  
    