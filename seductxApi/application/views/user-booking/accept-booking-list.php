

<div class="tables">
    <h2 class="title1"><?= $title; ?></h2>
    <?= $this->session->flashdata('msg'); ?>
    <div class="bs-example widget-shadow"> 
        
        <table class="table table-bordered" id="example"> 
            <thead> 
                <tr> 
                    <th>#</th>
                    <th>Escortname</th>
                    <th>Rate</th>
                    <th>Duration</th>
                    <th>Location</th>
                    <th>Room number</th>
                    <th>Escort number</th>
                    <th>Provided Services</th>
                    <th>request_status</th>
                    <th>created at</th>
                </tr> 
            </thead> 
            <tbody> 
                <?php if (!empty($escort)){
                    foreach ($escort as $key => $value) { ?>
                    <tr>
                        <th scope="row"><?= ++$key; ?></th>
                        <td><?= $value['escort_first_name']." ".$value['escort_last_name']; ?></td>
                        <td><?= $value['total_amount']; ?></td>
                        <td><?= $value['hour_time']; ?></td>
                        <td><?= $value['booking_location']; ?></td>
                        <td><?= $value['room_no']; ?></td>
                        


                        <td><?= "+".$value['escort_country_code']." ".$value['escort_phone_number']; ?></td>
                        <td><?= $value['request_status']; ?></td>
                        <td><?= $value['booking_date']; ?></td>
                        <td></td>
                        
                        
                    </tr>
                <?php }
            } ?>
            </tbody> 
        </table>
    </div>
</div>


