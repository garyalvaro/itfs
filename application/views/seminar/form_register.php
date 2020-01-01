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
                                                <h2>Informasi Personal</h2>
                                                <br>
                                                
                                                <?php if($this->session->flashdata()):?>
                                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                                <?php echo $this->session->flashdata('upload_berhasil'); ?>
                                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                                </button>
                                                        </div>
                                                        <br>
                                                <?php endif; ?>
                                                
                                                <?php echo form_open('Seminar/register'); ?>
                                                        <label for="nama" class="fsmall">Nama</label>
                                                                <div class="form-group">
                                                                <input type="text" name="nama" id="nama" placeholder="Nama" class="form-control form-block rounded-0" required>
                                                                </div>
                                                        <label for="email" class="fsmall">Email</label>
                                                                <div class="form-group">
                                                                <input type="email" name="email" id="email" placeholder="Email" class="form-control form-block rounded-0" required>
                                                                </div>
                                                        <label for="telepon" class="fsmall">Telepon</label>
                                                                <div class="form-group">
                                                                <input type="number" name="telepon" id="telepon" placeholder="Telepon" class="form-control form-block rounded-0" required>
                                                                </div>
                                                        <label for="identitas" class="fsmall">Nomor Identitas (No.KTP / No.Paspor / NIM) </label>
                                                                <div class="form-group">
                                                                <input type="text" name="identitas" id="identitas" placeholder="Nomor Identitas" class="form-control form-block rounded-0" required>
                                                                </div>
                                                        <label for="nama" class="fsmall">Tanggal Lahir</label>
                                                                <div class="form-group">
                                                                <input type="date" name="tgl_lahir" id="tgl_lahir" class="form-control form-block rounded-0" required>
                                                                </div>
                                                        <br>
                                                        <div class="form-group">
                                                                <input type="submit" name="submit" value="Selanjutnya" class="btn btn-info btn-block">
                                                                <a href="<?= base_url(); ?>" class="btn btn-default btn-block">Batal</a>
                                                        </div>
                                                        
                                                <?php echo form_close(); ?>
                                        </div>

                                        <p class="p-judul-kompetisi">
                                                
                                        </p>
                                        
				</div>
			</div>
		</div>
	</section>

<?php $this->load->view('seminar/seminar_footer'); ?>