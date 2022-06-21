<?php

require_once "connect.php";

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $response   = array();
    $nip   = $_POST['nip'];
    $password   = $_POST['password'];
    $query      = "SELECT * FROM `admin` WHERE `nip_admin` ='$nip' and `password_admin` = '$password'";
    $hasil      = mysqli_query($con, $query);

    if(mysqli_num_rows($hasil)===0){
        $response['value'] = '200';
	     $response['status'] = 'failed';
	     $response['msg'] = 'nip atau password anda salah';
        $response['role'] = '';
        $response['content'] = (object)[];
        echo json_encode($response);

    } else{
        while ($fetchdata = mysqli_fetch_array($hasil)) {
            $response['value'] = '200';
            $response['status'] = 'success';
            $response['msg'] = 'Berhasil login';
            $response['role'] = 'admin';
            $response['content'] = [
                'id_admin' => $fetchdata['id_admin'],
                'nip_admin' => $fetchdata['nip_admin'],
                'nama_admin' => $fetchdata['nama_admin'],
            ];
        }
        echo json_encode($response);
    }

}
