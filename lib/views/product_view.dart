import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_spending_app/constants/page_padding.dart';
import 'package:money_spending_app/viewmodels/billionaires_view_model.dart';
import 'package:money_spending_app/viewmodels/cart_view_model.dart';
import 'package:money_spending_app/viewmodels/product_view_model.dart';
import 'package:money_spending_app/views/cart_view.dart';
import 'package:money_spending_app/widgets/Product_Card.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final BillionairesViewModel _billionairesViewModel = Get.find();
   final CartViewModel _cartViewModel = Get.put(CartViewModel());

  final ProductViewModel _productViewModel = Get.put(ProductViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundImage: NetworkImage(_billionairesViewModel.billionaires[_billionairesViewModel.selectId].imgUrl!),),
          ),
          title: Obx(() => Text(
              "${_billionairesViewModel.billionaires[_billionairesViewModel.selectId].netWorth}\$")),
          actions: [
           Obx(
             ()=> Stack(
              alignment: Alignment.topRight,
              children: [
               IconButton(
                  onPressed: () {
                    Get.to(CartView());
                  },
                  icon: Icon(Icons.shopping_basket)),
                  CircleAvatar(radius: 10,backgroundColor: Colors.red,child: Text(_cartViewModel.cartItems.length.toString()),)
             ],),
           )
          ],
        ),
        body: Padding(
          padding: PagePadding.pagePadding,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2 / 3),
              itemCount: _productViewModel.products.length,
              itemBuilder: (context, index) {
                return Product_Card(index:index,productViewModel: _productViewModel, cartViewModel: _cartViewModel, billionairesViewModel: _billionairesViewModel);
              }),
        ));
  }
}

