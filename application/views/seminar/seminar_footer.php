	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-img-kontak">
					<hr><br>
					<a href="#"><img class="img-kontak" src="<?=base_url()?>assets/images/sosmed/warna/fb.png" alt="" width="30px"></a>
					<a href="https://www.instagram.com/itfestusu/"><img class="img-kontak" src="<?=base_url()?>assets/images/sosmed/warna/ig.png" alt="" width="30px"></a>
					<a href="#"><img class="img-kontak" src="<?=base_url()?>assets/images/sosmed/warna/twit.png" alt="" width="30px"></a>
					<a href="mailto:itfestusuhimatif@gmail.com"><img class="img-kontak" src="<?=base_url()?>assets/images/sosmed/warna/gplus.png" alt="" width="30px"></a>
					<p class="p-footer">© ITFest USU - Universitas Sumatera Utara.</p>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		// Scrolling Effect
	  $(window).on("scroll", function() {
	        if($(window).scrollTop()) {
	              $('nav').addClass('black');
	              $('.logo-nav').addClass('logo-nav-white');
	        }

	        else {
	              $('nav').removeClass('black');
	              $('.logo-nav').removeClass('logo-nav-white');
	        }
	  })
	</script>

	<script src="<?=base_url()?>assets/custom/js/jquery.min.js"></script>
	<script src="<?=base_url()?>assets/custom/js/popper.min.js"></script>
	<script src="<?=base_url()?>assets/custom/js/bootstrap.min.js"></script>
  <script src="<?=base_url()?>assets/custom/js/animatescroll.js"></script>
    <script>
		window.sr = ScrollReveal({reset:true});
		sr.reveal('.col-header', {
			duration: 2000,
			origin:'left',
			distance:'200px'
		});
		sr.reveal('.col-test', {
			duration: 2000,
			origin:'left',
			distance:'200px'
		});
		sr.reveal('.col-about-2', {
			duration: 2000,
			delay:500,
			origin:'bottom',
			distance:'200px'
		});
		sr.reveal('.col-kompetisi', {
			duration: 2000,
			origin:'left',
			distance:'200px'
		});
		sr.reveal('.card-columns', {
			duration: 2000,
			delay:500,
			origin:'bottom',
			distance:'100px'
		});
		sr.reveal('.col-acara', {
			duration: 2000,
			origin:'left',
			distance:'200px'
		});
		sr.reveal('.video-content', {
			duration: 2000,
			delay:500,
			origin:'bottom',
			distance:'200px'
		});
		sr.reveal('.col-timeline', {
			duration: 2000,
			origin:'top',
			distance:'100px'
		});
		sr.reveal('.text-timeline', {
			duration: 2000,
			delay:500,
			origin:'left',
			distance:'100px'
		});
	</script>
</body>
</html>
