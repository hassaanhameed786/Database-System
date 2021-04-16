
<?php

$serverName = 'loalhost';
$username = 'root';
$password = '';
$dbname   = 'themepark';

// create a connection 

$conn = mysqli_connect($serverName ,$username ,$password ,$dbname);

if(mysqli_connect_error()){

    echo "failed to connect";
}
else
    echo"connect successfully";

?>
