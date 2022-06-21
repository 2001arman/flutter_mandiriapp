part of 'kelapa_cubit.dart';

@immutable
abstract class KelapaState {}

class KelapaInitial extends KelapaState {}

class KelapaLoading extends KelapaState {}

class KelapaSuccess extends KelapaState {
  final KelapaModel kelapa;

  KelapaSuccess(this.kelapa);

  List<Object> get props => [kelapa];
}

class KelapaFailed extends KelapaState {
  final String error;

  KelapaFailed(this.error);

  List<Object> get props => [error];
}

class TambangSuccess extends KelapaState {
  final PertambanganModel tambang;

  TambangSuccess(this.tambang);

  List<Object> get props => [tambang];
}

class ProductSuccess extends KelapaState {
  final ProdukModel produk;

  ProductSuccess(this.produk);

  List<Object> get props => [produk];
}

class SupplierSuccess extends KelapaState {
  final SupplierModel supplier;
  
  SupplierSuccess(this.supplier);

  List<Object> get props => [supplier];
}