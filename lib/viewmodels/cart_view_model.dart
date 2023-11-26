import 'package:get/get.dart';
import 'package:money_spending_app/models/cart_model.dart';
import 'package:money_spending_app/viewmodels/product_view_model.dart';

class CartViewModel extends GetxController {
  final ProductViewModel _productViewModel = Get.put(ProductViewModel());

  var cartItems = <CartModel>[].obs;

  int id = 0;
  var total = 0.obs;
  void printTotalPrice() {
    total.value = 0; // Yeniden hesaplama öncesi total'i sıfırla

    for (var item in cartItems) {
      total += item.totalPrice!;
    }

    print("Toplam Fiyat: $total");
  }

  void removeItem(int id) {
    int? index = cartItems.indexWhere((urun) => urun.id == id);

    if (index != -1) {
      // Eğer varsa, stok miktarını 1 azalt ve toplam fiyatı güncelle
      cartItems[index].piece = cartItems[index].piece! - 1;
      

      if (cartItems[index].piece! <= 0) {
        // Stoğu sıfırlanan ürünü listeden kaldır
        cartItems.removeAt(index);
      } else {
        int? product = _productViewModel.products
            .indexWhere((urun) => urun.name == cartItems[index].name);
        print(product);
        cartItems[index].totalPrice = (cartItems[index].totalPrice! -
                _productViewModel.products[product].price!)
            .toInt();
      }

      print("Eşitlik Var, Stok Miktarı ve Toplam Fiyat Güncellendi");
    } else {
      print("Ürün Bulunamadı");
    }
    cartItems.refresh();

    // Toplam fiyatı yazdır
  }

  int getPiece(int productId) {
    var product = cartItems.firstWhere((item) => item.id == productId,
        orElse: () => CartModel(piece: 0));
    return product.piece ?? 0;
  }

  addItem(int id, String name, int price, String imgUrl) {
    CartModel yeniUrun = CartModel(
      id: id,
      name: name,
      piece: 1,
      totalPrice: price,
      imgUrl: imgUrl,
    );

    int index = cartItems.indexWhere((urun) => urun.id == yeniUrun.id);

    if (index != -1) {
      // Eğer varsa, stok miktarını 1 arttır ve toplam fiyatı güncelle
      cartItems[index].piece = cartItems[index].piece! + 1;
      cartItems[index].totalPrice = cartItems[index].piece! * price;
      print("Eşitlik Var, Stok Miktarı ve Toplam Fiyat Güncellendi");
    } else {
      // Eğer yoksa, yeni ürünü listeye ekle
      cartItems.add(yeniUrun);
      print("Eşitlik Yok, Ürün Eklendi");
    }

    print(cartItems.length);

    cartItems.refresh();
  }
}
