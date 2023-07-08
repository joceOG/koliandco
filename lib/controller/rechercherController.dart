import 'package:get/get.dart';

import '../models/country.dart';
import '../models/matchResponse.dart';

class RechercherController extends GetxController {
  late List<Country> countryNames ;

  String _orderType = 'home_delivery';
  String get orderType =>_orderType;

  var matchresponse = MatchResponse().obs;
  var recherchedata = RechercheData().obs;


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

  getRechercherData(RechercherArguments rechercherArguments) {
     this.matchresponse.value = rechercherArguments.matchresponse ;
     this.recherchedata.value = rechercherArguments.recherchedata! ;
     update();
  }

}

class RechercheData {
  String? item ;
  String? categorie ;
  String? weight;
  String? departure;
  String? destination;
  String? departureDate;
  String? sender;

  RechercheData({
    this.item,
    this.categorie,
    this.weight,
    this.departure,
    this.destination,
    this.departureDate,
    this.sender});

}

class  RechercherArguments{
  final MatchResponse matchresponse;
  final RechercheData? recherchedata;
  RechercherArguments(this.matchresponse, this.recherchedata);
}