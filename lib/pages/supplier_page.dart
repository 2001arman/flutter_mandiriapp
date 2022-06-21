import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mandiriapp/constans.dart';
import 'package:flutter_mandiriapp/cubit/kelapa_cubit.dart';
import 'package:flutter_mandiriapp/models/supplier_model.dart';
import 'package:flutter_mandiriapp/widgets/column_builder.dart';
import 'package:flutter_mandiriapp/widgets/custom_text_detail.dart';

class SupplierPage extends StatelessWidget {
  const SupplierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueMain,
        title: Text(
          "Supplier & Buyer",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: yellowMain,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Column(
              children: [
                BlocBuilder<KelapaCubit, KelapaState>(
                  builder: (context, state) {
                    if (state is SupplierSuccess) {
                      Text("halo");
                      //   ColumnBuilder(itemBuilder: ((context, index) => CustomTextDetail(
                      //   title: state.supplier.contentSupplier[index].namaSupplierBuyer!,
                      //   content:
                      //       "${state.supplier.contentSupplier[index].tanggal}",
                      // )), itemCount: 2);
                    } else if (state is KelapaLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is KelapaFailed) {
                      return Text(state.error);
                    }
                    return const Text("Data Kosong");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
