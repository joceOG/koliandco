import 'dart:js';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:koliandco/controller/homeController.dart';

import '../../controller/connexionController.dart';
import '../../models/country.dart';
import '../../router/router.dart';

class Connexion extends GetResponsiveView<ConnexionController> {
  Connexion({Key? key}) : super(key: key);

  final connexionController = Get.put(ConnexionController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget phone() {
    List<Widget> navItems = [
      ElevatedButton(onPressed: () {}, child: Text("Education")),
      ElevatedButton(onPressed: () {}, child: Text("Skills")),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Desi programmer"),
        actions: null,
      ),
      drawer: Drawer(
        child: ListView(
          children: navItems,
        ),
      ),
      body: Text("Main Content Container "),
    );
  }

  @override
  Widget tablet() {
    return Text('New 2');
  }

  @override
  Widget desktop() {
    final List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
      'Item5',
      'Item6',
      'Item7',
      'Item8',
    ];

    List<Widget> navItems = [
      Container(
        width: Get.width / 4.5,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            const ImageIcon(
              AssetImage("images/icon_cubes.png"),
              color: Colors.black,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onPressed: () {},
              child: Text('J\'envoi des colis',
                  style: TextStyle(color: Colors.black)),
            )
          ],
        ),
      ),
      Container(
        width: Get.width / 4.5,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            const ImageIcon(
              AssetImage("images/icon_balance.png"),
              color: Colors.black,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Get.toNamed(Routes.KILOS);
              },
              child: Text('J\'ai des kilos',
                  style: TextStyle(color: Colors.black)),
            )
          ],
        ),
      ),
      Container(
        width: Get.width / 4.5,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            const ImageIcon(
              AssetImage("images/icon_search.png"),
              color: Colors.black,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: Text('Rechercher', style: TextStyle(color: Colors.black)),
            )
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(20),
        width: 100,
        height: 100,
        child: PopupMenuButton(
            icon: const ImageIcon(
              AssetImage("images/icon_user_circle.png"),
              color: Colors.black,
              size: 130,
            ),
            tooltip: "Profil",
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Connexion"),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("Inscription"),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                print("My account menu is selected.");
              } else if (value == 1) {
                print("Settings menu is selected.");
              } else if (value == 2) {
                print("Logout menu is selected.");
              }
            }),
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 85,
          title: Container(
              padding: EdgeInsets.all(12),
              child: Column(children: <Widget>[
                Image.asset('assets/images/logo_1.png'),
                Text('Koli & Co',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ])),
          actions: navItems,
          backgroundColor: Colors.white,
        ),
        drawer: null,
        body: Material(
            child: Form(
                key: this._formKey,
                child: Column(children: [
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 80, bottom: 30),
                      child: const Text(
                        'Se connecter',
                        style: TextStyle(
                            color: Color(0xFF7D2626),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: 500,
                        child: TextFormField(
                          controller: connexionController.email_Controller,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez remplir ce champ';
                            }
                            return null;
                          }, // Use email input type for emails.
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF611313),
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                fontSize: 20.0, color: Color(0xFF611313)),
                            filled: true,
                            fillColor: Color(0xFFDFC9C9),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFF611313), width: 2.0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      //flexible//container
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: 500,
                        child: TextFormField(
                          controller:
                              connexionController.mot_de_passe_Controller,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez remplir ce champ';
                            }
                            return null;
                          }, // Use email input type for emails.
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF611313),
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            hintText: 'Mot de Passe',
                            hintStyle: TextStyle(
                                fontSize: 20.0, color: Color(0xFF611313)),
                            filled: true,
                            fillColor: Color(0xFFDFC9C9),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFF611313), width: 2.0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ), //flexible
                      //flexible//container
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: 235,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Pas encore membre,',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.INSCRIPTION);
                            },
                            child: const Text(
                              'Inscrivez vous',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF975454)),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        connexionController.connecterUtilisateur() ;
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF611313)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(15),
                        )),
                      ),
                      child: const Text(
                        'Connexion',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  )
                ]))));
  }
}

class WebDragScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
