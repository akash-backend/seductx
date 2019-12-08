

<div class="forms">
	<h2 class="title1"><?= $title; ?></h2>
	<?= $this->session->flashdata('msg'); ?>
	<div class="row">		
		<div class="form-three widget-shadow">
			<form class="form-horizontal" method="post" action="<?php if(!empty($pin_top)){ echo site_url('admin/editPinTop');}else{
        	echo  base_url('admin/addPinTop');
        } ?>" enctype="multipart/form-data" >
				<h3 class="text-center">Pin Top Details</h3><br>
			
				<div class="form-group">
					<label for="focusedinput" class="col-sm-2 control-label">Minutes</label>
					<div class="col-sm-8">
						<input type="text" name="minutes"  id="timePicker" class="form-control" placeholder="Minutes"  <?php if(!empty($pin_top)) echo 'value="'.$pin_top['minutes'].'"'; ?>>

						   <p><?php echo form_error('minutes', '<span class="error_msg">', '</span>'); ?></p>
					</div>					
				</div>


				<div class="form-group">
					<label for="focusedinput" class="col-sm-2 control-label">Price</label>
					<div class="col-sm-8">
						<input type="text" name="price" class="form-control" placeholder="Price"  <?php if(!empty($pin_top)) echo 'value="'.$pin_top['price'].'"'; ?>>

						   <p><?php echo form_error('price', '<span class="error_msg">', '</span>'); ?></p>
					</div>					
				</div>

			
								
				
				
			
				
			
				<div class="col-sm-offset-2">

					<?php if(!empty($pin_top)){ ?>
  <input type="hidden" name="id" value="<?php echo $pin_top['id']; ?>">
                <input type="submit" name="submit" value="Edit" class="btn btn-success">
                <?php } else { ?>
                <input type="submit" name="submit" value="Add" class="btn btn-success">
                <?php } ?>


					
				</div>
			</form>
		</div>
	</div>
</div>	


<script>
	$().ready(function(e) {

		$('#timePicker').hunterTimePicker({
			callback: function(e){
				
			}
		});
		
		$(".time-picker").hunterTimePicker();
	});
</script>



