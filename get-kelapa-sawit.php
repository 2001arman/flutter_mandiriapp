<?php

require_once "connect.php";

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $response   = array();
    $query      = "SELECT * FROM `kelapa_sawit_koperasi`";
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
            $response['content'][] = [
                'id_kelapa_sawit' => $fetchdata['id_kelapa_sawit'],
                'kabupaten_kota' => $fetchdata['kabupaten_kota'],
                'cif' => $fetchdata['cif'],
                'nama_koperasi' => $fetchdata['nama_koperasi'],
                'kebun_inti' => $fetchdata['kebun_inti'],
                'luas_lahan' => $fetchdata['luas_lahan'],
                'jumlah_anggota' => $fetchdata['jumlah_anggota'],
                'id_cabang' => $fetchdata['id_cabang'],
                'check_bmri' => $fetchdata['check_bmri'],
                'check_debitur' => $fetchdata['check_debitur'],
                'area' => $fetchdata['area'],
            ];
        }
        echo json_encode($response);
    }

}
