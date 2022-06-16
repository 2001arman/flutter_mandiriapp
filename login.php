<?php

require_once "connect.php";

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $response   = array();
    $nip   = $_POST['nip'];
    $password   = $_POST['password'];
    $query      = "SELECT * FROM `users` WHERE `nip` ='$nip' and `password` = '$password'";
    $hasil      = mysqli_query($con, $query);

    if(mysqli_num_rows($hasil)===0){
        $response['value'] = '200';
	     $response['status'] = 'failed';
	     $response['msg'] = 'nip atau password anda salah';
	     $response['content'] = (object)[];

        echo json_encode($response);

    } else{
        while ($fetchdata = mysqli_fetch_array($hasil)) {
            $response['value'] = '200';
            $response['status'] = 'success';
            $response['msg'] = 'Berhasil login';
            $response['content'] = [
                'nip' => $fetchdata['nip'],
                'nama' => $fetchdata['nama_users'],
                'id_cabang' => $fetchdata['id_cabang'],
                'level' => $fetchdata['level'],
            ];
        }
        echo json_encode($response);
    }

}
