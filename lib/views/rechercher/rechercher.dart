
import 'dart:js';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:koliandco/controller/homeController.dart';
import 'package:koliandco/controller/rechercherController.dart';

import '../../controller/homeController.dart';
import '../../controller/homeController.dart';
import '../../controller/homeController.dart';
import '../../controller/homeController.dart';
import '../../controller/homeController.dart';
import '../../models/country.dart';
import '../../models/matchResponse.dart';
import '../../router/router.dart';
import 'orderButton.dart';


class Rechercher extends GetResponsiveView<RechercherController> {
  Rechercher({Key? key}) : super(key: key);

 final rechercherController = Get.put(RechercherController());


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

  //  RechercherArguments rechercherArgumentsInView = Get.arguments as RechercherArguments;
   // rechercherController.getRechercherData(rechercherArgumentsInView);

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
        Container (
          decoration: BoxDecoration(
             color: Colors.white,
      ),
        height: 205,
        width: Get.width,
          child: Stack(
              children: [
                Positioned(
                    top: 40,
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
                      child: Row(
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
                                                child :   Container(
                                                    child : const TextField(
                                                  decoration: InputDecoration(
                                                    hintText: "Depart",
                                                    enabledBorder: InputBorder.none,
                                                  ),
                                                ),
                                                ),
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
                                                                return rechercherController.countryNames
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
                                                                  return  TextField(
                                                                    decoration: const InputDecoration(
                                                                      border: OutlineInputBorder(),
                                                                      hintText: "Select Country",
                                                                    ),
                                                                    controller: fieldTextEditingController,
                                                                    focusNode: fieldFocusNode,
                                                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                                                  );
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
                                                          AssetImage("images/icon_Dot_circle.png"),
                                                          color: Colors.white),
                                                      Expanded(
                                                        child :   Container(
                                                          child : const TextField(
                                                            decoration: InputDecoration(
                                                              hintText: "Depart",
                                                              enabledBorder: InputBorder.none,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                )),
                                            Expanded(
                                                child :
                                                Row(
                                                    children : [
                                                      ImageIcon(
                                                          AssetImage("images/icon_Dot_circle.png"),
                                                          color: Colors.white),
                                                      Expanded(
                                                        child :   Container(
                                                          child : const TextField(
                                                            decoration: InputDecoration(
                                                              hintText: "Depart",
                                                              enabledBorder: InputBorder.none,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                )),
                                          ]
                                      )
                                  )
                              ),
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
                                     Get.toNamed(Routes.SIGNUP) ;
                                   },
                                   child :
                                   const Text('Rechercher' , style: TextStyle( color : Colors.white , fontWeight: FontWeight.bold , fontSize: 20 ) ,) ), )
                            ],
                          ),
                         )
                        ],
                      )
                    ),
                  ),

                    ) ,
                Positioned(
                  top: 120,
                  left: 115,
                  child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Trier Par' , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 16),),
                    OrderTypeButton(value: "Prix le plus bas", icon: "icon_coins"),
                    OrderTypeButton(value: "Depart le plus tôt", icon: "icon_history")
                  ]
                ) ,),
                Positioned(
                  top: 120,
                  left: 550,
                  child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Samedi 12 Nov 2022' , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 16),),
                        SizedBox( height: 20),
                        Text('Abidjan, Cote d\'Ivoire -> Lisbone, Portugal \n' , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 14 , color : Color(0XFF00A0AA)),),
                      ]
                  ) ,)
                ]
          ),
      ),
           Container(
               height: 600,
               padding: const EdgeInsets.only(left: 500.0, right: 400.0),
               decoration: const BoxDecoration(
                 color: Colors.white,
               ),
               child: ListView.builder(
                   itemCount: 2,
                   itemBuilder: ((context, index) {

                     return

                       GestureDetector(
                         onTap: () {
                            Get.toNamed(Routes.DETAILSCOLIS) ;
                     }, child : Container(
                       height: 180,
                       width: 500,
                       padding: const EdgeInsets.only(
                           top: 8.0, bottom: 8.0),
                       margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                       decoration: const BoxDecoration(
                         borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(15),
                             topRight: Radius.circular(15),
                             bottomLeft: Radius.circular(15),
                             bottomRight: Radius.circular(15)),
                         color: Color(0xFFFFEFEF),
                       ),
                         child : Stack(
                             children : [
                            Positioned(
                                  top : 2,
                                  left : 10,
                                 child: Column(
                                    children : [
                                     const Text('Samedi 12 , Nov 2022' , style: TextStyle(
                                       fontSize: 12 , fontWeight: FontWeight.bold ,
                                     ),),
                                   Row (
                                           children: [
                                                 Image.asset('assets/images/rounded.png'),
                                                const SizedBox(
                                                  width: 100,
                                                  child : Divider(),
                                                ),
                                                 Image.asset('assets/images/rounded.png'),
                                           ],
                                        ),
                                      Center(
                                        child: Image.asset('assets/images/icon_jet.png')
                                      ),
                                      const Text('Abidjan          Lisbonne' , style: TextStyle(
                                        fontSize: 12 , fontWeight: FontWeight.bold ,
                                      ),),
                                  ]
                                 ),
                            ),
                               Positioned(
                                 top : 50,
                                 left : 240,
                                 child: Column(
                                     children : [
                                       Text('Jocelyn BOKA' , style: TextStyle(
                                         fontSize: 18 , fontWeight: FontWeight.bold ,
                                       ),),
                                       Row (
                                         children: [
                                           Container (
                                              padding: EdgeInsets.only(
                                                  top: 4.0, bottom: 4.0 , right: 10),
                                              child  :Image.asset('assets/images/icon_avat.png'),
                                           ),
                                           Column(
                                             children: [
                                               Row(
                                                 children: [
                                                  Container( padding : const EdgeInsets.only(
                                                       bottom: 4.0 , right : 5.0), child : Text('4,9')
                                                  ),
                                                   Container( padding : const EdgeInsets.only(
                                                       bottom: 5.5 , right : 5.0), child : Image.asset('assets/images/icon_star.png')
                                                   )
                                                 ],
                                               ),
                                               Container( padding : const EdgeInsets.only(
                                                   top : 4), child : Image.asset('assets/images/icon_whatapp.png')
                                               )
                                             ],
                                           )
                                         ],
                                       ),

                                     ]
                                 ),
                               ),
                               Positioned(
                                 top : 2,
                                 left : 520,
                                 child: Column(
                                     children : const [
                                       Text('2500 XOF/ Kg' , style: TextStyle(
                                         fontSize: 14 , fontWeight: FontWeight.bold , color : Color(0xFF00A0AA)
                                       ),),
                                     ]
                                 ),
                               ),
                         ]
                         ),
                       ) );
                   }))
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






