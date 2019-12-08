

<div class="forms">
	<h2 class="title1"><?= $title; ?></h2>
	<?= $this->session->flashdata('msg'); ?>
	<div class="row">		
		<div class="form-three widget-shadow">
			<form class="form-horizontal" method="post" action="<?php if(!empty($unique_id)){ echo site_url('admin/editUniquieId');}else{
        	echo  base_url('admin/addUniqueId');
        } ?>" enctype="multipart/form-data" >
				<h3 class="text-center">Unique Id Details</h3><br>
			
				<div class="form-group">
					<label for="focusedinput" class="col-sm-2 control-label">Unique Id</label>
					<div class="col-sm-8">
						<input type="text" name="unique_id" class="form-control" placeholder="Unique Id"  <?php if(!empty($unique_id)) echo 'value="'.$unique_id['unique_id'].'"'; ?>>

						   <p><?php echo form_error('unique_id', '<span class="error_msg">', '</span>'); ?></p>
					</div>					
				</div>


				<div class="form-group">
					<label for="focusedinput" class="col-sm-2 control-label">Price</label>
					<div class="col-sm-8">
						<input type="text" name="price" class="form-control" placeholder="Price"  <?php if(!empty($unique_id)) echo 'value="'.$unique_id['price'].'"'; ?>>

						   <p><?php echo form_error('price', '<span class="error_msg">', '</span>'); ?></p>
					</div>					
				</div>

			
								
				
				
			
				
			
				<div class="col-sm-offset-2">

					<?php if(!empty($unique_id)){ ?>
  <input type="hidden" name="id" value="<?php echo $unique_id['id']; ?>">
                <input type="submit" name="submit" value="Edit" class="btn btn-success">
                <?php } else { ?>
                <input type="submit" name="submit" value="Add" class="btn btn-success">
                <?php } ?>


					
				</div>
			</form>
		</div>
	</div>
</div>	



