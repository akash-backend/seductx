

<div class="tables">
    <h2 class="title1"><?= $title; ?></h2>
    <?= $this->session->flashdata('msg'); ?>
    <div class="bs-example widget-shadow"> 
        
        <table class="table table-bordered" id="example"> 
            <thead> 
                <tr> 
                    <th>#</th>
                    <th>Name</th>
                    <th>type</th>
                    <th>count</th>
                    <th>amount</th>
                    <th>Action</th>
                </tr> 
            </thead> 
            <tbody> 
                <?php if (!empty($userPlan)){
                    foreach ($userPlan as $key => $value) { ?>
                    <tr>
                        <th scope="row"><?= ++$key; ?></th>
                        <td><?= $value['name']; ?></td>
                        <td><?= $value['type']; ?></td>
                        <td><?= $value['count']; ?></td>
                        <td><?= $value['amount']; ?></td>
                        
                        <td>
                        
                            <a href="<?= base_url('admin/editSubscriptionPlan/'.$value['plan_id']); ?>" class="btn btn-primary" ><i class="fa fa-edit"></i></a> &nbsp;


                            <?php $status = $value['status']; ?>
                                <?php if ($status == 1) { ?>
                                <a href="<?php echo base_url('admin/change_status') . '/plan_id/' . $value['plan_id']; ?>/subscription_plan_user/status/2/userPlanList" class="btn btn-danger">BLOCK</a>
                                <?php } elseif ($status == 2) { ?>
                                <a href="<?php echo base_url('admin/change_status').'/plan_id/'.$value['plan_id']; ?>/subscription_plan_user/status/1/userPlanList" class="btn btn-success">UNBLOCK</a>
                                <?php } ?>



                            
                        </td>      
                    </tr>
                <?php }
            } ?>
            </tbody> 
        </table>
    </div>
</div>


