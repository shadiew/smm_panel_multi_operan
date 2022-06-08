<?php

//* Script Ini Dibuat Untuk Oper Ke JozPedia SMM, Ganti Operan? You Know Lah Akibatnya
//* Website JozPedia SMM : www.jozpedia-smm.com
//* Kontak Admin JozPedia SMM : WhatsApp= 082225457282 , Line= sandy_rip


date_default_timezone_set('Asia/Jakarta');
//error_reporting(0);


$cfg_webname = "Oper JozPedia SMM Panel";
$cfg_baseurl = "http://www.jozpedia-smm.com/coeg/";
$cfg_desc = "Oper JozPedia Adalah SMM Panel Nomor 1 Terbaik DiIndonesia, Termurah Dan Terlengkap";

$cfg_logo_txt = "Oper JozPedia";
$cfg_registerurl = "#";
$cfg_about = "Oper JozPedia SMM Panel 1 SMM di Indonesia adalah sebuah website penyedia layanan kebutuhan  sosial media Facebook, Instagram, Twitter, YouTube dan kebutuhan lainnya.";


$cfg_min_transfer = 1000; // Ini Untuk Mengatur Minimal Transfer Saldo Panel
$cfg_member_price = 10000; // Silakan Atur Harga Pendaftaran Akun Member
$cfg_member_bonus = 5000; // Silakan Atur Bonus Saldo Pendaftaran Akun Member
$cfg_agen_price = 15000; // Silakan Atur Harga Pendaftaran Akun Agen
$cfg_agen_bonus = 10000; // Silakan Atur Bonus Saldo Pendaftaran Akun Agen
$cfg_reseller_price = 35000; // Silakan Atur Harga Pendaftaran Akun Reseller
$cfg_reseller_bonus = 25000; // Silakan Atur Bonus Saldo Pendaftaran Akun Admin
$cfg_admin_price = 50000; // Silakan Atur Harga Pendaftaran Akun Admin
$cfg_admin_bonus = 50000; // Silakan Atur Bonus Saldo Pendaftaran Akun Admin


$db_server = "localhost";
$db_user = "jozpedia_oper";
$db_password = "jozpedia_oper";
$db_name = "jozpedia_oper";

// Date & Time Hari Ini
$date = date("Y-m-d");
$time = date("H:i:s");

// Require Script SMM
require("lib/database.php");
require("lib/function.php");