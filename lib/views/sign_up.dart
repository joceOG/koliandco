import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../router/router.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: TextButton(
        child: Text(
          'Signup',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => Get.rootDelegate.toNamed(Routes.HOME),
      ),
    );
  }
}