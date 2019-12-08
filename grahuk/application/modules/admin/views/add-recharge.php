

<div class="forms">
	<h2 class="title1"><?= $title; ?></h2>
	<?= $this->session->flashdata('msg'); ?>
	<div class="row">		
		<div class="form-three widget-shadow">
			<form class="form-horizontal" method="post" action="<?php if(!empty($recharge)){ echo site_url('admin/editRecharge');}else{
        	echo  base_url('admin/addRecharge');
        } ?>" enctype="multipart/form-data" >
				<h3 class="text-center">Recharge Details</h3><br>
			
				<div class="form-group">
					<label for="focusedinput" class="col-sm-2 control-label">Coin</label>
					<div class="col-sm-8">
						<input type="text" name="coin" class="form-control" placeholder="coins"  <?php if(!empty($recharge)) echo 'value="'.$recharge['coin'].'"'; ?>>

						   <p><?php echo form_error('coin', '<span class="error_msg">', '</span>'); ?></p>
					</div>					
				</div>
				<div class="form-group">
					<label for="focusedinput" class="col-sm-2 control-label">Price</label>
					<div class="col-sm-8">
						<input type="text" name="price" class="form-control" placeholder="Price"  <?php if(!empty($recharge)) echo 'value="'.$recharge['price'].'"'; ?>>

						   <p><?php echo form_error('price', '<span class="error_msg">', '</span>'); ?></p>
					</div>					
				</div>

				

								
				
				
			
				
			
				<div class="col-sm-offset-2">

					<?php if(!empty($recharge)){ ?>
  <input type="hidden" name="id" value="<?php echo $recharge['id']; ?>">
                <input type="submit" name="submit" value="Edit" class="btn btn-success">
                <?php } else { ?>
                <input type="submit" name="submit" value="Add" class="btn btn-success">
                <?php } ?>


					
				</div>
			</form>
		</div>
	</div>
</div>	



