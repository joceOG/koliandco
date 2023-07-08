
import 'dart:js';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:koliandco/controller/homeController.dart';

import '../../models/country.dart';
import '../../router/router.dart';


class Home extends GetResponsiveView<HomeController> {
  Home({Key? key}) : super(key: key);

 final homeController = Get.put(HomeController());

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
      drawer:  Drawer(
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
    homeController.verifierConnexionUtilisateur();

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
      Container (
          width:  Get.width / 4.5,
          decoration: const BoxDecoration (
          color : Colors.white
      ),  child: Row (
         children:[
           const ImageIcon(
             AssetImage("images/icon_cubes.png"),
             color: Colors.black,
           ),
           TextButton(
           style: TextButton.styleFrom(
             textStyle:  TextStyle(fontSize: 20 , color: Colors.black),
           ),
           onPressed: () {},
           child: Text('J\'envoi des colis' , style :TextStyle(color: Colors.black)) ,
         )
         ],
      ) ,),
      Container(
        width:  Get.width / 4.5,
        decoration: const BoxDecoration (
            color : Colors.white
        ),  child: Row (
        children:[
          const ImageIcon(
            AssetImage("images/icon_balance.png"),
            color: Colors.black,
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle:  TextStyle(fontSize: 20 ),
            ),
            onPressed: () {
              Get.toNamed(Routes.KILOS);
            },
            child:  Text('J\'ai des kilos' , style :TextStyle(color: Colors.black)),
          )
        ],
      )  ,),
      Container(
        width:  Get.width / 4.5,
        decoration: BoxDecoration (
            color : Colors.white
        ),  child: Row (
        children:[
          const ImageIcon(
            AssetImage("images/icon_search.png"),
            color: Colors.black,
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Get.toNamed(Routes.RECHERCHER);
            },
            child: Text('Rechercher' , style :TextStyle(color: Colors.black)),
          )
        ],
      )  ,),
      Obx(    () => homeController.online.value == false ?
      Container(
           padding: EdgeInsets.all(20),
           width: 100,
           height: 100,
           child :
    PopupMenuButton(
          icon: const ImageIcon(
                AssetImage("images/icon_user_circle.png"),
            color: Colors.black,
            size: 130,
          ),
          tooltip: "Profil",
          itemBuilder: (context){
            return [
               PopupMenuItem<int>(
                value: 0,
                child: TextButton(  onPressed: () {
                  Get.toNamed(Routes.CONNEXION) ;
                },
                  child : Text("Connexion"),
                )
              ),

               PopupMenuItem<int>(
                value: 1,
                child: TextButton(  onPressed: () {
                  Get.toNamed(Routes.INSCRIPTION) ;
                },
                child : Text("Inscription"),
                )
              ),
            ];
          },
          onSelected:(value){
            if(value == 0){
              print("My account menu is selected.");
            }else if(value == 1){
              print("Settings menu is selected.");
            }else if(value == 2){
              print("Logout menu is selected.");
            }
          }
      ),
      ) :
      Container(
        padding: EdgeInsets.all(20),
        width: 100,
        height: 100,
        child :
        PopupMenuButton(
            icon: CircleAvatar(
              backgroundColor: homeController.avatarcolor.value,
              child: Text(homeController.avatarstring.value),
            ),
            tooltip: "${homeController.user_data.value.firstName}  ${homeController.user_data.value.lastName} ",
            itemBuilder: (context){
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Deconnexion"),
                ),

                const PopupMenuItem<int>(
                  value: 1,
                  child: Divider(
                    height: 20,
                    thickness: 5,
                    indent: 20,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text(homeController.user_data.value.email!),
                ),
              ];
            },
            onSelected:(value){
              if(value == 0){
                print("My account menu is selected.");
              }else if(value == 1){
                print("Settings menu is selected.");
              }else if(value == 2){
                print("Logout menu is selected.");
              }
            }
        ),
      ),
      )
    ];

   


    return   Scaffold(
      appBar: AppBar(
          toolbarHeight: 85,
        title: Container
          (            padding : EdgeInsets.all(12),
            child : Column (   children:<Widget>[
                     Image.asset('assets/images/logo_1.png' ),
                     Text( 'Koli & Co' , style: TextStyle ( fontSize: 14 , fontWeight: FontWeight.bold , color: Colors.black)) ,
            ]
        )
        ),
        actions: navItems,
        backgroundColor: Colors.white,
      ),
      drawer:  null,
      body:Material(
       child :
      Column (
         children: [
        Container (
        height: 425,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'images/plane_1.png'),
          scale: 0.27,
            )),
          child: Stack(
              children: [
                Positioned(
                    top: 260,
                    left: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        maxWidth: 1230,
                        maxHeight: 54,
                      ),
                      color: Color(0xFF9F7070),
                      child: Form (
                       child :
                      Row(
                        children: [
                          SizedBox(
                              width: 900,
                              height: 50,
                              child : Container(
                                  width: 898,
                                  height:45,
                                  child :Container(

                                      child : Row (
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children : [
                                            const ImageIcon(
                                              AssetImage("images/icon_Dot_circle.png"),
                                              color: Colors.white,
                                            ),
                                           Expanded(
                                                child :  Container  (
                                                  padding : EdgeInsets.all(8),
                                                  child : Row( children : [
                                                    SizedBox( width: 160 , height: 25, child : TextFormField(
                                                      controller: homeController.depart_Controller,
                                                      style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),
                                                      decoration: const InputDecoration(
                                                        hintText: "Depart",
                                                        hintStyle: TextStyle(
                                                          color : Colors.white ,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,

                                                        ),
                                                        enabledBorder: InputBorder.none,
                                                        fillColor: Colors.white,
                                                      ),
                                                      cursorColor:Colors.white,
                                                    ), )
                                                  ]
                                                  ), ),
                                            ),
                                            Expanded(
                                              child :
                                              Row(
                                                  children : [
                                                  const ImageIcon(
                                                  AssetImage("images/icon_Dot_circle.png"),
                                                      color: Colors.white),
                                                        Expanded(
                                                          child :   Container(
                                                            child : Autocomplete<Country>(
                                                              optionsBuilder: (textEditingValue) {
                                                                return homeController.countryNames
                                                                    .where((Country country) => country.name
                                                                    .toLowerCase()
                                                                    .startsWith(textEditingValue.text.toLowerCase()))
                                                                    .toList();
                                                              },
                                                              displayStringForOption: (Country country) => country.name ,
                                                              fieldViewBuilder: (BuildContext context ,
                                                                  TextEditingController fieldTextEditingController,
                                                                   FocusNode fieldFocusNode,
                                                                   VoidCallback onFieldSubmitted) {
                                                                  return  TextFormField(
                                                                    style: const TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),
                                                                    decoration: const InputDecoration(
                                                                      hintText: "Destination",
                                                                      hintStyle: TextStyle(
                                                                        color : Colors.white ,
                                                                        fontSize: 16,
                                                                        fontWeight: FontWeight.bold,

                                                                      ),
                                                                      enabledBorder: InputBorder.none,
                                                                      fillColor: Colors.white,
                                                                    ),
                                                                    cursorColor:Colors.white,
                                                                    controller: fieldTextEditingController,
                                                                    focusNode: fieldFocusNode,
                                                                  )
                                                                  ;
                                                              },

                                                                 ),
                                                            )
                                                          ),

                                            ]
                                              )),
                                            Expanded( 
                                                child :
                                                Row(
                                                    children : [
                                                      const ImageIcon(
                                                          AssetImage("images/icon_calend.png"),
                                                          color: Colors.white),
                                                      Expanded(
                                                        child :   Container  (
                                                          padding : EdgeInsets.all(8),
                                                          child : Row( children : [
                                                            SizedBox( width: 160 , height: 25, child : TextFormField(
                                                              controller: homeController.date_Controller,
                                                              style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),
                                                              decoration: const InputDecoration(
                                                                hintText: "Date",
                                                                hintStyle: TextStyle(
                                                                  color : Colors.white ,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.bold,

                                                                ),
                                                                enabledBorder: InputBorder.none,
                                                                fillColor: Colors.white,
                                                              ),
                                                              cursorColor:Colors.white,
                                                            ), )
                                                          ]
                                                          ), ),
                                                      ),
                                                    ]
                                                )),
                                            Expanded(
                                                child :
                                                Row(
                                                    children : [
                                                      const ImageIcon(
                                                          AssetImage("images/icon_kg.png"),
                                                          color: Colors.white),
                                                      Expanded(
                                                        child :   Container  (
                                                          padding : EdgeInsets.all(8),
                                                          child : Row( children : [
                                                            SizedBox( width: 160 , height: 25, child : TextFormField(
                                                              controller: homeController.kilos_Controller,
                                                              style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),
                                                              decoration: const InputDecoration(
                                                                hintText: "Kilos",
                                                                hintStyle: TextStyle(
                                                                  color : Colors.white ,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.bold,

                                                                ),
                                                                enabledBorder: InputBorder.none,
                                                                fillColor: Colors.white,
                                                              ),
                                                              cursorColor:Colors.white,
                                                            ), )
                                                          ]
                                                          ), ),
                                                      ),
                                                    ]
                                                )),
                                          ]
                                      )
                                     )
                                  )
                              ),
                         SizedBox(
                          width: 330,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  color: Color(0xFF611313),
                                ),
                              ),
                              Positioned(
                                   top : 14,
                                   left: 72,
                                   child: TextButton( onPressed: () {
                                     homeController.checkConnection() ;
                                   },
                                   child :
                                   const Text('Rechercher' , style: TextStyle( color : Colors.white , fontWeight: FontWeight.bold , fontSize: 20 ) ,) ), )
                            ],
                          ),
                         )
                        ],
                      )
                      )
                    ),
                  ),

                    ) ,

                ]
          ),
      ),
         Container(
             padding: EdgeInsets.all(5.0),
             margin: EdgeInsets.only(left: 180 , right:120 ),
            child: Row (
               children: [
                  Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(left: 45 , right:45),
                   child: Column(
                     children: [
                       Container(
                         padding:EdgeInsets.all(15),
                         child: Image.asset('images/icon_circle.png' ),
                       ),
                       const Text('Envoyez vos colis en toute sécurité', style: TextStyle( fontWeight: FontWeight.bold , fontSize: 17 , color : Colors.black ) ),
                       const Text('Faites parvenir vos colis dans toutes \n'
                           'les destinations du monde, grâce au \n'
                           'reseau que nous vous procurons' , style: TextStyle ( fontWeight: FontWeight.bold , fontSize: 17 ,
                           color : Colors.brown , fontStyle: FontStyle.italic)) ,
                       const Text('En savoir Plus' , style: TextStyle ( fontWeight: FontWeight.bold , fontSize: 17 , color : Colors.cyan )),
                     ],
                   )

                  ),
                 Container(
                     padding: EdgeInsets.all(10.0),
                     margin: EdgeInsets.only(left: 45 , right:45),
                     child: Column(
                       children: [
                         Container(
                           padding:EdgeInsets.all(15),
                           child: Image.asset('images/icon_book.png' ),
                         ),
                         const Text('Reservation Facile', style: TextStyle( fontWeight: FontWeight.bold , fontSize: 17 , color : Colors.black ) ),
                         const Text('La reservation devient plus facile \n'
                             'avec notre plateforme. Choisissez\n'
                             'et planifier en fonction des tarifs.' , style: TextStyle ( fontWeight: FontWeight.bold , fontSize: 17 ,
                             color : Colors.brown , fontStyle: FontStyle.italic)) ,
                         const Text('En savoir Plus' , style: TextStyle ( fontWeight: FontWeight.bold , fontSize: 17 , color : Colors.cyan )),
                       ],
                     )

                 ),
                 Container(
                     padding: EdgeInsets.all(10.0),
                     margin: EdgeInsets.only(left: 45 , right:45),
                     child: Column(
                       children: [
                         Container(
                           padding:EdgeInsets.all(15),
                           child: Image.asset('images/icon_task.png' ),
                         ),
                         const Text('Suivi et Tableau de Board ', style: TextStyle( fontWeight: FontWeight.bold , fontSize: 17 , color : Colors.black ) ),
                         const Text('Consulter le reporting de vos envois  \n'
                             'ou reception de colis. Verifier tous vos\n'
                             'bilans, vos etats et vos factures.' , style: TextStyle ( fontWeight: FontWeight.bold , fontSize: 17 ,
                             color : Colors.brown , fontStyle: FontStyle.italic)) ,
                          const Text('En savoir Plus' , style: TextStyle ( fontWeight: FontWeight.bold , fontSize: 17 , color : Colors.cyan )),
                            ],
                             )
                        )
         ],
      ),) ])
      )
    );
  }


}


class WebDragScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}