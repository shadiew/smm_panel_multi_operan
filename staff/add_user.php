<?php
session_start();
require("../mainconfig.php");
$msg_type = "nothing";

if (isset($_SESSION['user'])) {
	$sess_username = $_SESSION['user']['username'];
	$check_user = mysqli_query($db, "SELECT * FROM users WHERE username = '$sess_username'");
	$data_user = mysqli_fetch_assoc($check_user);
	if (mysqli_num_rows($check_user) == 0) {
		header("Location: ".$cfg_baseurl."logout.php");
	} else if ($data_user['status'] == "Suspended") {
		header("Location: ".$cfg_baseurl."logout.php");
	} else {
			$post_balance = $cfg_bonus_admin; // bonus admin
			$post_price = $cfg_price_admin; // price admin for registrant
		if (isset($_POST['add'])) {
			$post_username = $_POST['username'];
			$post_password = $_POST['password'];
			$z = $_POST["z"];
			
			if($data_user['level'] =="Developer") {
             if($z =="1") { 
			   $level="Member";
			    $post_balance = $cfg_bonus_member;
			   $post_price = $cfg_price_member;
			} else if($z=="2") {
			   $level="Agen"; 
			    $post_balance = $cfg_bonus_agen;
			   $post_price = $cfg_price_agen;
			} else if($z=="3") {
			   $level="Reseller"; 
			    $post_balance = $cfg_bonus_reseller;
			   $post_price = $cfg_price_reseller;
			} else if($z=="4") {
			   $level="Admin"; 
			   $post_balance = $cfg_bonus_admin;
			   $post_price = $cfg_price_admin;
			}
			} else if($data_user['level'] =="Admin") {
			 if($z =="1") { 
			   $level="Member";
			    $post_balance = $cfg_bonus_member;
			   $post_price = $cfg_price_member;
			} else if($z=="2") {
			   $level="Agen"; 
			    $post_balance = $cfg_bonus_agen;
			   $post_price = $cfg_price_agen;
			} else if($z=="3") {
			   $level="Reseller"; 
			    $post_balance = $cfg_bonus_reseller;
			   $post_price = $cfg_price_reseller;
			}
			} else if($data_user['level'] =="Reseller") {
			   if($z =="1") { 
			   $level="Member";
			    $post_balance = $cfg_bonus_member;
			   $post_price = $cfg_price_member;
			} else if($z=="2") {
			   $level="Agen"; 
			    $post_balance = $cfg_bonus_agen;
			   $post_price = $cfg_price_agen;
			}
			}  else if($data_user['level'] =="Agen") {
			 if($z =="1") { 
			   $level="Member";
			    $post_balance = $cfg_bonus_member;
			   $post_price = $cfg_price_member;
			} 
			} 
		

			$checkdb_user = mysqli_query($db, "SELECT * FROM users WHERE username = '$post_username'");
			$datadb_user = mysqli_fetch_assoc($checkdb_user);
			if (empty($post_username) || empty($post_password) || empty($level)) {
				$msg_type = "error";
				$msg_content = "×</span></button> <strong>Gagal !</strong> Mohon mengisi semua input.";
			} else if (mysqli_num_rows($checkdb_user) > 0) {
				$msg_type = "error";
				$msg_content = "×</span></button> <strong>Gagal !</strong> Username $post_username sudah terdaftar dalam database.";
			} else if ($data_user['balance'] < $post_price) {
				$msg_type = "error";
				$msg_content = "×</span></button> <strong>Gagal !</strong> Saldo Anda tidak mencukupi untuk melakukan pendaftaran Admin.";
			} else {
				$post_api = random(20);
				$update_user = mysqli_query($db, "UPDATE users SET balance = balance-$post_price WHERE username = '$sess_username'");
				$insert_user = mysqli_query($db, "INSERT INTO users (username, password, balance, level, registered, status, api_key, uplink) VALUES ('$post_username', '$post_password', '$post_balance', '$level', '$date', 'Active', '$post_api', '$sess_username')");
				if ($insert_user == TRUE) {
					$msg_type = "success";
					$msg_content = "×</span></button><b>Berhasil:</b> $level telah ditambahkan.<br /><b>Username:</b> $post_username<br /><b>Password:</b> $post_password<br /><b>Level:</b> $level<br /><b>Link Masuk:</b><strong> https://flazzpedia.men/ <br /></strong><b>Bonus Saldo:</b> Rp ".number_format($post_balance,0,',','.');
				} else {
					$msg_type = "error";
					$msg_content = "×</span></button> <strong>Gagal !</strong> Error system.";
				}
			}
			
		}
		}

	include("../lib/header.php");
?>
			<div class="page-header">
			  <h2>Tambah Pengguna</h2>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<?php echo $cfg_baseurl; ?>"><?php echo $cfg_webname; ?></a></li>
					<li class="breadcrumb-item active">Tambah Pengguna</li>
				</ol>
			</div>
			
			
						<div class="row">
						<div class="col-md-12">
                    <div class="card">
                        <div class="card-heading  card-primary">
                            Tambah Pengguna
                        </div>
                        <div class="card-block">
										<?php 
										if ($msg_type == "success") {
										?>
										<div class="alert alert-success alert-dismissible" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"><?php echo $msg_content; ?></div>
										<?php
										} else if ($msg_type == "error") {
										?>
										<div class="alert alert-danger alert-dismissible" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"><?php echo $msg_content; ?></div>
										<?php
										}
										?>
										<form role="form" method="POST">
											<div class="alert alert-info">
												Harga Pendaftaran : <br>
												- Member : <?php echo $cfg_price_member; ?><br>
												- Agen : <?php echo $cfg_price_agen; ?><br>
												- Reseller :  <?php echo $cfg_price_reseller; ?><br>
												- Admin : <?php echo $cfg_price_admin; ?><br>
												<hr>
												Bonus Saldo :<br>
												- Member : <?php echo $cfg_bonus_member; ?><br>
												- Agen : <?php echo $cfg_bonus_agen; ?><br>
												- Reseller :  <?php echo $cfg_bonus_reseller; ?><br>
												- Admin : <?php echo $cfg_bonus_admin; ?><br>
											</div>
											<div class="form-group">
												<label>Username</label>
													<input type="text" name="username" class="form-control" placeholder="Username">
												</div>
											<div class="form-group">
												<label>Password</label>
													<input type="text" name="password" class="form-control" placeholder="Password">
												</div>
											<div class="form-group">
												<label>Level</label>
													<select name="z" class="form-control">
													    <?php if($data_user['level'] == "Developer") { ?>
													    <option value="1">Member</option>
													    <option value="2">Agen</option>
													    <option value="3">Reseller</option>
													    <option value="4">Admin</option>
													   <?php } else if($data_user['level'] == "Agen") { ?>
													    <option value="1">Member</option>
													    <?php  } else if($data_user[ 'level'] == "Reseller") { ?>
													   <option value="1">Member</option>
													    <option value="2">Agen</option>
													    <?php } else if($data_user['level'] == "Admin") { ?>
													    <option value="1">Member</option>
													    <option value="2">Agen</option>
													    <option value="3">Reseller</option>
													   
													   <?php } ?>
													</select>
												</div>
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
include("../lib/footer.php");
} else {
	header("Location: ".$cfg_baseurl);
}
?>