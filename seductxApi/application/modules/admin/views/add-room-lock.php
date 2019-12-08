

<div class="forms">
	<h2 class="title1"><?= $title; ?></h2>
	<?= $this->session->flashdata('msg'); ?>
	<div class="row">		
		<div class="form-three widget-shadow">
			<form class="form-horizontal" method="post" action="<?php if(!empty($room)){ echo site_url('admin/editRoomLock');}else{
        	echo  base_url('admin/addRoomLock');
        } ?>" enctype="multipart/form-data" >
				<h3 class="text-center">Room Lock Details</h3><br>
			
				<div class="form-group">
					<label for="focusedinput" class="col-sm-2 control-label">Month</label>
					<div class="col-sm-8">
						<input type="text" name="month"   class="form-control" placeholder="Month"  <?php if(!empty($room)) echo 'value="'.$room['month'].'"'; ?>>

						   <p><?php echo form_error('month', '<span class="error_msg">', '</span>'); ?></p>
					</div>					
				</div>


				<div class="form-group">
					<label for="focusedinput" class="col-sm-2 control-label">Price</label>
					<div class="col-sm-8">
						<input type="text" name="price" class="form-control" placeholder="Price"  <?php if(!empty($room)) echo 'value="'.$room['price'].'"'; ?>>

						   <p><?php echo form_error('price', '<span class="error_msg">', '</span>'); ?></p>
					</div>					
				</div>

			
								
				
				
			
				
			
				<div class="col-sm-offset-2">

					<?php if(!empty($room)){ ?>
  <input type="hidden" name="id" value="<?php echo $room['id']; ?>">
                <input type="submit" name="submit" value="Edit" class="btn btn-success">
                <?php } else { ?>
                <input type="submit" name="submit" value="Add" class="btn btn-success">
                <?php } ?>


					
				</div>
			</form>
		</div>
	</div>
</div>	





