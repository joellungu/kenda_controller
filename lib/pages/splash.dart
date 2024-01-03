import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_agent/pages/accueil.dart';
import 'package:kenda_agent/pages/vendeur/recherche/lieu_controller.dart';

import 'login/login.dart';

class Splash extends StatelessWidget {
  //

  LieuController lieuController = Get.put(LieuController());
  //
  Splash() {
    Timer(const Duration(seconds: 3), () {
      //
      var box = GetStorage();
      //
      Map e = box.read("agent") ?? {};
      //
      load();
      //Get.off(Accueil());
      //Get.off(Admin());
    });
  }
  //
  //
  load() async {
    bool c = await lieuController.getAllLieu();
    //
    if (c) {
      Get.off(Login());
    } else {
      Get.off(Login());
    }
  }

  //
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
