<!DOCTYPE html>

<!--

//* Script Ini Dibuat Untuk Oper Ke JozPedia SMM, Ganti Operan? You Know Lah Akibatnya
//* Website JozPedia SMM : www.jozpedia-smm.com
//* Kontak Admin JozPedia SMM : WhatsApp= 082225457282 , Line= sandy_rip

-->

<head>
        <meta charset="utf-8" />
        <title><?php echo $cfg_webname; ?></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="<?php echo $cfg_desc; ?>." name="description" />
        <meta content="<?php echo $cfg_author; ?>" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <link rel="shortcut icon" href="<?php echo $cfg_baseurl; ?>assets/images/favicon_1.ico">

        <link href="<?php echo $cfg_baseurl; ?>assets/plugins/sweetalert/dist/sweetalert.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="<?php echo $cfg_baseurl; ?>assets/plugins/morris.js/morris.css">

        <link href="<?php echo $cfg_baseurl; ?>assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="<?php echo $cfg_baseurl; ?>assets/css/core.css" rel="stylesheet" type="text/css">
        <link href="<?php echo $cfg_baseurl; ?>assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="<?php echo $cfg_baseurl; ?>assets/css/components.css" rel="stylesheet" type="text/css">
        <link href="<?php echo $cfg_baseurl; ?>assets/css/pages.css" rel="stylesheet" type="text/css">
        <link href="<?php echo $cfg_baseurl; ?>assets/css/menu.css" rel="stylesheet" type="text/css">
        <link href="<?php echo $cfg_baseurl; ?>assets/css/responsive.css" rel="stylesheet" type="text/css">

        <script src="<?php echo $cfg_baseurl; ?>assets/js/modernizr.min.js"></script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        
    </head>


    <body class="fixed-left">
        
        <!-- Begin page -->
        <div id="wrapper">
        
            <!-- Top Bar Start -->
            <div class="topbar">
                <!-- LOGO -->
                <div class="topbar-left">
                    <div class="text-center">
                        <a href="<?php echo $cfg_baseurl; ?>index.php" class="logo"><i class="md md-terrain"></i> <span> <?php echo $cfg_logo_txt; ?> </span></a>
                    </div>
                </div>
                <!-- Button mobile view to collapse sidebar menu -->
                <div class="navbar navbar-default" role="navigation">
                    <div class="container">
                        <div class="">
                            <div class="pull-left">
                                <button type="button" class="button-menu-mobile open-left">
                                    <i class="fa fa-bars"></i>
                                </button>
                                <span class="clearfix"></span>
                            </div>
                            <form class="navbar-form pull-left" role="search">
                                <div class="form-group">
                                    <input type="text" class="form-control search-bar" placeholder="Type here for search...">
                                </div>
                                <button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
                            </form>

                            <ul class="nav navbar-nav navbar-right pull-right">
                                <li class="dropdown hidden-xs">
                                    <a href="#" data-target="#" class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-expanded="true">
                                        <i class="md md-notifications"></i> <span class="badge badge-xs badge-danger">3</span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-lg">
                                        <li class="text-center notifi-title">Notification</li>
                                        <li class="list-group">
                                           <!-- list item-->
                                           <a href="javascript:void(0);" class="list-group-item">
                                              <div class="media">
                                                 <div class="media-left">
                                                    <em class="fa fa-user-plus fa-2x text-info"></em>
                                                 </div>
                                                 <div class="media-body clearfix">
                                                    <div class="media-heading">New user registered</div>
                                                    <p class="m-0">
                                                       <small>You have 10 unread messages</small>
                                                    </p>
                                                 </div>
                                              </div>
                                           </a>
                                           <!-- list item-->
                                            <a href="javascript:void(0);" class="list-group-item">
                                              <div class="media">
                                                 <div class="media-left">
                                                    <em class="fa fa-diamond fa-2x text-primary"></em>
                                                 </div>
                                                 <div class="media-body clearfix">
                                                    <div class="media-heading">New settings</div>
                                                    <p class="m-0">
                                                       <small>There are new settings available</small>
                                                    </p>
                                                 </div>
                                              </div>
                                            </a>
                                            <!-- list item-->
                                            <a href="javascript:void(0);" class="list-group-item">
                                              <div class="media">
                                                 <div class="media-left">
                                                    <em class="fa fa-bell-o fa-2x text-danger"></em>
                                                 </div>
                                                 <div class="media-body clearfix">
                                                    <div class="media-heading">Updates</div>
                                                    <p class="m-0">
                                                       <small>There are
                                                          <span class="text-primary">2</span> new updates available</small>
                                                    </p>
                                                 </div>
                                              </div>
                                            </a>
                                           <!-- last list item -->
                                            <a href="javascript:void(0);" class="list-group-item">
                                              <small>See all notifications</small>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="hidden-xs">
                                    <a href="#" id="btn-fullscreen" class="waves-effect waves-light"><i class="md md-crop-free"></i></a>
                                </li>
                                <li class="hidden-xs">
                                    <a href="#" class="right-bar-toggle waves-effect waves-light"><i class="md md-chat"></i></a>
                                </li>
								<?php
							if (isset($_SESSION[ 'user'])) {
							?>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle profile" data-toggle="dropdown" aria-expanded="true"><img src="<?php echo $cfg_baseurl; ?>assets/images/users/avatar-1.jpg" alt="user-img" class="img-circle"> </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<?php echo $cfg_baseurl ;?>main/settings_akun.php"><i class="md md-face-unlock"></i> Profile</a></li>
                                        <li><a href="<?php echo $cfg_baseurl ;?>logout.php"><i class="md md-settings-power"></i> Logout</a></li>
                                        
                                    </ul>
                                </li>
                            </ul>
							<?php
							}
							?>
                        </div>
                        <!--/.nav-collapse -->
                    </div>
                </div>
            </div>
            <!-- Top Bar End -->


            <!-- ========== Left Sidebar Start ========== -->

            <div class="left side-menu">
                <div class="sidebar-inner slimscrollleft">
                    <div class="user-details">
                        <div class="pull-left">
                            <img src="<?php echo $cfg_baseurl ;?>assets/images/users/avatar-1.jpg" alt="" class="thumb-md img-circle">
                        </div>
						<?php
							if (isset($_SESSION[ 'user'])) {
							?>
                        <div class="user-info">
                            <div class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><?php echo $sess_username; ?> <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="<?php echo $cfg_baseurl ;?>main/settings_akun.php"><i class="md md-face-unlock"></i> Profile<div class="ripple-wrapper"></div></a></li>
                                    <li><a href="<?php echo $cfg_baseurl ;?>logout.php"><i class="md md-settings-power"></i> Logout</a></li>
                                </ul>
                            </div>
                            
                            <p class="text-muted m-0"><?php echo $data_user['level']; ?></p>
                        </div>
						<?php
							}
							?>
                    </div>
                    <!--- Divider -->
                    <div id="sidebar-menu">
                        <ul>
            <?php
							if (isset($_SESSION[ 'user'])) {
							?>
							<li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i>
            <span>Akun</span>
            <span class="pull-right-container">
              
            </span>
          </a>
          <ul class="treeview-menu">
									<li><a href="<?php echo $cfg_baseurl; ?>main/settings_akun.php">Pengaturan</a>
									</li>
									<li><a href="<?php echo $cfg_baseurl; ?>logout">Keluar</a>
									</li>
								</ul>
							</li>
				
							<?php
							if ($data_user[ 'level'] != "Member" ) {
							?>
								<li class="has_sub">
                                <a href="#" class="waves-effect"><i class="fa fa-user-plus"></i><span> Staff Menu </span><span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
									<li><a href="<?php echo $cfg_baseurl; ?>staff/add_member.php">Tambah Member</a></li>
									<?php
									if ($data_user[ 'level'] != "Agen" ) {
									?>
									<li><a href="<?php echo $cfg_baseurl; ?>staff/add_agen.php">Tambah Agen</a></li>
									<?php
									if ($data_user[ 'level'] != "Reseller" ) {
									?>
									<li><a href="<?php echo $cfg_baseurl; ?>staff/add_reseller.php">Tambah Reseller</a></li>
									<?php
									if ($data_user[ 'level'] != "Admin" ) {
									?>
									<li><a href="<?php echo $cfg_baseurl; ?>staff/add_admin.php">Tambah Admin</a></li>
									<?php
									}
									}
									}
									?>
									<li><a href="<?php echo $cfg_baseurl; ?>staff/transfer_balance.php">Transfer Saldo</a></ul>
							</li>
						<?php
							}
							?>
							<?php
							if ($data_user[ 'level'] == "Developers") {
							?>
							<li class="has_sub">
                                <a href="#" class="waves-effect"><i class="fa fa-globe"></i><span> Admin Menu </span><span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
									<li><a href="<?php echo $cfg_baseurl; ?>admin/users.php">Kelola Pengguna</a></li>
									<li><a href="<?php echo $cfg_baseurl; ?>admin/services.php">Kelola Layanan</a></li>
									<li><a href="<?php echo $cfg_baseurl; ?>admin/orders.php">Kelola Pesanan Sosmed</a></li>
									
									<li><a href="<?php echo $cfg_baseurl; ?>admin/news.php">Kelola Berita</a></li>
									<li><a href="<?php echo $cfg_baseurl; ?>admin/staff.php">Kelola Staff</a></li>
									<li><a href="<?php echo $cfg_baseurl; ?>admin/transfer_history.php">Riwayat Transfer</a></li>
								</ul>
							</li>
							<?php
							}
							?>
										<li>
											<a href="<?php echo $cfg_baseurl; ?>index.php"> <i class="fa fa-home icon"> <b class="bg-success"></b> </i> <span> Halaman Utama</span> </a>
										</li>
							<li class="has_sub">
                                <a href="#" class="waves-effect"><i class="fa fa-shopping-cart"></i><span> Pesanan Baru </span><span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
												<li><a href="<?php echo $cfg_baseurl; ?>order/sosmed.php"><span> Pesanan Sosial Media</span> </a></li>
												<li><a href="<?php echo $cfg_baseurl; ?>order/history/sosmed.php"><span> Riwayat Sosial Media</span> </a></li>
												
											</ul>
										</li>
										
										<?php
							} else {
							?>
							<li>
											<a href="<?php echo $cfg_baseurl; ?>index.php"> <i class="fa fa-sign-in icon"> <b class="bg-success"></b> </i> <span>Masuk</span> </a>
										</li>
										<?php
							}
							?>
										<li>
											<a href="<?php echo $cfg_baseurl; ?>main/kontak_admin.php"> <i class="fa fa-user-plus icon"> <b class="bg-warning"></b> </i> <span>Daftar Staff</span> </a>
										</li>
										<li>
											<a href="<?php echo $cfg_baseurl; ?>api_doc.php"> <i class="fa fa-random icon"> <b class="bg-danger"></b> </i> <span>Dokumentasi API</span> </a>
										</li>
										
								<li class="has_sub">
                                <a href="#" class="waves-effect"><i class="fa fa-tags"></i><span> Daftar Harga </span><span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
												<li><a href="<?php echo $cfg_baseurl; ?>price/sosial_media.php"><span>Sosial Media</span> </a></li>
												
											</ul>
										</li>
										
											
										<li>
											<a href="<?php echo $cfg_baseurl; ?>main/terms_panel.php"> <i class="fa fa-bolt icon"> <b class="bg-info"></b> </i> <span>Ketentuan Layanan</span> </a>
										</li>
								</ul>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!-- Left Sidebar End --> 



            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->                      
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container">