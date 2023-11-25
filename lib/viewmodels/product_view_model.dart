import 'package:get/get.dart';
import 'package:money_spending_app/models/product_model.dart';

class ProductViewModel  extends GetxController{
  var products=<ProductModel>[
ProductModel(name:"Burger" ,price:2 ,imgUrl:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThQYic3h5ib1nZzX5hvO4tUqtavd3_UA2A8g&usqp=CAU" ),
ProductModel(name:"Airpods" ,price:200 ,imgUrl:"https://images.hepsiburada.net/assets/Telefon/ProductDesc/HBV00000KXK5D-1.jpg" ),
ProductModel(name:"Playstation 5" ,price:500 ,imgUrl:"https://ideacdn.net/idea/cf/85/myassets/products/448/10711870603314.jpg?revision=1697143329" ),
ProductModel(name:"Iphone 15" ,price:1000 ,imgUrl:"https://www.incehesap.com/resim/urun/202310/651bb1e82750e0.49242782_eigjhnpfkqmol_500.jpg" ),
ProductModel(name:"MacBook Pro 14' M2 " ,price:4000 ,imgUrl:"https://www.miniode.com/image/cache/data/resimler/apple-m2-max-cipe-sahip-2023-macbook-pro-laptop-14-2-inc-liquid-retina-xdr-ekran-32-gb-ram-1-tb-ssd-depolama-arkadan-aydinl-90060-500x500.jpg" ),
ProductModel(name:"Rolex" ,price:10000 ,imgUrl:"https://diamondsourcenyc.com/cdn/shop/products/rolex-datejust-31-mm-ref-278274-0028-luxury-swiss-watches-541.jpg?v=1645762381" ),
ProductModel(name:"Diamond" ,price:999999999 ,imgUrl:"https://5.imimg.com/data5/NB/JB/MY-24165467/synthetic-diamond-500x500.jpg" ),
ProductModel(name:"Product X" ,price:100000000 ,imgUrl:"https://cdn-icons-png.flaticon.com/512/3784/3784325.png" ),
ProductModel(name:"Product X" ,price:10000000 ,imgUrl:"https://cdn-icons-png.flaticon.com/512/3784/3784325.png" ),
ProductModel(name:"Product X" ,price:100000 ,imgUrl:"https://cdn-icons-png.flaticon.com/512/3784/3784325.png" ),
ProductModel(name:"Product X" ,price:10000 ,imgUrl:"https://cdn-icons-png.flaticon.com/512/3784/3784325.png" ),
ProductModel(name:"Product X" ,price:1000 ,imgUrl:"https://cdn-icons-png.flaticon.com/512/3784/3784325.png" ),
ProductModel(name:"Product X" ,price:100 ,imgUrl:"https://cdn-icons-png.flaticon.com/512/3784/3784325.png" ),
ProductModel(name:"Product X" ,price:10 ,imgUrl:"https://cdn-icons-png.flaticon.com/512/3784/3784325.png" ),
ProductModel(name:"Product X" ,price:1 ,imgUrl:"https://cdn-icons-png.flaticon.com/512/3784/3784325.png" ),

  ].obs;
  
}