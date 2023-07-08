import 'package:get/get.dart';

import '../models/country.dart';

class DetailsColisController extends GetxController {
  late List<Country> countryNames ;

  String _orderType = 'home_delivery';
  String get orderType =>_orderType;
  void setOrderType(String type) {
    _orderType = type;
    print("The order type is "+_orderType);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    countryNames = <Country>[
      Country(name: "India"),
      Country(name: "Australia"),
      Country(name: "Srilanka"),
      Country(name: "Africa"),
      Country(name: "Afghanistan"),
      Country(name: "Albania"),
      Country(name: "Andorra"),
    ];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

}