import 'dart:async';

import 'package:get/get.dart';

class RechercheController extends GetxController with StateMixin<List> {
  RxList historique = RxList();

  getAllBusTranson() async {
    Timer(Duration(seconds: 3), () {
      change([
        {"id": "1234567890"}
      ], status: RxStatus.success());
    });
  }
  //
}
