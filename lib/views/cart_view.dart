import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_spending_app/constants/page_padding.dart';
import 'package:money_spending_app/viewmodels/cart_view_model.dart';
import 'package:money_spending_app/widgets/Cart_Tile.dart';
import '../viewmodels/billionaires_view_model.dart';

class CartView extends StatefulWidget {
  CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final CartViewModel _cartViewModel = Get.put(CartViewModel());
  final BillionairesViewModel _billionairesViewModel = Get.find();

  @override
  void initState() {
    super.initState();
    _cartViewModel.printTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "${_cartViewModel.total}\$",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.clear,
                color: Colors.red,
              ),
              label: 'Clear',
            ),
          ],
        ),
        body: Padding(
          padding: PagePadding.pagePadding,
          child: ListView.builder(
              itemCount: _cartViewModel.cartItems.length,
              itemBuilder: (context, index) {
                return Card_Tile(
                    index: index,
                    cartViewModel: _cartViewModel,
                    billionairesViewModel: _billionairesViewModel);
              }),
        ),
      ),
    );
  }
}
