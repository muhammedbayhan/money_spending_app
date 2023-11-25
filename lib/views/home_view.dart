import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_spending_app/viewmodels/billionaires_view_model.dart';
import 'package:money_spending_app/viewmodels/product_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final BillionairesViewModel _billionairesViewModel = Get.find();
   final ProductViewModel _productViewModel = Get.put(ProductViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "${_billionairesViewModel.billionaires[_billionairesViewModel.index].netWorth}\$"),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 4/5
            ),
            itemCount: _productViewModel.products.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.green,
                child: Column(children: [
                  Image.network(_productViewModel.products[index].imgUrl ?? "",),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    ElevatedButton(onPressed: (){}, child: Text("Sell")),
                    Text("0",style: Theme.of(context).textTheme.titleLarge,),
                    ElevatedButton(onPressed: (){}, child: Text("Buy")),
                  ],)
                ]),
              );
            }));
  }
}
