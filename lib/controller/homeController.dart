import 'dart:convert';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:koliandco/models/matchResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/country.dart';
import '../models/getUserResponse.dart';
import 'dart:math' as math show Random;

import '../router/router.dart';

class HomeController extends GetxController {
  late List<Country> countryNames ;
  var  get_user_response = new GetUserResponse().obs;
  var user_data = new UserData().obs;

  var match_response = new MatchResponse().obs ;



  TextEditingController depart_Controller =
  TextEditingController(text: "");
  TextEditingController destination_Controller =
  TextEditingController(text: "");
  TextEditingController kilos_Controller =
  TextEditingController(text: "");
  TextEditingController date_Controller =
  TextEditingController(text: "");


  Rx<bool> online = false.obs;
  var avatarcolor = Colors.primaries[math.Random().nextInt(Colors.primaries.length)].obs;
  var avatarstring = "".obs ;

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

   verifierConnexionUtilisateur() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print( 'aldready  ${ preferences.getBool('aldready_logged') }');
    if ( preferences.getBool('aldready_logged') == true ) {
      getUserData();
      this.online.value = true;
    }else{
      print('non connecté');
      this.online.value = false;
    }

  }
  getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://127.0.0.1:8000/api/user/oneuser'));
    request.body = json.encode({
      "user": {
        "user_id": preferences.getString('user_id')
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var get_user_response_string = await response.stream.bytesToString();
      var get_user_response_json = jsonDecode(get_user_response_string );
      this.get_user_response.value = GetUserResponse.fromJson(get_user_response_json);
      print('user id  ${this.get_user_response.value.userdata}');
      this.user_data.value = this.get_user_response.value.userdata! ;
      print('nom user ${ this.user_data.value.firstName } ');
      print('online ${ this.online.value } ');
      getOnlineData();
    }
    else {
    print(response.reasonPhrase);
    }

  }

  getOnlineData() {
    this.avatarstring.value = (this.user_data.value.firstName!).substring( 0, 1) + (this.user_data.value.lastName!).substring( 0, 1) ;
    update();
  }

  String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  var slug ;

  String getRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  searchAnnonce() async {
    slug =getRandomString(8);
    if ( this.online == true ) {
      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'POST', Uri.parse('http://127.0.0.1:8000/api/ads/search'));
      request.body = json.encode({
        "package": {
          "item": "Item $slug",
          "category": "Shoes",
          "weight": 5,
          "departure": depart_Controller.text,
          "destination": destination_Controller.text,
          "departure_date": date_Controller.text,
          "sender_id": this.user_data.value.userId,
        }
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var match_response_string = await response.stream.bytesToString();
        var match_response_json = jsonDecode(match_response_string );
        this.match_response.value = MatchResponse.fromJson(match_response_json);

       RechercheData recherchedata = RechercheData( item: "Item $slug", categorie: 'Shoes',
          weight: kilos_Controller.text , departure: depart_Controller.text ,
         destination:  destination_Controller.text , departureDate: date_Controller.text
        ) ;

        Get.toNamed(Routes.RECHERCHER , arguments : [RechercherArguments(
           match_response.value ,
        recherchedata,
        )],);
      }
      else {
        EasyLoading.showError('Requete Impossible');
        print(response.reasonPhrase);
      }
    }else {
      Get.toNamed(Routes.HOME);
    }

  }


  Future<bool> connectivity () async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    var check;
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      check = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      check = true;
    }
    return check;
  }

  checkConnection() async {
    bool result = await connectivity();
    if (result == true) {
      print(' Good Connection ');
      searchAnnonce();
    } else {
      print('No internet (Reason:)');
      EasyLoading.showError(' Aucune Connexion Internet ');
    }
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