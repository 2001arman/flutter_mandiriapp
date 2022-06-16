<?php
define('HOST', 'localhost');
define('USER', 'root');
define('PASS', '');
define('DB', 'db_mandiri');

$con = mysqli_connect('localhost', 'root', '', 'db_mandiri');
if(!$con){
    echo("Gagal Terhubung ke Database!". mysqli_connect_error());
    die("Gagal Terhubung ke Database!". mysqli_connect_error());
} 