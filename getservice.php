<?php
//*Script by - //*Mohon Untuk Tidak Mengubah Copyright*//
 
require_once("mainconfig.php");//koneksi kepada database
$key = "2Yd4vtNnQxrUwSph1zelLR5MC3IauZ"; // your api key
$postdata = "api_key=$key&action=services";
 
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "http://www.jozpedia-smm.com/api/json.php");
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $postdata);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
$chresult = curl_exec($ch);
//echo $chresult;
curl_close($ch);
$json_result = json_decode($chresult, true);
$indeks=0;
$i = 1;
// get data service
while($indeks < count($json_result['data'])){
   
$category=$json_result['data'][$indeks]['category'];
$id =$json_result['data'][$indeks]['id'];
$service = $json_result['data'][$indeks]['name'];
$min_order =$json_result['data'][$indeks]['min'];
$max_order = $json_result['data'][$indeks]['max'];
$price = $json_result['data'][$indeks]['price'];
$note = $json_result['data'][$indeks]['note'];
$indeks++;
$i++;
// end get data service
// setting price
$k = 1000;
$rate = $price;
$rate_asli = $rate + $k; //setting penambahan harga
// setting price
 $check_services = mysqli_query($db, "SELECT * FROM services WHERE pid = '$id' AND provider='JOZPEDIA'");
            $data_services = mysqli_fetch_assoc($check_orders);
        if(mysqli_num_rows($check_services) > 0) {
            echo "Service Sudah Ada Di database => $service | $id \n <br />";
        } else {
           
$insert=mysqli_query($db, "INSERT INTO services (sid,category,service,note, min, max, price, status, pid, provider) VALUES ('$id','$category','$service','$note','$min_order','$max_order','$rate_asli','Active','$id','JOZPEDIA')");//Memasukan Kepada Database (OPTIONAL)
if($insert == TRUE){
echo"SUKSES INSERT -> Kategori : $category || SID : $id || Service :$service || Min :$min_order || Max : $max_order ||Price : $rate_asli || Note : $note <br />";
}else{
    echo "GAGAL MEMASUKAN DATA";
   
}
}
}
?>