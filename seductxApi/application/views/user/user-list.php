

<div class="tables">
    <h2 class="title1"><?= $title; ?></h2>
    <?= $this->session->flashdata('msg'); ?>
    <div class="bs-example widget-shadow"> 
        
        <table class="table table-bordered" id="example"> 
            <thead> 
                <tr> 
                    <th>#</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Ratting</th>
                    <th>Created at</th>
                    <th>Action</th>
                </tr> 
            </thead> 
            <tbody> 
                <?php if (!empty($user)){
                    foreach ($user as $key => $value) { ?>
                    <tr>
                        <th scope="row"><?= ++$key; ?></th>
                        <td><?= $value['first_name']." ".$value['last_name']; ?></td>
                        <td><?= $value['email']; ?></td>
                        <td><?= "+".$value['phonecode']." ".$value['phone_number']; ?></td>
                        <td><?= $value['avg_rating']; ?></td>
                        <td><?= $value['created_at']; ?></td>
                        
                        <td>
                            <a href="<?= base_url($link.$value['user_id']); ?>" class="btn btn-primary" ><i class="fa fa-eye"></i></a> &nbsp;

                             <?php $status = $value['status']; ?>
                                <?php if ($status == 1) { ?>
                                <a href="<?php echo base_url('admin/change_status') . '/user_id/' . $value['user_id']; ?>/user/status/2/userList" class="btn btn-danger">BLOCK</a>
                                <?php } elseif ($status == 2) { ?>
                                <a href="<?php echo base_url('admin/change_status').'/user_id/'.$value['user_id']; ?>/user/status/1/userList" class="btn btn-success">UNBLOCK</a>
                                <?php } ?>



                        </td>      
                    </tr>
                <?php }
            } ?>
            </tbody> 
        </table>
    </div>
</div>


