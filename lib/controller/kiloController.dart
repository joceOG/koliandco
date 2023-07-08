import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math show Random;
import '../models/getUserResponse.dart';
import '../router/router.dart';

class KiloController extends GetxController {

  var  get_user_response = new GetUserResponse().obs;
  var user_data = new UserData().obs;

  TextEditingController numero_billet_Controller =
  TextEditingController(text: "");
  TextEditingController compagnie_Controller =
  TextEditingController(text: "");
  TextEditingController depart_Controller =
  TextEditingController(text: "");
  TextEditingController destination_Controller =
  TextEditingController(text: "");
  TextEditingController date_depart_Controller =
  TextEditingController(text: "");
  TextEditingController date_arrivee_Controller =
  TextEditingController(text: "");
  TextEditingController espace_Controller =
  TextEditingController(text: "");
  TextEditingController categorie_Controller =
  TextEditingController(text: "");

  Rx<bool> online = false.obs;
  var avatarcolor = Colors.primaries[math.Random().nextInt(Colors.primaries.length)].obs;
  var avatarstring = "".obs ;


  @override
  void onInit() {
    super.onInit();

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


  publierUneAnnonce( ) async {


    if ( this.online == true ) {
      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('http://127.0.0.1:8000/api/ad/store'));
      request.body = json.encode({
        "ad": {
          "user_id": this.user_data.value.userId ,
          "ticket_number": this.numero_billet_Controller.text ,
          "travel_company": this.compagnie_Controller.text,
          "departure": this.depart_Controller.text,
          "destination": this.destination_Controller.text,
          "departure_date": this.date_depart_Controller.text,
          "arrival_date": this.date_arrivee_Controller.text ,
          "space": this.espace_Controller.text,
          "categories_accepted": [this.categorie_Controller.text]
        }
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        print(await response.stream.bytesToString());
        EasyLoading.showSuccess('Votre annonce a été enregistrée avec Succès!');
        Get.toNamed(Routes.HOME);
      }
      else {
        print(response.reasonPhrase);
      }

    }else {
      Get.toNamed(Routes.KILOS);
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
      publierUneAnnonce();
    } else {
      print('No internet (Reason:)');
      EasyLoading.showError(' Aucune Connexion Internet ');
    }
  }

}