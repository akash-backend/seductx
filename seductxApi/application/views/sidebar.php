
<aside class="sidebar-left">
  <nav class="navbar navbar-inverse">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".collapse" aria-expanded="false">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      </button>
      <h1><a class="navbar-brand" href="<?= base_url('admin/dashboard'); ?>"> 

        <img class="img-responsive" style="display: inline-block; width: 80px; vertical-align: sub; margin-top: 1px;" src="<?php echo base_url('/assets/logo.png'); ?>" height="200" width="200"> </a></h1>

        
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>

        <li class="treeview">
          <a href="<?= base_url('admin/dashboard'); ?>">
          <i class="fa fa-dashboard"></i> <span>Dashboard</span>
          </a>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i>
            <span>User</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?= base_url('admin/userList'); ?>"><i class="fa fa-angle-right"></i> user List</a></li>
           
          </ul>
        </li>  


         <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i>
            <span>Escort</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?= base_url('admin/escortList'); ?>"><i class="fa fa-angle-right"></i> escort List</a></li>
           
          </ul>
        </li>  

         <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i>
            <span>Agent</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?= base_url('admin/agentList'); ?>"><i class="fa fa-angle-right"></i> agent List</a></li>
           
          </ul>
        </li>  


         <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i>
            <span>Subscrption</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?= base_url('admin/escortSubscriptionList'); ?>"><i class="fa fa-angle-right"></i>Subscription Escort List</a></li>


             <li><a href="<?= base_url('admin/userSubscriptionList'); ?>"><i class="fa fa-angle-right"></i>Subscription User List</a></li>
           
          </ul>
        </li>  


         <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i>
            <span>Plan</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?= base_url('admin/userPlanList'); ?>"><i class="fa fa-angle-right"></i> User Plan List</a></li>
            <li><a href="<?= base_url('admin/addUserSubscriptionPlan'); ?>"><i class="fa fa-angle-right"></i> Add User Plan</a></li>
            <li><a href="<?= base_url('admin/escortPlanList'); ?>"><i class="fa fa-angle-right"></i> Escort Plan List</a></li>
            <li><a href="<?= base_url('admin/addEscortSubscriptionPlan'); ?>"><i class="fa fa-angle-right"></i> Add Escort Plan</a></li>
          </ul>
        </li>  

        
          <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i>
            <span>Terms and services</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?= base_url('admin/edit_term_services'); ?>"><i class="fa fa-angle-right"></i> Show/Update Terms and services</a></li>
            
          </ul>
        </li>   


         <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i>
            <span>Privacy Policy</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?= base_url('admin/edit_privacy_policy'); ?>"><i class="fa fa-angle-right"></i>Privacy Policy</a></li>
            
          </ul>
        </li>   

         <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i>
            <span>FAQ</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?= base_url('admin/edit_faq'); ?>"><i class="fa fa-angle-right"></i>FAQ</a></li>
            
          </ul>
        </li>   
        
      </ul>
    </div>
      <!-- /.navbar-collapse -->
  </nav>
</aside>
  </div>

  </div>
<!--left-fixed -navigation-->

<!-- header-starts -->
<div class="sticky-header header-section ">
  <div class="header-left">
    <!--toggle button start-->
    <button id="showLeftPush"><i class="fa fa-bars"></i></button>
    <!--toggle button end-->
    <div class="profile_details_left"><!--notifications of menu start -->      
      <div class="clearfix"> </div>
    </div>
    <!--notification menu end -->
    <div class="clearfix"> </div>
  </div>
  <div class="header-right">
    
    
    
    
    <div class="profile_details">   
      <ul>
        <li class="dropdown profile_details_drop">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
            <div class="profile_img"> 
              <span class="prfil-img"><img src="<?= base_url('assets/images/admin.png'); ?>" alt="" height="50" width="50"> </span> 
              <div class="user-name">
                <p>Admin </p>
                <span>Administrator</span>
              </div>
              <i class="fa fa-angle-down lnr"></i>
              <i class="fa fa-angle-up lnr"></i>
              <div class="clearfix"></div>  
            </div>  
          </a>
          <ul class="dropdown-menu drp-mnu">
            <!-- <li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
            <li> <a href="#"><i class="fa fa-user"></i> My Account</a> </li> 
            <li> <a href="#"><i class="fa fa-suitcase"></i> Profile</a> </li>  -->
            <li> <a href="<?= base_url('admin/logout'); ?>"><i class="fa fa-sign-out"></i> Logout</a> </li>
          </ul>
        </li>
      </ul>
    </div>
    <div class="clearfix"> </div>       
  </div>
  <div class="clearfix"> </div> 
</div>

<link rel="stylesheet" type="text/css" href="<?= base_url('assets/bootstap-validator/bootstrapValidator.min.js'); ?>">
<script type="text/javascript" src="<?= base_url('assets/bootstap-validator/bootstrapValidator.min.js'); ?>"></script>
<script type="text/javascript" src="<?= base_url('assets/bootstap-validator/companyValidation.js'); ?>"></script>

<div id="page-wrapper">
    <div class="main-page">