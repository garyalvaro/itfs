
<div class="page">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h5>Daftar Tim | ITFest 4.0 Universitas Sumatera Utara</h5>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
                                <h1 style="color: red">INI GANTI YANG SESUAI</h1>
				<div class="table-responsive-sm">
					<table id="dtBasicExample" class="table table-striped table-bordered" cellspacing="0" width="100%">
						<thead class="bg-custom white-text">
						<th>#</th>
                        <th>Nama Tim</th>
                        <th>Email</th>
                        <th>Nama Ketua</th>
                        <th>Status Pembayaran</th>
                        <th></th>
						</thead>
						<tbody>
							<?php $count=0; ?>
							<?php foreach ($cekBayar as $key => $value): ?>
								<?php $count++; ?>
								<tr>
									<td><?php echo $count ?></td>
									<td>
										<?php echo $value->nama_team ?>
									</td>
									<td><?php echo $value->email; ?></td>
									<td>
										<?php echo $value->nama_peserta ?>
									</td>
										<?php if ($value->status_pembayaran=='Active'): ?>
											<td>Sudah Terverifikasi</td>
										<?php endif ?>
										<?php if ($value->status_pembayaran=='Non-Active'): ?>
											<?php if ($value->url_buktipembayaran==null): ?>
											<td>Belum melakukan pembayaran</td>
											<?php endif ?>
											<?php if ($value->url_buktipembayaran!=null): ?>
											<td>Belum diverifikasi</td>
											<?php endif ?>
										<?php endif ?>
									<td><a href="#" onclick="bayar(<?php echo $value->id_tim ?>)"><i class="fas fa-search"></i>Info</a></td>
								</tr>
							<?php endforeach ?>
						</tbody>
					</table>
				</div>
			</div>			
		</div>
	</div>
</div>
<div class="modal" tabindex="-1" role="dialog" id="modalTim">
  	<div class="modal-dialog" role="document">
    	<div class="modal-content">
      		<div class="modal-header">
        		<h4 class="modal-title">Informasi Detail Tim</h4>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
        		</button>
      		</div>
      		<div class="modal-body">
        		
      		</div>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-primary" id="simpan" disabled >Simpan</button>
        		&nbsp;<button type="button" class="btn btn-warning" id="batal" style="display: block;" data-dismiss="modal">Batal</button>
      		</div>
    	</div>
  	</div>
</div>

<script type="text/javascript">
	$(document).ready(function () {
		$('#dtBasicExample').DataTable();
		$('.dataTables_length').addClass('bs-select');
	});

	function bayar(id)
	{
		$('.modal-body').load('<?php echo base_url('bendahara/getTim?tim=') ?>' + id);
		$('#modalTim').modal('toggle');		
	}
</script>