<?php
$mysql_host = "127.0.0.1";
$mysql_port = "3306";
$mysql_user = "root";	# ID
$mysql_password = "DB_password";	# PW
$mysql_db = "user_db";			# DB name

$dbconn = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $mysql_db, $mysql_port) or die("DB connect failed.");
?>