<?php

require "connect.php";

if($_SERVER['REQUEST_METHOD']=="POST"){
    $response      = array();
    $nama_produk   = $_POST['nama_produk'];
    $nama_nasabah  = $_POST['nama_nasabah'];
    
    $query_insert= "INSERT INTO `produk` SET `nama_produk`='$nama_produk',`nama_nasabah`='$nama_nasabah', `id_sektor`='3'";
    $hasil      = mysqli_query($con, $query_insert);
    
   if(!$hasil){
        $response['value'] = '200';
        $response['status'] = 'failed';
        $response['msg'] = "gagal input data";
        echo json_encode($response);
        exit();
   }
    if(isset($hasil)){
        // move_uploaded_file($file_tmp, 'img/'.$image_name);
	     $response['value'] = '200';
	     $response['status'] = 'success';
	     $response['msg'] = 'berhasil input data';
        echo json_encode($response);
    }else{
        $response['value'] = '0';
        echo json_encode($response);
    }
}
 
?>