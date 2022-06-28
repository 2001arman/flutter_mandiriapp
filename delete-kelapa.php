<?php

require "connect.php";

if($_SERVER['REQUEST_METHOD']=="POST"){
    $response      = array();
    $id   = $_POST['id'];
    
    $query_insert= "DELETE FROM `kelapa_sawit_koperasi` WHERE `id_kelapa_sawit` = '$id'";
    $hasil      = mysqli_query($con, $query_insert);
    
   if(!$hasil){
        $response['value'] = '200';
        $response['status'] = 'failed';
        $response['msg'] = "gagal hapus data";
        echo json_encode($response);
        exit();
   }
    if(isset($hasil)){
        // move_uploaded_file($file_tmp, 'img/'.$image_name);
	     $response['value'] = '200';
	     $response['status'] = 'success';
	     $response['msg'] = 'berhasil hapus data';
        echo json_encode($response);
    }else{
        $response['value'] = '0';
        echo json_encode($response);
    }
}
 
?>