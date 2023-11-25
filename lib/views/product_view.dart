import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_spending_app/viewmodels/billionaires_view_model.dart';
import 'package:money_spending_app/viewmodels/product_view_model.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final BillionairesViewModel _billionairesViewModel = Get.find();
   final ProductViewModel _productViewModel = Get.put(ProductViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(
              "${_billionairesViewModel.billionaires[_billionairesViewModel.index].netWorth}\$")),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2/3
            ),
            itemCount: _productViewModel.products.length,
            itemBuilder: (context, index) {
              return Container(
                color: Color.fromARGB(255, 231, 231, 231),
                child: Column(children: [
                  Image.network(_productViewModel.products[index].imgUrl ?? "",),
                  Text("${_productViewModel.products[index].name}",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                  Text("${_productViewModel.products[index].price}\$",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    ElevatedButton(onPressed: (){
                    _billionairesViewModel.sellItem(_productViewModel.products[index].price!);
                     }, child: Text("Sell"),style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),
                    Text("0",style: Theme.of(context).textTheme.titleLarge,),
                    ElevatedButton(onPressed: (){

                      _billionairesViewModel.buyItem(_productViewModel.products[index].price!);
                    }, child: Text("Buy"),style: ElevatedButton.styleFrom(backgroundColor: Colors.green),),
                  ],)
                ]),
              );
            }));
  }
}
