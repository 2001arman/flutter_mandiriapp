import 'package:bloc/bloc.dart';
import 'package:flutter_mandiriapp/models/kelapa_model.dart';
import 'package:flutter_mandiriapp/models/pertambangan_model.dart';
import 'package:flutter_mandiriapp/models/produk_model.dart';
import 'package:flutter_mandiriapp/models/supplier_model.dart';
import 'package:flutter_mandiriapp/service/api_service.dart';
import 'package:meta/meta.dart';

part 'kelapa_state.dart';

class KelapaCubit extends Cubit<KelapaState> {
  KelapaCubit() : super(KelapaInitial());

  void getKelapa() async {
    try {
      emit(KelapaLoading());
      KelapaModel kelapa = await ApiService().getDataKelapa();
      if (kelapa.status == "success") {
        emit(KelapaSuccess(kelapa));
      } else {
        emit(KelapaFailed(kelapa.msg.toString()));
      }
    } catch (e) {
      emit(KelapaFailed(e.toString()));
    }
  }

  void getTambang() async {
    try {
      emit(KelapaLoading());
      PertambanganModel tambang = await ApiService().getDataPertambangan();
      if (tambang.status == "success") {
        emit(TambangSuccess(tambang));
      } else {
        emit(KelapaFailed(tambang.msg.toString()));
      }
    } catch (e) {
      emit(KelapaFailed(e.toString()));
    }
  }

  void getProduk() async {
    try {
      emit(KelapaLoading());
      ProdukModel produk = await ApiService().getDataProduct();
      if (produk.status == "success") {
        emit(ProductSuccess(produk));
      } else {
        emit(KelapaFailed(produk.msg.toString()));
      }
    } catch (e) {
      emit(KelapaFailed(e.toString()));
    }
  }

  void getSupplier() async {
    try {
      emit(KelapaLoading());
      SupplierModel supplier = await ApiService().getDataSupplier();
      if (supplier.status == "success") {
        emit(SupplierSuccess(supplier));
      } else {
        emit(KelapaFailed(supplier.msg.toString()));
      }
    } catch (e) {
      emit(KelapaFailed(e.toString()));
    }
  }

}
