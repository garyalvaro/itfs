<?php $this->load->view('seminar/seminar_header'); ?>

	<section class="mt-5 pt-5">
		<div class="container pt-5">
			<div class="row">
				<div class="col-md-12 col-acara">
					<center>
                                                <h1 class="h1-kompetisi">Daftar Seminar</h1>
					        <hr class="hr-kompetisi mb-5">
                                        </center>
                                        
                                        <div class="col-lg-6 col-xs-12 px-5 pb-5 float-left">
                                                <h1><?php echo $judul_seminar; ?></h1>
                                                <p style="font-family: 'Architects Daughter', cursive;" class="text-secondary"><?php echo $nama_pembicara; ?></p>
                                                <br>
                                                <p  style="font-family: 'JOST_LIGHT';" class="text-secondary" align="justify">
                                                        <?php echo $tulisan_seminar; ?>
                                                </p>

                                        </div>

                                        <div class="col-lg-6 col-xs-12 px-5 float-left">
                                                <h2>Upload Bukti Pembayaran</h2>
                                                <br>
                                                
                                                <?php if($this->session->flashdata()):?>
                                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                                <?php echo $this->session->flashdata('error_upload'); ?>
                                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                                </button>
                                                        </div>
                                                        <br>
                                                <?php endif; ?>
                                                
                                                <?php echo form_open_multipart('Seminar/upload_bukti'); ?>
                                                        <label for="identitas" class="fsmall">Nomor Identitas (No.KTP / No.Paspor / NIM) </label>
                                                                <div class="form-group">
                                                                <input type="text" name="identitas" id="identitas" placeholder="Nomor Identitas" class="form-control form-block rounded-0" required
                                                                        <?php
                                                                                if($this->session->userdata('identitas'))
                                                                                        echo 'value = "'.$this->session->userdata('identitas').'" readonly';
                                                                        ?>
                                                                >
                                                                </div>
                                                        <br>
                                                        
                                                        <label class="fsmall">Foto/Screenshot Bukti Pembayaran </label>
                                                                        <div class="input-group">
                                                                                <div class="input-group-prepend">
                                                                                        <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
                                                                                </div>
                                                                                <div class="custom-file">
                                                                                        <input type="file" name="path_bukti" class="custom-file-input" id="inputGroupFile01"
                                                                                        aria-describedby="inputGroupFileAddon01" required>
                                                                                        <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                                                                </div>
                                                                        </div>
                                                        <br>
                                                        <div class="form-group">
                                                                <input type="submit" name="submit" value="Lanjut" class="btn btn-info btn-block">
                                                                <a href="<?= base_url(); ?>Seminar" class="btn btn-default btn-block">Batal</a>
                                                        </div>
                                                        
                                                <?php echo form_close(); ?>
                                        </div>

                                        <p class="p-judul-kompetisi">
                                                
                                        </p>
                                        
				</div>
			</div>
		</div>
	</section>

<script>
$('#inputGroupFile01').on('change',function(){
        var fileName = $(this).val();
        $(this).next('.custom-file-label').html(fileName);
})
</script>

<?php $this->load->view('seminar/seminar_footer'); ?>