
<div class=height20 clear"></div>
<div class="col-sm-12">	
    <?php echo $this->session->userdata('msg'); ?> 
 	
    <form class="form-horizontal" method="post" action="<?php if(!empty($terms)){ echo base_url('admin/edit_term_services');}else{
          echo  base_url('admin/addcategory');
        } ?>" >
      <fieldset>
        <legend><h1>Update Terms and Services</h1></legend>
        <div class="form-group" id="main">
         
          <div class="col-lg-12">
            
            <textarea class="form-control ckeditor" name="editor" required><?php echo $terms['info']; ?></textarea>



          </div>
        </div>
        
       
        <div class="form-group" style="position: absolute; bottom: -150px;">
          <div class="col-sm-3">
           <?php if(!empty($terms)){ ?>
  				<input type="hidden" name="id" value="<?php echo $terms['id']; ?>">
                <input type="submit" name="submit" value="Edit" class="btn btn-success" style="min-width: 180px;">
                <?php } else { ?>
                <input type="submit" name="submit" value="Add" class="btn btn-success" style="min-width: 180px;">
                <?php } ?>
          </div>
        </div>
      </fieldset>
    </form>
</div>
