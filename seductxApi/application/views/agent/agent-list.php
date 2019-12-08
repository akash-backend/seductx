

<div class="tables">
    <h2 class="title1"><?= $title; ?></h2>
    <?= $this->session->flashdata('msg'); ?>
    <div class="bs-example widget-shadow"> 
        
        <table class="table table-bordered" id="example"> 
            <thead> 
                <tr> 
                    <th>#</th>
                    <th>Agentname</th>
                    <th>Agency Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Created at</th>
                    <th>Action</th>
                </tr> 
            </thead> 
            <tbody> 
                <?php if (!empty($agent)){
                    foreach ($agent as $key => $value) { ?>
                    <tr>
                        <th scope="row"><?= ++$key; ?></th>
                        <td><?= $value['first_name']." ".$value['last_name']; ?></td>
                        <td><?= $value['agency_name']; ?></td>
                        <td><?= $value['email']; ?></td>
                        <td><?= "+".$value['phonecode']." ".$value['phone_number']; ?></td>
                        <td><?= $value['created_at']; ?></td>
                        
                        <td>
                            <a href="<?= base_url($link.$value['agent_id']); ?>" class="btn btn-primary" ><i class="fa fa-eye"></i></a> &nbsp;


                           

                             <?php $status = $value['status']; ?>
                                <?php if ($status == 1) { ?>
                                <a href="<?php echo base_url('admin/change_status') . '/agent_id/' . $value['agent_id']; ?>/agent/status/2/agentList" class="btn btn-danger">BLOCK</a>
                                <?php } elseif ($status == 2) { ?>
                                <a href="<?php echo base_url('admin/change_status').'/agent_id/'.$value['agent_id']; ?>/agent/status/1/agentList" class="btn btn-success">UNBLOCK</a>
                                <?php } ?>



                        </td>      
                    </tr>
                <?php }
            } ?>
            </tbody> 
        </table>
    </div>
</div>


