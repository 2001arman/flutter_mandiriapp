<?php

require "connect.php";

if($_SERVER['REQUEST_METHOD']=="POST"){
    $response      = array();
    $id            = $_POST['id'];
    $kota          = $_POST['kota'];
    $cif           = $_POST['cif'];
    $namaKoperasi  = $_POST['namaKoperasi'];
    $kebunInti     = $_POST['kebunInti'];
    $luasLahan     = $_POST['luasLahan'];
    $jumlahAnggota = $_POST['jumlahAnggota'];
    $kodeCabang    = $_POST['kodeCabang'];
    $namaCabang    = $_POST['namaCabang'];
    $checkBMRI     = $_POST['checkBMRI'];
    $checkDebitur  = $_POST['checkDebitur'];
    $area          = $_POST['area'];
    
    $query_insert= "UPDATE `kelapa_sawit_koperasi` SET `kabupaten_kota`='$kota',`cif`='$cif', `nama_koperasi`='$namaKoperasi', kebun_inti='$kebunInti', luas_lahan = '$luasLahan', jumlah_anggota = '$jumlahAnggota', id_cabang = '3', check_bmri = '$checkBMRI', check_debitur = '$checkDebitur', area = '$area', id_sektor = '1' WHERE `id_kelapa_sawit` = '$id'";
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
	     $response['msg'] = 'berhasil update data';
        echo json_encode($response);
    }else{
        $response['value'] = '0';
        echo json_encode($response);
    }
}
 
?>