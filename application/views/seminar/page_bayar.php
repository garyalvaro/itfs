<?php $this->load->view('seminar/seminar_header'); ?>

	<section class="mt-5 pt-5">
		<div class="container pt-5">
			<div class="row">
				<div class="col-md-12 col-acara">
					<center>
                                                <h1 class="h1-kompetisi">Pembayaran</h1>
					        <hr class="hr-kompetisi mb-5">
                                        </center>
                                        
                                        <div class="col-lg-6 col-xs-12 px-5 pb-5 float-left">
                                                <h1>Judul Seminar</h1>
                                                <p style="font-family: 'Architects Daughter', cursive;" class="text-secondary">Nama Pembicara</p>
                                                <br>
                                                <p  style="font-family: 'JOST_LIGHT';" class="text-secondary" align="justify">
                                                        Sepatah dua patah seminar. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero, accusamus, sed, necessitatibus ea nemo hic molestias amet tempora fuga pariatur officia itaque eum quis rerum aliquam minus illo nulla laborum!
                                                </p>

                                        </div>

                                        <div class="col-lg-6 col-xs-12 px-5 float-left">
                                                <h2>Pembayaran</h2>
                                                <br>
                                                
                                                <?php if($this->session->flashdata()):?>
                                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                                <?php echo $this->session->flashdata('regis_berhasil'); ?>
                                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                                </button>
                                                        </div>
                                                        <br>
                                                <?php endif; ?>
                                                
                                                <p  style="font-family: 'JOST_LIGHT';" class="text-secondary" align="justify">
                                                        Pembayaran dilakukan dengan mentransfer dana sebesar RpXXX.XXX,- ke rekening bank :
                                                                <h1>BCA - 000 000 0000</h1>
                                                         a.n. Siapapun Itu
                                                </p>
                                                <br>
                                                
                                                <a href="<?= base_url();?>Seminar/registered" class="btn btn-info btn-block rounded-0">Bayar Sekarang</a>
                                                <a href="<?= base_url();?>Seminar" class="btn btn-secondary btn-block rounded-0">Bayar Nanti</a>
                                                <br>


<!--
COBA-COBA QRCODE
<?php $kode_seminar = 'ABC'; ?>                                        
<div style='text-align: center;'>
  <img alt='Barcode'
       src='https://barcode.tec-it.com/barcode.ashx?data=<?php echo $kode_seminar; ?>&code=MobileQRCode&multiplebarcodes=false&translate-esc=false&unit=Fit&dpi=96&imagetype=Gif&rotation=0&color=%23000000&bgcolor=%23ffffff&qunit=Mm&quiet=0&eclevel=L'/>
</div>
-->

                                                
                                                
                                        </div>

				</div>
			</div>
		</div>
	</section>

<?php $this->load->view('seminar/seminar_footer'); ?>