<?php
session_start();
require("../mainconfig.php");
//* Script Ini Dibuat Untuk Oper Ke JozPedia SMM, Ganti Operan? You Know Lah Akibatnya
//* Website JozPedia SMM : www.jozpedia-smm.com
//* Kontak Admin JozPedia SMM : WhatsApp= 082225457282 , Line= sandy_rip


if (isset($_SESSION['user'])) {
	$sess_username = $_SESSION['user']['username'];
	$check_user = mysqli_query($db, "SELECT * FROM users WHERE username = '$sess_username'");
	$data_user = mysqli_fetch_assoc($check_user);
	if (mysqli_num_rows($check_user) == 0) {
		header("Location: ".$cfg_baseurl."logout.php");
	} else if ($data_user['status'] == "Suspended") {
		header("Location: ".$cfg_baseurl."logout.php");
	}

	include("../lib/header.php");
	$msg_type = "nothing";

	if (isset($_POST['order'])) {
		$post_service = $_POST['service'];
		$post_quantity = $_POST['quantity'];
		$post_link = trim($_POST['link']);
		$check_service = mysqli_query($db, "SELECT * FROM services WHERE sid = '$post_service' AND status = 'Active'");
		$data_service = mysqli_fetch_assoc($check_service);

        $check_orders = mysqli_query($db, "SELECT * FROM orders WHERE link = '$post_link' AND status IN ('Pending','Processing')");
        $data_orders = mysqli_fetch_assoc($check_orders);
		$rate = $data_service['price'] / 1000;
		$price = $rate*$post_quantity;
		$oid = random_number(3).random_number(4);
		$service = $data_service['service'];
		$provider = $data_service['provider'];
		$pid = $data_service['pid'];

		$check_provider = mysqli_query($db, "SELECT * FROM provider WHERE code = '$provider'");
		$data_provider = mysqli_fetch_assoc($check_provider);
		

		if (empty($post_service) || empty($post_link) || empty($post_quantity)) {
			$msg_type = "error";
			$msg_content = "<b>Gagal:</b> Mohon mengisi input.";
		} else if (mysqli_num_rows($check_orders) == 1) {
		    $msg_type = "error";
		    $msg_content = "<b>Gagal:</b> Terdapat Orderan Username Yang Sama Dan berstatus Pending/Processing.";
		} else if (mysqli_num_rows($check_service) == 0) {
			$msg_type = "error";
			$msg_content = "<b>Gagal:</b> Layanan tidak ditemukan.";
		} else if (mysqli_num_rows($check_provider) == 0) {
			$msg_type = "error";
			$msg_content = "<b>Gagal:</b> Server Maintenance.";
		} else if ($post_quantity < $data_service['min']) {
			$msg_type = "error";
			$msg_content = "<b>Gagal:</b> Jumlah minimal adalah ".$data_service['min'].".";
		} else if ($post_quantity > $data_service['max']) {
			$msg_type = "error";
			$msg_content = "<b>Gagal:</b> Jumlah maksimal adalah ".$data_service['max'].".";
		} else if ($data_user['balance'] < $price) {
			$msg_type = "error";
			$msg_content = "<b>Gagal:</b> Saldo Anda tidak mencukupi untuk melakukan pembelian ini.";
		} else {

			// api data
			$api_link = $data_provider['link'];
			$api_key = $data_provider['api_key'];
			// end api data

			if ($provider == "MANUAL") {
				$api_postdata = "";
			} else if ($provider == "JOZPEDIA") {
                $postdata = "api_key=$api_key&action=order&service=$pid&data=$post_link&quantity=$post_quantity";
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $api_link);
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $postdata);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                $chresult = curl_exec($ch);
                echo $chresult;
                curl_close($ch);
                    $json_result = json_decode($chresult);
                    
			} else {
				die("System Error!");
			}

			if ($provider != "MANUAL" AND $json_result->status == false) {
				$msg_type = "error";
				$msg_content = "Terjadi Kesalahan Pada Layanan Ini.";
			} else {
				if ($provider == "JOZPEDIA") {
					$poid = $json_result->data->id;
				} else if ($provider == "MANUAL") {
					$poid = $oid;
				 }		
				$update_user = mysqli_query($db, "UPDATE users SET balance = balance-$price WHERE username = '$sess_username'");
				if ($update_user == TRUE) {
					$insert_order = mysqli_query($db, "INSERT INTO orders (oid, poid, user, service, link, quantity, price, status, date, provider, place_from) VALUES ('$oid', '$poid', '$sess_username', '$service', '$post_link', '$post_quantity', '$price', 'Pending', '$date', '$provider', 'WEB')");
					if ($insert_order == TRUE) {
						$msg_type = "success";
						$msg_content = "<b>Pesanan telah diterima.</b><br /><b>Layanan:</b> $service<br /><b>Link:</b> $post_link<br /><b>Jumlah:</b> ".number_format($post_quantity,0,',','.')."<br /><b>Biaya:</b> Rp ".number_format($price,0,',','.');
					} else {
						$msg_type = "error";
						$msg_content = "<b>Gagal:</b> Error system (2).";
					}
				} else {
					$msg_type = "error";
					$msg_content = "<b>Gagal:</b> Error system (1).";
				}
			}
		}
	}
	
	$check_user = mysqli_query($db, "SELECT * FROM users WHERE username = '$sess_username'");
	$data_user = mysqli_fetch_assoc($check_user);
