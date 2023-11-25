import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_spending_app/viewmodels/cart_view_model.dart';

class CartView extends StatelessWidget {
   CartView({super.key});
   final CartModelView _cartModelView = Get.put(CartModelView());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: _cartModelView.cartItems.length,
        itemBuilder: (context, index) {
        return Text(index.toString());
      }),
    );
  }
}
