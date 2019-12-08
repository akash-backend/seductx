
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>

</head>
<body>

<div class="container">
  <center>
    <h2>Password Reset</h2>
  </center>
  <form id="formCheckPassword"  method="post" action="<?php echo site_url('ForgerPassword/updateAgentPassword'); ?>" enctype="multipart/form-data">
    <div class="form-group">
      <label for="usr">Password:</label>
      <input type="password" class="form-control" id="password" name="password">
    </div>
    <div class="form-group">
      <label for="pwd">Confirm Password:</label>
      <input type="password" class="form-control" id="cfmPassword" name="cfmPassword">
      <input type="hidden"  name="agent_id" value="<?php echo $agent_id ?>">
    </div>
     <div class="form-group">
      <button class="btn btn-info btn-block" type="submit">Sign in</button>

     </div>
  </form>
</div>
</body>
</html>

<script type="text/javascript">
  
   $("#formCheckPassword").validate({
           rules: {
               password: { 
                 required: true,
                    minlength: 6,
                    maxlength: 10,

               } , 

                   cfmPassword: { 
                    equalTo: "#password",
                     minlength: 6,
                     maxlength: 10
               }


           },
     messages:{
         password: { 
                 required:"the password is required"
         },

     }

});
</script>