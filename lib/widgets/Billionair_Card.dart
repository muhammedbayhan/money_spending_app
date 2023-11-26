import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_spending_app/viewmodels/billionaires_view_model.dart';
import 'package:money_spending_app/views/product_view.dart';

class Billionair_Card extends StatelessWidget {
   Billionair_Card({
    super.key,
    required BillionairesViewModel billionairesViewModel,
    required this.index
  }) : _billionairesViewModel = billionairesViewModel;

  final BillionairesViewModel _billionairesViewModel;
int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Image.network(_billionairesViewModel.billionaires[index].imgUrl ?? "")),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Center(
                  child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.7,
                  color: Color.fromARGB(255, 240, 239, 239),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                                _billionairesViewModel.billionaires[index].imgUrl ?? ""),
                            Positioned(
                                bottom: 25,
                                child: Text(
                                  _billionairesViewModel.billionaires[index].name ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                )),
              Positioned(
                                top: 10,
                                right: 0,
                                child: GestureDetector(child: CircleAvatar(backgroundColor: Colors.white,child: Icon(Icons.close)),onTap: (){Navigator.pop(context);},)),
            
            
                          ],
                        ),
                        Text("${_billionairesViewModel.billionaires[index].source},${_billionairesViewModel.billionaires[index].country}"),
                        Container(
                            width: double.infinity,
                            color: Colors.black,
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "${_billionairesViewModel.billionaires[index].netWorth}\$",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.1,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        _billionairesViewModel.selectId=index;
                                    
                                      Get.offAll(ProductView());
                                      },
                                      child: Text("Select")),
                                ),
                              ],
                            )),
                      ]),
                ),
              ));
            });
      },
    );
  }
}
