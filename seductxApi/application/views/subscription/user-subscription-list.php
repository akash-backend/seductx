

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
                    <th>Plan Name</th>
                    <th>Amount</th>
                    <th>Created At</th>
                    <th>Expiry Date</th>
                    <th>subscription status</th>
                    <th>Action</th>
                </tr> 
            </thead> 
            <tbody> 
                <?php if (!empty($userSubscription)){
                    foreach ($userSubscription as $key => $value) { ?>
                    <tr>
                        <th scope="row"><?= ++$key; ?></th>
                        <td><?= $value['first_name']." ".$value['last_name']; ?></td>
                        <td><?= $value['email']; ?></td>
                        <td><?= "+".$value['phonecode']." ".$value['phone_number']; ?></td>
                        <td><?= $value['plan_name']; ?></td>
                        <td><?= $value['amount']; ?></td>
                        <td><?= $value['created_at']; ?></td>
                        <td><?= $value['expiry_date']; ?></td>
                        <td>
                             <?php if($value['subscription_status'] == 1 ) {
                                ?>
                                  <span class="label label-warning">Completed</span>
                            <?php
                            } else {?>
                                <span class="label label-danger">Pending</span>
                            <?php }?>
                        </td>
                        
                        <td>
                            <a href="<?= base_url($link.$value['user_id']); ?>" class="btn btn-primary" ><i class="fa fa-eye"></i></a>
                        </td>      
                    </tr>
                <?php }
            } ?>
            </tbody> 
        </table>
    </div>
</div>


