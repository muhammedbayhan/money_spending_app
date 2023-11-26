import 'package:flutter/material.dart';
import 'package:money_spending_app/viewmodels/billionaires_view_model.dart';
import 'package:money_spending_app/viewmodels/cart_view_model.dart';

class Card_Tile extends StatelessWidget {
   Card_Tile({
    super.key,
    required CartViewModel cartViewModel,
    required BillionairesViewModel billionairesViewModel,
    required this.index,
  }) : _cartViewModel = cartViewModel, _billionairesViewModel = billionairesViewModel;

  final CartViewModel _cartViewModel;
  final BillionairesViewModel _billionairesViewModel;
int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Image.network(
              _cartViewModel.cartItems[index].imgUrl!),
        ),
        title: Text(_cartViewModel.cartItems[index].name!),
        subtitle: Text("X${_cartViewModel.cartItems[index].piece}"),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: <Widget>[
              Text(
                "${_cartViewModel.cartItems[index].totalPrice}\$",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                  onPressed: () {
                    _billionairesViewModel.sellItem(
                        _cartViewModel.cartItems[index].id!,
                        (_cartViewModel
                                    .cartItems[index].totalPrice! /
                                _cartViewModel
                                    .cartItems[index].piece!)
                            .toInt(),
                        _cartViewModel.cartItems[index].piece!);
    
                    _cartViewModel.printTotalPrice();
                  },
                  icon: Icon(
                    Icons.remove,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
