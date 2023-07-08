import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/country.dart';
import '../models/signInResponse.dart';
import '../router/router.dart';

class ConnexionController extends GetxController {

  TextEditingController email_Controller =
  TextEditingController(text: "");
  TextEditingController mot_de_passe_Controller =
  TextEditingController(text: "");

  SignInResponse sign_in_response = new SignInResponse();

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

  connecterUtilisateur()  async {

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://127.0.0.1:8000/api/user/login'));
    request.body = json.encode({
      "user": {
        "first_name": email_Controller.text,
        "email": email_Controller.text,
        "password": mot_de_passe_Controller.text
      }
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var sign_in_response_string = await response.stream.bytesToString();
      var sign_up_response_json = jsonDecode(sign_in_response_string );
      this.sign_in_response = SignInResponse.fromJson(sign_up_response_json);
      print('user id  ${this.sign_in_response.data?.userId}');
      var user_id = this.sign_in_response.data?.userId ;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('aldready_logged', true );
      await prefs.setString('user_id', user_id!);
      print( 'aldready  ${ prefs.getBool('aldready_logged') }');
      EasyLoading.showSuccess('Connexion Effectuée Avec Succès!');
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
      connecterUtilisateur();
    } else {
      print('No internet (Reason:)');
      EasyLoading.showError(' Aucune Connexion Internet ');
    }
  }

}