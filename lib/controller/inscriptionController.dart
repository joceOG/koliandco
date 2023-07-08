import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/country.dart';
import '../models/signUpResponse.dart';
import '../router/router.dart';

class InscriptionController extends GetxController {

  TextEditingController nom_Controller =
  TextEditingController(text: "");
  TextEditingController prenom_Controller =
  TextEditingController(text: "");
  TextEditingController telephone_Controller =
  TextEditingController(text: "");
  TextEditingController email_Controller =
  TextEditingController(text: "");
  TextEditingController mot_de_passe_Controller =
  TextEditingController(text: "");

  SignUpResponse sign_up_response = new SignUpResponse();
  Rx<bool> whatsapp_Checked = false.obs;

  Rx<bool> online = false.obs;


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

  inscrireUtilisateur() async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://127.0.0.1:8000/api/user/store'));
    request.body = json.encode({
      "user": {
        "email": email_Controller.text,
        "password": mot_de_passe_Controller.text,
        "first_name": nom_Controller.text,
        "last_name": prenom_Controller.text,
        "phone": telephone_Controller.text,
        "whatsapp": whatsapp_Checked.value,
        "terms": "1"
      }
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
     // print(await response.stream.bytesToString());
      var sign_up_response_string = await response.stream.bytesToString();
      var sign_up_response_json = jsonDecode(sign_up_response_string );
      this.sign_up_response = SignUpResponse.fromJson(sign_up_response_json);
      print('user id  ${this.sign_up_response.data}');
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('aldready_logged', true );
      await prefs.setString('user_id',this.sign_up_response.data!);
        print( 'aldready  ${ prefs.getBool('aldready_logged') }');
      EasyLoading.showSuccess('Inscription Effectuée Avec Succès!');
      Get.toNamed(Routes.HOME);
    }
    else {
       print(response.reasonPhrase);
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
      inscrireUtilisateur();
    } else {
      print('No internet (Reason:)');
      EasyLoading.showError(' Aucune Connexion Internet ');
    }
  }



}