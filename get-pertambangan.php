<?php

require_once "connect.php";

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $response   = array();
    $query      = "SELECT * FROM pertambangan INNER JOIN nasabah ON pertambangan.id_nasabah = nasabah.id_nasabah INNER JOIN kunjungan ON nasabah.id_kunjungan = kunjungan.id_kunjungan";
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
            $response['content_tambang'][] = [
                'id_pertambangan' => $fetchdata['id_pertambangan'],
                'id_nasabah' => $fetchdata['id_nasabah'],
                'total_nasabah' => $fetchdata['total_nasabah'],
                'total_kunjungan' => $fetchdata['total_kunjungan'],
                'total_produk_holding' => $fetchdata['total_produk_holding'],
                'total_livin' => $fetchdata['total_livin'],
                'total_aksa' => $fetchdata['total_aksa'],
                'total_tabungan' => $fetchdata['total_tabungan'],
                'id_sektor' => $fetchdata['id_sektor'],
                'nama_nasabah' => $fetchdata['nama_nasabah'],
                'total_kunjungan_nasabah' => $fetchdata['11'],
                'pic_perusahaan' => $fetchdata['pic_perusahaan'],
                'nama_pengunjung' => $fetchdata['nama_pengunjung'],
                'tanggal_kunjungan' => $fetchdata['tanggal_kunjungan'],
                'produk_holding' => $fetchdata['produk_holding'],
                'potensi_perusahaan' => $fetchdata['potensi_perusahaan'],
                'tujuan_kunjungan' => $fetchdata['tujuan_kunjungan'],
                'hasil_kunjungan' => $fetchdata['hasil_kunjungan'],
                'hasil_kunjungan' => $fetchdata['hasil_kunjungan'],
                'foto_kunjungan' => $fetchdata['foto_kunjungan'],
            ];
        }
        echo json_encode($response);
    }

}