?>
				<div class="row">
                            <!-- INBOX -->
                            <div class="col-lg-7">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><i class="fa fa-shopping-cart"></i> Pesanan Baru Sosial Media</h4>
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
												<label class="col-md-2 control-label">Kategori</label>
												<div class="col-md-10">
													<select class="form-control" id="category">
														<option value="0">Pilih salah satu...</option>
														<?php
														$check_cat = mysqli_query($db, "SELECT * FROM service_cat ORDER BY name ASC");
														while ($data_cat = mysqli_fetch_assoc($check_cat)) {
														?>
														<option value="<?php echo $data_cat['code']; ?>"><?php echo $data_cat['name']; ?></option>
														<?php
														}
														?>
													</select>												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">Layanan</label>
												<div class="col-md-10">
													<select class="form-control" name="service" id="service">
														<option value="0">Pilih kategori...</option>
													</select>
												</div>
											</div>
											<div id="note">
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">Link/Target</label>
												<div class="col-md-10">
													<input type="text" name="link" class="form-control" placeholder="Link/Target">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label">Jumlah</label>
												<div class="col-md-10">
													<input type="number" name="quantity" class="form-control" placeholder="Jumlah" onkeyup="get_total(this.value).value;">
												</div>
											</div>
											
											<input type="hidden" id="rate" value="0">
											<div class="form-group">
												<label class="col-md-2 control-label">Total Harga</label>
												<div class="col-md-10">
													<input type="number" class="form-control" id="total" readonly>
												</div>
											</div>
                                            <hr>
											<button type="submit" class="pull-right btn btn-success" name="order"><i class="fa fa-shopping-cart"></i> Buat Pesanan</button>
										</form>
									</div>
								</div>
							</div>
                            <!-- INBOX -->
                            <div class="col-lg-5">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><i class="fa fa-info-circle"></i> Baca Sebelum Order</h4>
                                    </div>
                                    <div class="panel-body">
					Tata cara pengisian form pemesanan:
					<ul>
						<li>Pilih salah satu kategori pada <b>Kategori</b>, maka akan ditampilkan daftar layanan yang tersedia pada <b>Layanan</b>, silahkan pilih salah satu layanan.</li>
						<li>Masukkan data berupa username atau link pada <b>Data</b> sesuai permintaan yang ditampilkan setelah memilih layanan.</li>
						<li>Masukkan jumlah yang diinginkan pada <b>Jumlah</b>, maka akan ditampilkan total harga yang akan dibayar dengan saldo pada <b>Total harga</b>.</li>
						<li>Jika semua input sudah terisi dengan benar, klik <b>Kirim</b>. Pesanan akan diproses jika hasil yang ditampilkan setelah submit sukses.</li>
						<li>Jika pesanan <i>stuck</i>/tidak berubah status dari pending, Anda dapat menghubungi Admin melalui tiket.</li>
					</ul>
					Tata cara mengisi input <b>Data</b> yang sesuai:
					<ul>
						<li>Masukkan data berupa username atau link sesuai yang diminta.</li>
						<li>Pastikan akun target tidak berstatus <i>private</i>.</li>
						<li>Tidak ada pengembalian dana jika terjadi kesalahan pengisian data oleh pengguna.</li>
					</ul>

									</div>
								</div>
							</div>
						</div>
						<!-- end row -->
						<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script type="text/javascript">
$(document).ready(function() {
	$("#category").change(function() {
		var category = $("#category").val();
		$.ajax({
			url: '<?php echo $cfg_baseurl; ?>inc/order_service.php',
			data: 'category=' + category,
			type: 'POST',
			dataType: 'html',
			success: function(msg) {
				$("#service").html(msg);
			}
		});
	});
	$("#service").change(function() {
		var service = $("#service").val();
		$.ajax({
			url: '<?php echo $cfg_baseurl; ?>inc/order_note.php',
			data: 'service=' + service,
			type: 'POST',
			dataType: 'html',
			success: function(msg) {
				$("#note").html(msg);
			}
		});
		$.ajax({
			url: '<?php echo $cfg_baseurl; ?>inc/order_rate.php',
			data: 'service=' + service,
			type: 'POST',
			dataType: 'html',
			success: function(msg) {
				$("#rate").val(msg);
			}
		});
	});
});

function get_total(quantity) {
	var rate = $("#rate").val();
	var result = eval(quantity) * rate;
	$('#total').val(result);
}
	</script>
<?php
	include("../lib/footer.php");
} else {
	header("Location: ".$cfg_baseurl);
}
?>