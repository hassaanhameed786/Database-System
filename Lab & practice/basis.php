<?php

echo "hello world";
// // varaiables 

$username = "Ali Ahmad";
echo $username;

$mycount = 1;
echo "<br />".$mycount;

// array in php 

$class = array("hassy", "mak", "sh7", "mubi");
echo "<br>" .$class[0]. " " .$class[1]. " " .$class[3]. " " .$class[2];

// testing varaible type 

$test_var;

echo gettype($test_var)."<br>";



//PHP CONDITIONALS

$count =4;

if($count > 0)
{
echo "true";
}

else{
    echo"false";
}


// The ? Operator

$fuel =13;
echo $fuel <= 1 ? "Fill tank now" : "There's enough fuel";


// while Loop


$widgetsLeft = 10;

while ( $widgetsLeft > 0 ){

echo "Selling a widget... ";
$widgetsLeft--;
echo "done. There are $widgetsLeft widgets left. < br / > ";

}

echo "We ’ re right out of widgets!";


//do‐while Loop

$width = 1;
$length = 1;
do {
$width++;
$length++;

$area = $width * $length;
} 
while ( $area < 1000)
echo "The smallest square over 1000 sq ft in area is" .$width  "ft x"  .$length "ft "; 



?>

