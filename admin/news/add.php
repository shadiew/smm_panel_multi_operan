<?php
session_start();
require("../../mainconfig.php");
$msg_type = "nothing";

if (isset($_SESSION['user'])) {
	$sess_username = $_SESSION['user']['username'];
	$check_user = mysqli_query($db, "SELECT * FROM users WHERE username = '$sess_username'");
	$data_user = mysqli_fetch_assoc($check_user);
	if (mysqli_num_rows($check_user) == 0) {
		header("Location: ".$cfg_baseurl."logout.php");
	} else if ($data_user['status'] == "Suspended") {
		header("Location: ".$cfg_baseurl."logout.php");
	} else if ($data_user['level'] != "Developers") {
		header("Location: ".$cfg_baseurl);
	} else {
		if (isset($_POST['add'])) {
			$post_content = $_POST['content'];
			$post_section = $_POST['section'];

			if (empty($post_content) || empty($post_section)) {
				$msg_type = "error";
				$msg_content = "<b>Gagal:</b> Mohon mengisi semua input.";
			} else {
				$insert_news = mysqli_query($db, "INSERT INTO news (date, section, content, created_by) VALUES ('$date','$post_section', '$post_content', '$sess_username')");
				if ($insert_news == TRUE) {
					$msg_type = "success";
					$msg_content = "<b>Berhasil:</b> Informasi berhasil ditambahkan.<br /><b>Type:</b> $post_section<br /><b>Konten:</b> $post_content<br /><b>Tanggal:</b> $date";
				} else {
					$msg_type = "error";
					$msg_content = "<b>Gagal:</b> Error system.";
				}
			}
		}

	include("../../lib/header.php");
?>
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title"><i class="fa fa-plus"></i> Tambah Berita</h3>
									</div>
									<div class="panel-body">
										<?php 
										if ($msg_type == "success") {
										?>
										<div class="alert alert-success">
											<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
											<i class="fa fa-check-circle"></i>
											<?php echo $msg_content; ?>
										</div>
										<?php
										} else if ($msg_type == "error") {
										?>
										<div class="alert alert-danger">
											<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
											<i class="fa fa-times-circle"></i>
											<?php echo $msg_content; ?>
										</div>
										<?php
										}
										?>
										<form class="form-horizontal" role="form" method="POST">
											<div class="form-group">
												<label class="col-md-2 control-label">Type</label>
												<div class="col-md-10">
													<select class="form-control" name="section">
														<option value="Event">Event</option>
														<option value="Informasi">Informasi</option>
														<option value="Update">Update</option>
														<option value="Penting">Penting</option>
														<option value="Update Server">Update Server</option>
														<option value="Server Instagram">Server Instagram</option>
														<option value="Server Pulsa">Server Pulsa</option>
														<option value="Server Youtube">Server Youtube</option>
														<option value="Server Facebook">Server Facebook</option>
														<option value="Deposit Saldo">Deposit Saldo</option>
														<option value="Kontak Bantuan">Kontak Bantuan</option>
														<option value="Server Sosial Media">Server Sosial Media</option>
														<option value="Server Pulsa">Server Pulsa</option>
														<option value="Pendaftaran Akun">Pendaftaran Akun</option>
														<option value="Penurunan Harga">Penurunan Harga</option>
														<option value="Maintance Pulsa">Maintance Pulsa</option>
														<option value="Maintance Sosmed">Maintance Sosmed</option>
														<option value="Maintance Server">Maintance Server</option>
														<option value="Pengecekan Order">Pengecekan Order</option>
													</select>
												</div>
											</div>
										<form class="form-horizontal" role="form" method="POST">
											<div class="form-group">
												<label class="col-md-2 control-label">Konten</label>
												<div class="col-md-10">
													<textarea name="content" class="form-control" placeholder="Konten"></textarea>
												</div>
											</div>
											<a href="<?php echo $cfg_baseurl; ?>admin/news.php" class="btn btn-info btn-bordered waves-effect w-md waves-light">Kembali ke daftar</a>
											<div class="pull-right">
												<button type="reset" class="btn btn-danger btn-bordered waves-effect w-md waves-light">Ulangi</button>
												<button type="submit" class="btn btn-success btn-bordered waves-effect w-md waves-light" name="add">Tambah</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- end row -->
<?php
	include("../../lib/footer.php");
	}
} else {
	header("Location: ".$cfg_baseurl);
}
?>