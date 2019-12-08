

<div class="forms">
	<h2 class="title1"><?= $title; ?></h2>
	<?= $this->session->flashdata('msg'); ?>
	<div class="row">		
		<div class="form-three widget-shadow">
			<form class="form-horizontal" method="post" action="<?php if(!empty($subscription_plan)){ echo site_url('admin/editEscortSubscriptionPlan');}else{
        	echo  base_url('admin/addEscortSubscriptionPlan');
        } ?>" enctype="multipart/form-data" >
				<h3 class="text-center">Subscription Details</h3><br>
			
			<div class="form-group">
				<label for="focusedinput" class="col-sm-2 control-label">Name</label>
				<div class="col-sm-8">
					<input type="text" name="name" class="form-control" placeholder="Subscription Plan Name"  <?php if(!empty($subscription_plan)) echo 'value="'.$subscription_plan['name'].'"'; ?>>
					<p><?php echo form_error('name', '<span class="error_msg">', '</span>'); ?></p>
				</div>					
			</div>



			<div class="form-group">
				<label for="focusedinput" class="col-sm-2 control-label">Duration Time</label>
				<div class="col-sm-2">
					<select name="count"  class="form-control">
                    	
						<?php
							for ($i=1; $i < 50; $i++) 
							{ 
						?>
						<option value="<?php echo $i; ?>" <?php if(!empty($subscription_plan)) { if($i == $subscription_plan['count']) { echo "selected"; } } ?>><?php echo $i; ?></option>
						<?php
							}
						?>
		       		</select>
              	 	<p> <?php echo form_error('count', '<span class="error_msg">', '</span>'); ?></p>
				</div>

				<div class="col-sm-6">
					<select name="type"  class="form-control">
                    	
						<option value="day" <?php if(!empty($subscription_plan)) { if('day' == $subscription_plan['type']) { echo "selected"; } } ?>>day</option>
						<option value="week" <?php if(!empty($subscription_plan)) { if('week' == $subscription_plan['type']) { echo "selected"; } } ?>>week</option>
						<option value="month" <?php if(!empty($subscription_plan)) { if('month' == $subscription_plan['type']) { echo "selected"; } } ?>>month</option>
						<option value="year" <?php if(!empty($subscription_plan)) { if('year' == $subscription_plan['type']) { echo "selected"; } } ?>>year</option>
		       		</select>
              	 	<p> <?php echo form_error('type', '<span class="error_msg">', '</span>'); ?></p>
				</div>					
			</div>


			<div class="form-group">
				<label for="focusedinput" class="col-sm-2 control-label">Price</label>
				<div class="col-sm-8">
					<input type="text" name="amount" class="form-control" placeholder="amount"  <?php if(!empty($subscription_plan)) echo 'value="'.$subscription_plan['amount'].'"'; ?>>
					<p><?php echo form_error('amount', '<span class="error_msg">', '</span>'); ?></p>
				</div>					
			</div>

				<div class="col-sm-offset-2">

					<?php if(!empty($subscription_plan)){ ?>
  <input type="hidden" name="id" value="<?php echo $subscription_plan['plan_id']; ?>">
                <input type="submit" name="submit" value="Edit" class="btn btn-success">
                <?php } else { ?>
                <input type="submit" name="submit" value="Add" class="btn btn-success">
                <?php } ?>


					
				</div>
			</form>
		</div>
	</div>
</div>	



