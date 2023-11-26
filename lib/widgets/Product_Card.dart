import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_spending_app/viewmodels/billionaires_view_model.dart';
import 'package:money_spending_app/viewmodels/cart_view_model.dart';
import 'package:money_spending_app/viewmodels/product_view_model.dart';

class Product_Card extends StatelessWidget {
   Product_Card({
    super.key,
    required ProductViewModel productViewModel,
    required CartViewModel cartViewModel,
    required BillionairesViewModel billionairesViewModel,
    required this.index
  }) : _productViewModel = productViewModel, _cartViewModel = cartViewModel, _billionairesViewModel = billionairesViewModel;

  final ProductViewModel _productViewModel;
  final CartViewModel _cartViewModel;
  final BillionairesViewModel _billionairesViewModel;
  int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        color: Color.fromARGB(255, 231, 231, 231),
        child: Column(children: [
          Image.network(
            _productViewModel.products[index].imgUrl ?? "",
          ),
          Text("${_productViewModel.products[index].name}",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          Text("${_productViewModel.products[index].price}\$",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                ()=> ElevatedButton(
                  onPressed:
                      _cartViewModel.getPiece(_productViewModel.products[index].id!)==0?null:
                  
                  () {
                    _billionairesViewModel.sellItem(
                      
                        _productViewModel.products[index].id!,
                        _productViewModel.products[index].price!,
                        _cartViewModel.getPiece(_productViewModel.products[index].id!)
                        );
                  },
                  child: Text("Sell"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red),
                ),
              ),
         Obx(() => Text(
                "${_cartViewModel.getPiece(_productViewModel.products[index].id!)}",
                style: Theme.of(context).textTheme.titleLarge,
              )),
              Obx(
                ()=> ElevatedButton(
                  onPressed: 
                 // _billionairesViewModel.billionaires[_billionairesViewModel.selectId].netWorth}\$
                  _productViewModel.products[index].price!>_billionairesViewModel.billionaires[_billionairesViewModel.selectId].netWorth! ? null:
                  () {
                    _billionairesViewModel.buyItem(
                        _productViewModel.products[index].id!,
                        _productViewModel.products[index].name!,
                        _productViewModel.products[index].price!,
                        _productViewModel.products[index].imgUrl!);
                  },
                  child: Text("Buy"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
