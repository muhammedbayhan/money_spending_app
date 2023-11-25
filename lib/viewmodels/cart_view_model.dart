import 'package:get/get.dart';
import 'package:money_spending_app/models/cart_model.dart';

class CartModelView  extends GetxController{
  var cartItems=<CartModel>[


  ].obs;


  addItem(String name,int piece,String imgUrl,int totalPrice){
cartItems.add(CartModel(name:name,piece: piece,imgUrl:imgUrl ,totalPrice:totalPrice ));

  }
  
}