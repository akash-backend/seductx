
<style type="text/css">
.iii img {
    width: 100%; max-height:300px;
 }
</style>
<div class="forms">
    <h2 class="title1"><?= $title; ?></h2>

    <div class="alert alert-dismissible fade" role="alert"><span id="msg"></span>
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>



      <div class="row">
        <div class="form-three widget-shadow">  


            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="user-profile-pic">
                        <img class="img-responsive" src="<?php echo base_url('/assets/images/admin.png'); ?>">
                    </div>
                    <div class="mt-2">
                        <h2 class="text-theme-blue"><?= $user['first_name']." ".$user['last_name']; ?></h2>
                        <p class="mt-1"><?= $user['email']; ?></p>
                    </div>
                </div>
              </div>
            <div class="row mt-2">
                <div class="col-md-12">
                    <div class="mt-2">
                      <hr>
                      <p class="mt-1">
                        <div class="text-theme-blue font-weight-b w-20 float-left d-inline-block">Name</div>
                        <div class="w-30 float-left d-inline-block"><?= $user['first_name']." ".$user['last_name']; ?></div>
                      </p>
                      <hr class="clear mt-60">
                      <p class="mt-1">
                        <div class="text-theme-blue font-weight-b w-20 float-left d-inline-block">Phone Number</div>
                        <div class="w-30 float-left d-inline-block"><?= "+".$user['phonecode'].
                      $user['phone_number']; ?></div>
                      </p>
                      <hr class="clear mt-60">
                      <p class="mt-1">
                        <div class="text-theme-blue font-weight-b w-20 float-left d-inline-block">Email</div>
                        <div class="w-30 float-left d-inline-block"><?= $user['email']; ?></div>
                      </p>
                    </div>
                </div>        
            </div>
             <a href="<?= base_url('admin/userBookingList/'.$user['user_id']."/1"); ?>" class="btn btn-success user-request">accepted booking</a>
             <a href="<?= base_url('admin/userBookingList/'.$user['user_id']."/3"); ?>" class="btn btn-success user-request">started booking</a> 
             <a href="<?= base_url('admin/userBookingList/'.$user['user_id']."/4"); ?>" class="btn btn-success user-request">completed booking</a>
        </div>        
    </div>

    
</div>






