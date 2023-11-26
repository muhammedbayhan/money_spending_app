import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_spending_app/viewmodels/cart_view_model.dart';
import 'package:money_spending_app/viewmodels/product_view_model.dart';

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
    // TODO: implement initState
    super.initState();
    _cartViewModel.printTotalPrice();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
      bottomNavigationBar: BottomNavigationBar(
        
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money_sharp),
              label: _cartViewModel.total.toString(),
            ),
        
            BottomNavigationBarItem(
              icon: Icon(Icons.clear,color: Colors.red,),
              label: 'Clear',
              
            ),
          ],
        ),
        
        body:ListView.builder(
            itemCount: _cartViewModel.cartItems.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(child: Image.network( _cartViewModel.cartItems[index].imgUrl!),),
                  title: Text(_cartViewModel.cartItems[index].name!),
                  subtitle: Text(_cartViewModel.cartItems[index].piece!.toString()),
                  trailing:FittedBox(
            fit: BoxFit.fill,
            child: Row(
            children: <Widget>[
                              Text(_cartViewModel.cartItems[index].totalPrice!.toString(),style: Theme.of(context).textTheme.titleLarge,),
      
             IconButton(onPressed: (){
             
                   // _cartViewModel.removeItem(_cartViewModel.cartItems[index].id!);
_billionairesViewModel.sellItem(_cartViewModel.cartItems[index].id!, (_cartViewModel.cartItems[index].totalPrice!/_cartViewModel.cartItems[index].piece!).toInt(), _cartViewModel.cartItems[index].piece!);

      _cartViewModel.printTotalPrice();
             }, icon: Icon(Icons.remove,color: Colors.red,))
            ],
            ),
          ),
                  
                  
                  
                
                ),
              );
            }),
      ),
    );
  }
}
