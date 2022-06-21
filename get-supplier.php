<?php

require_once "connect.php";

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $response   = array();
    $query      = "SELECT * FROM `supplier_buyer`";
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
            $response['content_supplier'][] = [
                'id_supplier_buyer' => $fetchdata['id_supplier_buyer'],
                'nama_supplier_buyer' => $fetchdata['nama_supplier_buyer'],
                'kategori' => $fetchdata['kategori'],
                'tanggal' => $fetchdata['tanggal'],
                'id_sektor' => $fetchdata['id_sektor'],
            ];
        }
        echo json_encode($response);
    }

}
