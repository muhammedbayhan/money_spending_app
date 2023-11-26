import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_spending_app/constants/page_padding.dart';
import 'package:money_spending_app/viewmodels/billionaires_view_model.dart';
import 'package:money_spending_app/widgets/Billionair_Card.dart';

class BillionairesView extends StatelessWidget {
  const BillionairesView({super.key});

  @override
  Widget build(BuildContext context) {

 final BillionairesViewModel _billionairesViewModel = Get.put(BillionairesViewModel());
    return Scaffold(
      appBar: AppBar(
        title: Text("Billionaires"),
      ),
      body: Padding(
        padding:PagePadding.pagePadding,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 1, crossAxisSpacing: 1),
            itemCount: _billionairesViewModel.billionaires.length,
            itemBuilder: (context, index) {
              return Billionair_Card(index:index,billionairesViewModel: _billionairesViewModel);
            }),
      ),
    );
  }
}

