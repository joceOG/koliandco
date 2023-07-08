
import 'dart:js';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:koliandco/controller/homeController.dart';

import '../../controller/kiloController.dart';
import '../../models/country.dart';
import '../../router/router.dart';


class Kilos extends GetResponsiveView<KiloController> {
  Kilos({Key? key}) : super(key: key);

 final kiloController = Get.put(KiloController());
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

    kiloController.verifierConnexionUtilisateur();

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
           onPressed: () {
             Get.toNamed(Routes.HOME) ;
           },
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
              Get.toNamed(Routes.KILOS) ;
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
            onPressed: () {},
            child: Text('Rechercher' , style :TextStyle(color: Colors.black)),
          )
        ],
      )  ,),
      Obx(    () => kiloController.online.value == false ?
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
              backgroundColor: kiloController.avatarcolor.value,
              child: Text(kiloController.avatarstring.value),
            ),
            tooltip: "${kiloController.user_data.value.firstName}  ${kiloController.user_data.value.lastName} ",
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
                  child: Text(kiloController.user_data.value.email!),
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
        height: 428,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'images/image_koli2.png'),
          scale: 0.27,
            ),
        ),
          child: Stack(
              children: [
                Positioned(
                    top: 55,
                    left: 150,
                  child: Column (
                      children :  [
                    Container(
                      padding: EdgeInsets.only(top : 40 , bottom: 40 , right: 75 , left : 75),
                      decoration : BoxDecoration(
                        color: Color(0xFF975454),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:
                      Row(
                          children: [
                            Container(
                                padding : EdgeInsets.only(right:40),
                               child :  Form(
                                   key : this._formKey,

                                child: Column (
                                    children: [
                                      Container  (
                                        padding : EdgeInsets.all(8),
                                        child : Row( children : [
                                          const ImageIcon(
                                              AssetImage("images/icon_num_billet.png"),size:20 ,
                                              color: Colors.white),
                                          SizedBox( width: 160 , height: 25, child :
                                            TextFormField(
                                              controller: kiloController.numero_billet_Controller,
                                            style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),
                                            decoration: const InputDecoration(
                                              hintText: "  Numero de Billet",
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
                                      Container  (
                                        padding : EdgeInsets.all(8),
                                        child : Row( children : [
                                          ImageIcon(
                                              AssetImage("images/icon_company2.png"),size:20  ,color: Colors.white ),
                                          SizedBox( width: 160 , height: 25, child : TextFormField(
                                            controller: kiloController.compagnie_Controller,
                                            style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),
                                            decoration: const InputDecoration(
                                              hintText: "  Compagnie",
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
                                      Container  (
                                        padding : EdgeInsets.all(8),
                                        child : Row( children : [
                                          const ImageIcon(
                                              AssetImage("images/icon_departure.png"),size:20 ,
                                              color: Colors.white),
                                          SizedBox( width: 160 , height: 25, child : TextFormField(
                                            controller: kiloController.depart_Controller,
                                            style: const TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),
                                            decoration: const InputDecoration(
                                              hintText: "  Depart",
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
                                      Container  (
                                        padding : EdgeInsets.all(8),
                                        child : Row( children : [
                                          const ImageIcon(
                                              AssetImage("images/icon_arrival.png"),size:20 ,
                                              color: Colors.white),
                                          SizedBox( width: 160 , height: 25, child : TextFormField(
                                            controller: kiloController.destination_Controller,
                                            style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),
                                            decoration: const InputDecoration(
                                              hintText: "  Destination",
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

                                    ]
                                )
                               )
                            ) ,
                            Container(
                                padding : EdgeInsets.only(right:20),
                                child: Column (
                                    children: [
                                      Container  (
                                        padding : EdgeInsets.all(8),
                                        child : Row( children : [
                                          const ImageIcon(
                                              AssetImage("images/icon_datesolid.png"),size:20 ,
                                              color: Colors.white),
                                          SizedBox( width: 160 , height: 25, child : TextFormField(
                                            controller: kiloController.date_depart_Controller,
                                            style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),
                                            decoration: const InputDecoration(
                                              hintText: "  Date de Depart",
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
                                      Container  (
                                        padding : EdgeInsets.all(8),
                                        child : Row( children : [
                                          const ImageIcon(
                                              AssetImage("images/icon_datesolid.png"),size:20 ,
                                              color: Colors.white),
                                          SizedBox( width: 160 , height: 25, child : TextFormField(
                                            controller: kiloController.date_arrivee_Controller,
                                            style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),
                                            decoration: const InputDecoration(
                                              hintText: "  Date d'arrivée",
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
                                      Container  (
                                        padding : EdgeInsets.all(8),
                                        child : Row( children : [
                                          const ImageIcon(
                                              AssetImage("images/icon_espace.png"),size:20 ,
                                              color: Colors.white),
                                          SizedBox( width: 160 , height: 25, child : TextFormField(
                                            controller: kiloController.espace_Controller,
                                            style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),
                                            decoration: const InputDecoration(
                                              hintText: "  Espace",
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
                                      Container  (
                                        padding : EdgeInsets.all(8),
                                        child : Row( children : [
                                          const ImageIcon(
                                              AssetImage("images/icon_category.png"),size:20 ,
                                              color: Colors.white),
                                          SizedBox( width: 160 , height: 25, child : TextFormField(
                                            controller: kiloController.categorie_Controller,
                                            style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.bold),
                                            decoration: const InputDecoration(
                                              hintText: "  Catégorie acceptée",
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

                                    ]
                                )
                            ) ,
                          ]
                      ) ,
                    ),
                    Container (
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(top : 20 ),
                      width: 300,
                      height: 90,
                      child : ElevatedButton(
                        onPressed: () {
                             //PublierAnnonce
                             kiloController.checkConnection() ;
                        },
                        style : ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>( Color(0xFF611313) ) ,
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )
                          ),
                        ),
                        child: const Text(
                          'Publier Une Annonce',
                          style: TextStyle( color : Colors.white , fontWeight: FontWeight.bold , fontSize: 20 ),
                        ),
                      ),
                    ),
                  ]
                  )
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