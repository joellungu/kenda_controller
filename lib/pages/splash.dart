import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_agent/pages/accueil.dart';

import 'login/login.dart';

class Splash extends StatelessWidget {
  Splash() {
    Timer(const Duration(seconds: 3), () {
      //
      var box = GetStorage();
      //
      Map e = box.read("agent") ?? {};
      //
      //Get.off(Login());
      Get.off(Accueil());
      //Get.off(Admin());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text("..."),
      ),
    );
  }
}
