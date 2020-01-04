<!DOCTYPE html>
<html>
<head>
	<title>Login ITFest 4.0</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!--===============================================================================================-->
	<link rel="icon" href="<?=base_url()?>assets/images/favico.png" type="image/ico" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/login/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/login/css/main.css">
<!--===============================================================================================-->
<!-- Custom -->
<link href="<?=base_url()?>assets/custom/css/custom.css" rel="stylesheet">
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 wrap-login100mod">
				<a href="<?=base_url()?>"><div class="login100-pic js-tilt" data-tilt>
					<img src="<?=base_url()?>assets/images/logo.png" alt="ITFest 4.0">
				</div></a>

				<form class="login100-form validate-form" method="POST" id="login">
					<span class="login100-form-title text-white">
						LOGIN BENDAHARA
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Username is required">
						<input class="input100" type="text" id="username" name="username" placeholder="Username">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-at" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" id="password" name="password" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">
							Login
						</button>
					</div>
					<div class="text-center p-t-0">
						<span class="txt1">
							Kembali ke
						</span>
						<a class="txt2" href="<?=base_url()?>">
							Beranda
						</a>
					</div>
					<div class="text-center p-t-0">
						<span class="txt1">
							Beralih ke
						</span>
						<a class="txt2" href="<?=base_url('panitia')?>">
							Dashboard Panitia
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>




<!--===============================================================================================-->
	<script src="<?=base_url()?>assets/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="<?=base_url()?>assets/login/vendor/bootstrap/js/popper.js"></script>
	<script src="<?=base_url()?>assets/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<?=base_url()?>assets/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<?=base_url()?>assets/login/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="<?=base_url()?>assets/login/js/main.js"></script>

</body>
</html>


	<script src="<?=base_url()?>assets/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="<?=base_url()?>assets/login/vendor/bootstrap/js/popper.js"></script>
	<script src="<?=base_url()?>assets/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<?=base_url()?>assets/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<?=base_url()?>assets/login/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="<?=base_url()?>assets/login/js/main.js"></script>

</body>
</html>

<!-- <script type="text/javascript" src="ajax/login.js"></script> -->
<script type="text/javascript">
	$('#login').submit(function(e) {
		e.preventDefault();
		var showName = "<?php echo $this->session->userdata('name') ?>";
		var user = $('#username').val();
		var pwd = $('#password').val();
		$.ajax({
			url: '<?php echo base_url('bendahara/doLogin') ?>',
			type: 'post',
			data: {user, pwd},
			error: function(data){
				// Swal.fire('Login Gagal')
			},
			success: function(data){
				if (data==1) {
					console.log(data);
					Swal.fire({
						icon: 'success',
					  	title: 'Selamat Datang',
					  	text: 'Bendahara/Admin ITFest 4.0',
					  	showConfirmButton: false,
					  	timerProgressBar: true,
					  	timer: 1500,
					  	onBeforeOpen: () => {
					 			Swal.showLoading()
					 		}
					});
					setTimeout(function () {
       				window.location.href = "<?php echo base_url('bendahara/') ?>"; //will redirect to your blog page (an ex: blog.html)
    				}, 1500);
				}
				else{
					console.log(data);
					Swal.fire('Kesalahan', 'Username atau Password Salah', "error");
				}

			}
		})
	});

</script>
</html>
