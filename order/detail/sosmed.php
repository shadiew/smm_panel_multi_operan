<?php
session_start();
require("../../mainconfig.php");
$msg_type = "nothing";

if (isset($_SESSION['user'])) {
	$sess_username = $_SESSION['user']['username'];
	$check_user = mysqli_query($db, "SELECT * FROM users WHERE username = '$sess_username'");
	$data_user = mysqli_fetch_assoc($check_user);
	if (mysqli_num_rows($check_user) == 0) {
		header("Location: ".$cfg_baseurl."user/logout.php");
	} else if ($data_user['status'] == "Suspended") {
		header("Location: ".$cfg_baseurl."user/logout.php");
	} else {
		if (isset($_GET['oid'])) {
			$post_oid = $_GET['oid'];
			$checkdb_order = mysqli_query($db, "SELECT * FROM orders WHERE oid = '$post_oid'");
			$datadb_order = mysqli_fetch_assoc($checkdb_order);
			if (mysqli_num_rows($checkdb_order) == 0) {
				header("Location: ".$cfg_baseurl."order/history/sosmed");
			} else {
				include("../../lib/header.php");
?>
										
			<div class="row">
							<div class="col-md-12">
								<div class="panel panel-default">
									<div class="panel-heading">
									</div>
									<div class="panel-body">
                                <h4 class="card-title text-primary"><i class="fa fa-history"></i> Detail Pesanan Media Sosial <?php echo $datadb_order['oid']; ?></h4>
                	<div class="box-body table-responsive no-padding">
				        <table class="table table-striped">
                                                <tr>
													<td><b>ID Pesanan</b></td>
													<td><code><?php echo $datadb_order['oid']; ?></code></td>
												</tr>
												<tr>
													<td><b>Pembeli</b></td>
													<td><?php echo $datadb_order['user']; ?></td>
												</tr>
												<tr>
													<td><b>Layanan</b></td>
													<td><?php echo $datadb_order['service']; ?></td>
												</tr>
												<tr>
													<td><b>Data</b></td>
													<td><?php echo $datadb_order['link']; ?></td>
												</tr>
												<tr>
													<td><b>Jumlah Beli</b></td>
													<td><?php echo number_format($datadb_order['quantity'],0,',','.'); ?></td>
												</tr>
												<tr>
													<td><b>Jumlah Awal</b></td>
													<td><?php echo number_format($datadb_order['start_count'],0,',','.'); ?></td>
												</tr>
												<tr>
													<td><b>Sisa</b></td>
													<td><?php echo number_format($datadb_order['remains'],0,',','.'); ?></td>
												</tr>
												<tr>
													<td><b>Harga</b></td>
													<td>Rp <?php echo number_format($datadb_order['price'],0,',','.'); ?></td>
												</tr>
												<tr>
													<td><b>Status</b></td>
													<td><?php echo $datadb_order['status']; ?></td>
												</tr>
												<tr>
													<td><b>Pengembalian Dana</b></td>
													<td><label class="label label-<?php if($datadb_order['refund'] == 0) { echo "danger"; } else { echo "success"; } ?>"><?php if($datadb_order['refund'] == 0) { ?>Tidak<?php } else { ?> Ya<?php } ?></label></td>
												</tr>
												<tr>
													<td><b>Tanggal</b></td>
													<td><?php echo $datadb_order['date']; ?></td>
						 						</tr>
						                    </table>
					                    </div>
                                    </div>
                                <div class="box-footer">
                        </div>
                    </div>
                </div>
            </div>
<?php
				include("../../lib/footer.php");
			}
		} else {
			header("Location: ".$cfg_baseurl."order/history/sosmed.php");
		}
	}
} else {
	header("Location: ".$cfg_baseurl);
}
?>