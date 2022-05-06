<?php $title = 'TMOC'; ?>
<?php include('head.php'); ?>
<?php include('navbar.php'); ?>
<?php
    if(!isset($_SESSION['id'])){
        echo "<script>location.href='./login.php';</script>";
    }
    else{
?>
<body>
    <main role="main">
        <div class="jumbotron">
            <div class="container">
                <h1>Scoreboard</h1>
            </div>
        </div>
        <div class="row">
	    <div class="col-md-6 offset-md-3">
		<img class="w-100 mx-auto d-block" style="max-width: 500px;padding: 50px;padding-top: 14vh;" src="./img/under_construction.jpg" />
		<div class="text-center">
			<h2>Under Construction</h2>
		</div>
            </div>
        </div>
    </main>
</body>
<?php
    }
?>
<?php include('tail.php'); ?>
