<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="theme-color" content="#24c6dc"/>
	<title>Seminar ITFest 2020</title>
	<link rel="icon" href="<?=base_url()?>assets/images/favvicon.png" type="image/png" />
	<link rel="stylesheet" href="<?=base_url()?>assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="<?=base_url()?>assets/css/main/style.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Architects+Daughter&display=swap" rel="stylesheet">
	<script src="<?=base_url()?>assets/custom/js/jquery-3.3.1.js"></script>
	<script src="https://unpkg.com/scrollreveal@4.0.0/dist/scrollreveal.min.js"></script>
        
        <style>
                .fsmall{
                        font-size: 12pt;
                        font-family: JOST_LIGHT;
                }
        </style>
        
</head>
<body>
	<nav class="navbar navbar-expand-sm fixed-top">
		<div class="container">
			<a href="<?=base_url()?>" class="navbar-brand navbar-brand-edit" onclick="$('body').animatescroll();">
				<div class="logo-nav"></div>
			</a>
			<button class="navbar-toggler navbar-dark" type="button" data-toggle="collapse" data-target="#mynavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link nav-link-edit" onclick="location.href='<?=base_url()?>#about-section'">TENTANG
							<div class="garis" id="br"></div>
						</a>
					</li>
					<!-- <li class="nav-item">
						<a class="nav-link nav-link-edit" onclick="location.href='<?=base_url()?>#seminar-section'">SEMINAR
							<div class="garis" id="br"></div>
						</a>
					</li> -->
					<li class="nav-item">
						<a class="nav-link nav-link-edit" onclick="location.href='<?=base_url()?>#kompetisi-section'">KOMPETISI
							<div class="garis" id="br"></div>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link nav-link-edit" onclick="location.href='<?=base_url()?>#acara-section'">ACARA
							<div class="garis" id="br"></div>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link nav-link-edit" onclick="location.href='<?=base_url()?>#timeline-section'">TIMELINE
							<div class="garis" id="br"></div>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link nav-link-edit" onclick="location.href='<?=base_url()?>#kontak-section'">KONTAK
							<div class="garis" id="br"></div>
						</a>
					</li>
					<li class="nav-item">
						<a href="<?=base_url('Peserta/signin')?>"><button class="btn px-5 signup">DAFTAR/MASUK</button></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
