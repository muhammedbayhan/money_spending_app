import 'package:get/get.dart';
import 'package:money_spending_app/models/billionaire_model.dart';
import 'package:money_spending_app/viewmodels/cart_view_model.dart';

class BillionairesViewModel extends GetxController{

   var billionaires =<BillionaireModel> [

        BillionaireModel(id:1,name: "Elon Musk",netWorth: 241000000000,source: "Tesla, SpaceX",country:"United States",imgUrl: "https://i1.sndcdn.com/avatars-000469688319-4bp07i-t500x500.jpg"),
        BillionaireModel(id:2,name: "Jeff Bezos",netWorth: 169000000000,source: "Amazon",country:"United States",imgUrl: "https://i1.sndcdn.com/artworks-FA9a8LRz7zaYDroe-371v2w-t500x500.jpg"),
        BillionaireModel(id:3,name: "Mark Zuckerberg",netWorth: 120000000000,source: "Facebook",country:"United States",imgUrl: "https://heelsagency.com/wp-content/uploads/2014/11/Mark-Zuckerberg-Heels-Agency-Demi-Karan-9.jpg"),
        BillionaireModel(id:4,name: "Bill Gates",netWorth: 117000000000,source: "Microsoft",country:"United States",imgUrl: "https://lefthanderslegacy.org/wp-content/uploads/2018/07/Bill-Gates.jpg"),
        
        BillionaireModel(id:5,name: "Cristiano Ronaldo",netWorth: 136000000,source: "Soccer",country:"Portugal",imgUrl: "https://images.wallpapersden.com/image/download/cristiano-ronaldo-hd-photoshoot_bWhoZ2yUmZqaraWkpJRqZWWtamVl.jpg"),
        BillionaireModel(id:6,name: "Lionel Messi",netWorth: 130000000,source: "Soccer",country:"Argentina",imgUrl: "https://www.ghanaiantimes.com.gh/wp-content/uploads/2023/07/Lionel-Messi.jpg"),
        BillionaireModel(id:7,name: "The Weeknd",netWorth: 40000000,source: "Musician",country:"California",imgUrl: "https://i1.sndcdn.com/artworks-000040276948-83pqfe-t500x500.jpg"),
        BillionaireModel(id:8,name: "Rahmi Koc",netWorth: 2500000000,source: "Diversified",country:"Turkey",imgUrl: "https://scontent.fayt2-1.fna.fbcdn.net/v/t1.6435-9/122706519_4241737235852796_3168079684626521339_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=dd63ad&_nc_ohc=qdVwV2Eb-qcAX_vP5sB&_nc_ht=scontent.fayt2-1.fna&oh=00_AfA6OBeVJlAC6C6RHYFiwjzhf2sfaAnR28ZKVVug0QY7iA&oe=65881926"),

        BillionaireModel(id:9,name: "Taylor Swift",netWorth: 1100000000,source: "Musician",country:"United States",imgUrl: "https://i.pinimg.com/564x/a4/7e/b5/a47eb5cd0c74c34e2d95def679eb8c7d.jpg"),
        BillionaireModel(id:10,name: "Beyoncé Knowles",netWorth: 540000000,source: "Musician",country:"United States",imgUrl: "https://hips.hearstapps.com/hmg-prod/images/beyonce-attends-tidal-x-1015-on-october-15-2016-in-new-york-city-photo-by-theo-wargogetty-images-for-tidal-sqaure.jpg"),
        BillionaireModel(id:11,name: "Jay-Z",netWorth: 2500000000,source: "Musician",country:"California",imgUrl: "https://cdns-images.dzcdn.net/images/cover/7d2dd47a9035f1d29a267c52f2f58d42/500x500.jpg"),
        BillionaireModel(id:12,name: "Muhammed Bayhan",netWorth: 27,source: "Developer",country:"Turkey",imgUrl: "https://t4.ftcdn.net/jpg/03/87/94/85/360_F_387948571_FgeXafIsWbmAjPuoM5r21SR0M48CW9Hc.jpg"),
    ].obs;

    int index=0;


    void buyItem(int price){
      if (billionaires[index].netWorth!>0) {

        if (billionaires[index].netWorth!<price) {
        
      Get.snackbar("Error", "insufficient funds");
        }
        else{
        
         billionaires[index].netWorth=billionaires[index].netWorth!-price;
      billionaires.refresh();
      }
         
      }
      else{
      Get.snackbar("Error", "insufficient funds");
      }

    




}