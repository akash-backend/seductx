

<div class="forms">
	<h2 class="title1"><?= $title; ?></h2>
	<?= $this->session->flashdata('msg'); ?>
	<div class="row">		
		<div class="form-three widget-shadow">
			<form class="form-horizontal" method="post" action="<?php if(!empty($tag)){ echo site_url('admin/editTag');}else{
        	echo  base_url('admin/addTag');
        } ?>" enctype="multipart/form-data" >
				<h3 class="text-center">Tag Details</h3><br>
			
				<div class="form-group">
					<label for="focusedinput" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-8">
						<input type="text" name="tag_name" class="form-control" placeholder="Tag Name"  <?php if(!empty($tag)) echo 'value="'.$tag['tag_name'].'"'; ?>>

						   <p><?php echo form_error('tag_name', '<span class="error_msg">', '</span>'); ?></p>
					</div>					
				</div>				
			
				<div class="col-sm-offset-2">

					<?php if(!empty($tag)){ ?>
  <input type="hidden" name="id" value="<?php echo $tag['tag_id']; ?>">
                <input type="submit" name="submit" value="Edit" class="btn btn-success">
                <?php } else { ?>
                <input type="submit" name="submit" value="Add" class="btn btn-success">
                <?php } ?>


					
				</div>
			</form>
		</div>
	</div>
</div>	



