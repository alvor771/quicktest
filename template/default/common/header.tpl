<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- TITLE OF SITE -->
	<title>QuickTest | <?php echo $title; ?></title>

	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="">

	<!-- =========================
	   STYLESHEETS
	============================== -->

	<!-- BOOTSTRAP CSS -->
	<link href="/template/default/css/bootstrap.min.css" rel="stylesheet">
	<link href="/template/default/css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="/template/default/css/font-awesome.min.css" rel="stylesheet">
	<link href="/template/default/stylesheets/landing.css" rel="stylesheet">
	<link href="/template/default/css/radio-checkboxes.css" rel="stylesheet">

	<script src="/template/default/js/jquery-3.1.1.min.js"></script>
	<script src="/template/default/js/bootstrap.min.js"></script>
	<script src="/template/default/js/scripts.js"></script>

	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
		  rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Russo+One" rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,900,300italic,400italic,700italic,900italic"
		  rel="stylesheet" type="text/css">

	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

	<script src="https://bucket.cpabuild.com/assets/landing_pages/Chart.min.js"></script>
	<![endif]-->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
        google.charts.load("current", {packages:["corechart"]});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Task', 'Hours per Day'],
                ['Work',     11],
                ['Eat',      2],
                ['Commute',  2],
                ['Watch TV', 2],
                ['Sleep',    7]
            ]);

            var options = {
//                title: 'My Daily Activities',
                pieHole: 0.4,
                legend: 'none',
                pieSliceText: 'none',
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }
	</script>
</head>

<body>

<div class="main-container" id="page">

	<!-- HEADER -->
	<header id="top" style="" class="">
		<div class="container">
			<div class="col-md-4 top-col">

				<div class="login-form-1 m-y-md">
					<h5>Logowanie</h5>
					<div id="locationSpan">Location</div>
					<?php if (!$user): ?>
					<form id="login-form" method="post" action="app/sign" class="text-left">
						<div class="main-login-form">
							<div class="login-group">
								<div class="form-group">
									<label for="lg_username" class="sr-only">Username</label>
									<input type="text" class="form-control" id="lg_username" name="u_email" placeholder="Email">
								</div>
								<div class="form-group">
									<label for="lg_password" class="sr-only">Password</label>
									<input type="password" class="form-control" id="lg_password" name="u_password" placeholder="Password">
								</div>
								<div class="form-group">
									<i class="fa fa-google-plus"></i>
								</div>
							</div>
							<button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>
						</div>
					</form>
					<?php else: ?>
					Hello, <b><?php echo $user[0]->firstname, ' ', $user[0]->lastname; ?></b>
					<?php endif; ?>
				</div>
			</div>
		</div>
	</header>
	<div id="top-line"></div>