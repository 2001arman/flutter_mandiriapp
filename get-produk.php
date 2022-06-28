<?php

require_once "connect.php";

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $response   = array();
    $nama       = $_POST['nama'];
    $query      = "SELECT * FROM `produk` WHERE `nama_produk` = '$nama'";
    $hasil      = mysqli_query($con, $query);

    if(mysqli_num_rows($hasil)===0){
        $response['value'] = '200';
	     $response['status'] = 'failed';
	     $response['msg'] = 'Data kosong';
	     $response['content'] = (object)[];

        echo json_encode($response);

    } else{
        while ($fetchdata = mysqli_fetch_array($hasil)) {
            $response['value'] = '200';
            $response['status'] = 'success';
            $response['msg'] = 'Berhasil mmengambil data';
            $response['content_produk'][] = [
                'id_produk' => $fetchdata['id_produk'],
                'nama_produk' => $fetchdata['nama_produk'],
                'nama_nasabah' => $fetchdata['nama_nasabah'],
                'id_sektor' => $fetchdata['id_sektor'],
            ];
        }
        echo json_encode($response);
    }

}
