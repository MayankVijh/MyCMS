<?php


if(isset($_GET['edit_user']))
{
    $the_user_id=$_GET['edit_user'];
    $query= "SELECT * FROM users WHERE user_id = $the_user_id ";
    $select_users_query = mysqli_query($connection,$query);
    while($row = mysqli_fetch_assoc($select_users_query))
    {
        $user_id = $row['user_id'];
        $username = $row['username'];
        $user_password = ""; //$row['user_password'];
        $user_firstname = $row['user_firstname'];
        $user_lastname = $row['user_lastname'];
        $user_email = $row['user_email'];
        $user_image = $row['user_image'];
        $user_role = $row['user_role'];
    }
    
     
}

if (isset($_POST['edit_user']))
{
      $username = $_POST['username'];
        $user_password = $_POST['user_password'];
        $user_firstname = $_POST['user_firstname'];
        $user_lastname = $_POST['user_lastname'];
       
        $user_email = $_POST['user_email'];
        $user_role = $_POST['user_role'];
    
    
    $query = "SELECT randSalt FROM users";
    $select_randsalt_query = mysqli_query($connection, $query);
    if(!$select_randsalt_query)
    {
        die("QUERY FAILED" . mysqli_error($connection));
    }
    
    $row = mysqli_fetch_array($select_randsalt_query);
    $salt = $row['randSalt'];
    $hashed_password = crypt($user_password, $salt);
    
    
    if(!empty($user_password)) {

$query = "UPDATE users SET ";
$query .="user_password = '{$hashed_password}' ";

$query .= "WHERE user_id = {$the_user_id} ";

$edit_user_password = mysqli_query($connection,$query);

confirmQuery($edit_user_password);

}


     
     $query = "UPDATE users SET ";
     $query .="user_firstname = '{$user_firstname}', ";
     $query .="user_lastname = '{$user_lastname}', ";
     $query .="user_role = '{$user_role}', ";
     $query .="username = '{$username}', ";
     $query .="user_email = '{$user_email}' ";
     
     $query .="WHERE user_id = {$the_user_id} ";

       $edit_user_post = mysqli_query($connection,$query);
     confirmQuery($edit_user_post);
     echo "User Updated: " . " " . "<a href='users.php'>View Users</a>";

}


?>
   

   
   
   <form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="title">First Name</label>
        <input type="text" value="<?php echo $user_firstname;?>" class="form-control" name="user_firstname">
        
    </div>
    
     <div class="form-group">
        <label for="title">Last Name</label>
        <input type="text" value="<?php echo $user_lastname;?>" class="form-control" name="user_lastname">
        
    </div>
    
    <div class="form-group">
    <select name="user_role" id="">
            <option value="<?php echo $user_role; ?>"><?php echo $user_role; ?></option>

<?php
if ($user_role == 'admin')
{
echo "<option value='subscriber'>subscriber</option>";
}
else
{
    echo "<option value='admin'>admin</option>";
}

?>
       
       
       

        
    </select>
       </div>
   
    
    <div class="form-group">
        <label for="post_author">Username</label>
        <input type="text" value="<?php echo $username;?>" class="form-control" name="username">
        
    </div>
    <div class="form-group">
        <label for="post_status">Email</label>
        <input type="email" value="<?php echo $user_email;?>" class="form-control" name="user_email">
        
    </div>
    <div class="form-group">
        <label for="post_image">Password</label>
        <input type="password" value="<?php echo $user_password;?>" class="form-control" name="user_password">
        
    </div>
    
    </div>
    <div class="form-group">
       <input type="submit" class="btn btn-primary" name="edit_user" value="Edit User">
    </div>
    
    
    
    
    
</form>