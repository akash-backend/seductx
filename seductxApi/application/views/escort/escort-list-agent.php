
<div class="tables">
    <h2 class="title1"><?= $title; ?></h2>
    <?= $this->session->flashdata('msg'); ?>
    <div class="bs-example widget-shadow"> 
        
        <table class="table table-bordered" id="example"> 
            <thead> 
                <tr> 
                    <th>#</th>
                    <th>Escortname</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Ratting</th>
                    <th>Created at</th>
                    <th>Action</th>
                </tr> 
            </thead> 
            <tbody> 
                <?php if (!empty($escort)){
                    foreach ($escort as $key => $value) { ?>
                    <tr>
                        <th scope="row"><?= ++$key; ?></th>
                        <td><?= $value['first_name']." ".$value['last_name']; ?></td>
                        <td><?= $value['email']; ?></td>
                        <td><?= $value['phone_number']; ?></td>
                        <td><?= $value['avg_rating']; ?></td>
                        <td><?= $value['created_at']; ?></td>
                        
                        <td>
                            <a href="<?= base_url($link.$value['escort_id']); ?>" class="btn btn-primary" ><i class="fa fa-eye"></i></a> &nbsp;

                           



                        </td>      
                    </tr>
                <?php }
            } ?>
            </tbody> 
        </table>
    </div>
</div>


