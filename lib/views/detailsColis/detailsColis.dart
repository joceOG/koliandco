
import 'dart:js';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:koliandco/controller/rechercherController.dart';

import '../../controller/detailsColisController.dart';
import '../../models/country.dart';
import '../../router/router.dart';


class DetailsColis extends GetResponsiveView<DetailsColisController> {
  DetailsColis({Key? key}) : super(key: key);

 final detailsColisController = Get.put(DetailsColisController());
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

    List<Widget> navItems = [

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
      ),
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
      body: SingleChildScrollView(
         child:
    Material(
       child :
      Column (
         children: [
          Container(
             padding: EdgeInsets.only(left : 300 , right : 300 , top : 50),
          child :
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Container(
                 child: Column (
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Abidjan , Marcory " , style: TextStyle ( fontWeight: FontWeight.bold , fontSize: 16) ),
                      Text("Samedi 12 Novembre 2022 \n" , style: TextStyle ( fontWeight: FontWeight.bold , fontSize: 16) ),
                      Text("Colis :" , style: TextStyle ( fontWeight: FontWeight.bold , fontSize: 16) ),
                      Text("Type :" , style: TextStyle ( fontWeight: FontWeight.bold , fontSize: 16) ),
                      Text("Categorie :" , style: TextStyle ( fontWeight: FontWeight.bold , fontSize: 16) ),
                      Text("Nombre de Kilos : Kg" , style: TextStyle ( fontWeight: FontWeight.bold , fontSize: 16) ),
                    ],
                 ),
               ) ,
               Container(
                 padding: EdgeInsets.only(left: 100 , right: 100),
                 child:    Row (
                   children: [
                     Image.asset('assets/images/rounded.png' , color: Colors.black,),
                     const SizedBox(
                       width: 330,
                       child : Divider( color: Colors.black),
                     ),
                     Image.asset('assets/images/rounded.png' , color: Colors.black,),
                   ],
                 ),
               ) ,
               Container(
                 child: Column (
                   children: [
                     Text("\n Aéroport, Lisbonne \n" , style: TextStyle ( fontWeight: FontWeight.bold , fontSize: 16) ),
                     Text("Mardi 15 Novembre 2022 ", style: TextStyle ( fontWeight: FontWeight.bold , fontSize: 16) ),
                   ],
                 ),
               ) ,
             ],
           )
          ),
          Container(
            padding: EdgeInsets.only(top : 30),
            child : const SizedBox(
              width: 870,
            child: Divider(
              thickness: 8,
              color: Color(0xFFA89494),
            ),
            )
          ),
           Container(
               padding: const EdgeInsets.only(left : 370 , right : 370 , top : 40),
               child :
                 Row(
                   children: const [
                     SizedBox(
                       width: 620,
                       child: Text(
                         'Prix total pour 8 kg' , style: TextStyle( fontStyle : FontStyle.italic , fontSize: 24),
                       ),
                     ),
                     SizedBox(
                       width: 170,
                       child: Text(
                         '20 000 XOF' , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 32 , color: Color(0xFF117493)),
                       ),
                     ),
                   ],
                 )

           ),
           Container(
               padding: EdgeInsets.only(top : 40),
               child : const SizedBox(
                 width: 870,
                 child: Divider(
                   thickness: 8,
                   color: Color(0xFFA89494),
                 ),
               )
           ),
           Container(
               padding: const EdgeInsets.only(left : 330 , right : 330 , top : 40),
               child :
               Row(
                 children: [
                   const SizedBox(
                     width: 730,
                     child: Text(
                       'Koli & Co' , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 24),
                     ),
                   ),
                   Container(
                     width: 100,
                     margin: EdgeInsets.only(left: 30),
                     child: Column (
                         children:<Widget>[
                       Image.asset('assets/images/logo_1.png' ),
                       Text( 'Koli & Co' , style: TextStyle ( fontSize: 14 , fontWeight: FontWeight.bold , color: Colors.black)) ,
                     ]
                     ),
                   ),
                 ],
               )

           ),
          Container (
              padding: EdgeInsets.all(20),
               margin: EdgeInsets.only(top : 20 ),
               width: 300,
               height: 90,
               child : ElevatedButton(
             onPressed: () {

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
               'Confirmer',
               style: TextStyle(
                   color: Colors.white , fontSize: 24
               ),
             ),
           ),
          )
         ])
      )
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




