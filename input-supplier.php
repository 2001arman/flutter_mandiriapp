<?php

require "connect.php";

if($_SERVER['REQUEST_METHOD']=="POST"){
    $response      = array();
    $nama_supplier_buyer   = $_POST['nama_supplier_buyer'];
    $kategori              = $_POST['kategori'];
    $tanggal               = $_POST['tanggal'];
    
    $query_insert= "INSERT INTO `supplier_buyer` SET `nama_supplier_buyer`='$nama_supplier_buyer',`kategori`='$kategori', `tanggal`='$tanggal', `id_sektor`='4'";
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