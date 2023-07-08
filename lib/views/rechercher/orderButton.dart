

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:koliandco/controller/rechercherController.dart';

import '../../controller/buttonController.dart';

class OrderTypeButton extends StatelessWidget {
  final String value;
  final String icon;

  const OrderTypeButton({

    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RechercherController>(
      builder: (buttonController) {
        return InkWell(
          onTap: () => buttonController.setOrderType(value),
          child: Row(
            children: [

              Radio(
                value: value,
                groupValue: buttonController.orderType,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (String? value){

                  //buttonController.setOrderType(value!);
                },
                activeColor: Theme.of(context).primaryColor,
              ),

              const SizedBox(width: 10),
              ImageIcon(
                AssetImage(
                    'assets/images/$icon.png'),
                color: Colors.black,
                size: 20,
              ),
              const SizedBox(width: 5),
              Text(value , style: TextStyle( fontSize: 16 , fontWeight: FontWeight.bold),),
            ],
          ),
        );
      },
    );
  }
}


