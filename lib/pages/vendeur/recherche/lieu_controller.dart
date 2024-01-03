import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_agent/utils/requetes.dart';

class LieuController extends GetxController with StateMixin<List> {
  RxString depart = "".obs;
  RxString arrive = "".obs;
  RxList historique = RxList();
  //
  //
  Requete requete = Requete();
  //
  var box = GetStorage();

  //
  getAllBusTranson(String lieu) async {
    Timer(Duration(seconds: 3), () {
      change([
        {"id": "1234567890"}
      ], status: RxStatus.success());
    });
  }

  //
  Future<bool> getAllLieu() async {
    //
    Response response = await requete.getE("arrets/all");
    //
    if (response.isOk) {
      //
      print("lieux: ${response.body}");
      //
      box.write("lieux", response.body);
      return true;
    } else {
      print("lieux: 1 ${response.body}");
      print("lieux: 2 ${response.statusCode}");
      return false;
    }
    //
  }
}
