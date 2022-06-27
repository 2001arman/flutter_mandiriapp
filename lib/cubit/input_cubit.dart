import 'package:bloc/bloc.dart';
import 'package:flutter_mandiriapp/models/input_model.dart';
import 'package:flutter_mandiriapp/service/api_service.dart';
import 'package:meta/meta.dart';

part 'input_state.dart';

class InputCubit extends Cubit<InputState> {
  InputCubit() : super(InputInitial());

  void inputKelapa({
    required String kota,
    required String cif,
    required String namaKoperasi,
    required String kebunInti,
    required String luasLahan,
    required String jumlahAnggota,
    required String kodeCabang,
    required String namaCabang,
    required String checkBMRI,
    required String checkDebitur,
    required String area,
  }) async {
    try {
      emit(InputLoading());
      InputModel input = await ApiService().inputKelapa(
        kota: kota,
        cif: cif,
        namaKoperasi: namaKoperasi,
        kebunInti: kebunInti,
        luasLahan: luasLahan,
        jumlahAnggota: jumlahAnggota,
        kodeCabang: kodeCabang,
        namaCabang: namaCabang,
        checkBMRI: checkBMRI,
        checkDebitur: checkDebitur,
        area: area,
      );
      if (input.status == "success") {
        emit(InputSuccess(input));
      } else {
        emit(InputFailed(input.msg.toString()));
      }
    } catch (e) {
      emit(InputFailed(e.toString()));
    }
  }

  void inputProduk({
    required String namaProduk,
    required String namaNasabah,
  }) async {
    try {
      emit(InputLoading());
      InputModel input = await ApiService().inputProduk(
        namaNasabah: namaNasabah,
        namaProduk: namaProduk,
      );
      if (input.status == "success") {
        emit(InputSuccess(input));
      } else {
        emit(InputFailed(input.msg.toString()));
      }
    } catch (e) {
      emit(InputFailed(e.toString()));
    }
  }

  void inputSupplier({
    required String namaSupplier,
    required String tanggalSupplier,
    required String kategori,
  }) async {
    try {
      emit(InputLoading());
      InputModel input = await ApiService().inputSupplier(
        namaSupplier: namaSupplier,
        tanggalSupplier: tanggalSupplier,
        kategori: kategori,
      );
      if (input.status == "success") {
        emit(InputSuccess(input));
      } else {
        emit(InputFailed(input.msg.toString()));
      }
    } catch (e) {
      emit(InputFailed(e.toString()));
    }
  }
}
