

<div class="tables">
    <h2 class="title1"><?= $title; ?></h2>
    <?= $this->session->flashdata('msg'); ?>
    <div class="bs-example widget-shadow"> 
        
        <table class="table table-bordered" id="example"> 
            <thead> 
                <tr> 
                    <th>#</th>
                    <th>User Name</th>
                    <th>Rate</th>
                    <th>Duration</th>
                    <th>Location</th>
                    <th>Room number</th>
                    <th>User number</th>
                    <th>Provided Services</th>
                    <th>created at</th>
                </tr> 
            </thead> 
            <tbody> 
                <?php if (!empty($booking_list)){
                    foreach ($booking_list as $key => $value) { ?>
                    <tr>
                        <th scope="row"><?= ++$key; ?></th>
                        <td><?= $value['user_first_name']." ".$value['user_last_name']; ?></td>
                        <td><?= $value['total_amount']; ?></td>
                        <td><?= $value['hour_time']; ?></td>
                        <td><?= $value['booking_location']; ?></td>
                        <td><?= $value['room_no']; ?></td>
                        


                        <td><?= "+".$value['user_country_code']." ".$value['user_phone_number']; ?></td>
                        <td><?= $value['services']; ?></td>
                        <td><?= $value['booking_date']; ?></td>
                        
                        
                        
                    </tr>
                <?php }
            } ?>
            </tbody> 
        </table>
    </div>
</div>



