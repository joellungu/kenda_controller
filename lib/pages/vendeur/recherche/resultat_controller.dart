import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_agent/utils/requetes.dart';

class ResultatController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  rechercher(String depart, String arrive, int jour) async {
    var agent = box.read("agent");
    change([], status: RxStatus.loading());
    Response response = await requete.getE(
        "itinerances/tronson/$depart/$arrive/$jour/${agent['idPartenaire']}");
    if (response.isOk) {
      print(response.body);
      change(response.body, status: RxStatus.success());
    } else {
      print(response.body);
      change([], status: RxStatus.empty());
    }
  }

  Future<List> getTronconsRoute(String idPartenaire, String nom) async {
    //listeResumer.cast();
    Response rep = await requete.getE("itinerances/course/$idPartenaire/$nom");
    if (rep.isOk) {
      print("-----: ${rep.body}");
      return rep.body;
    } else {
      return [];
    }
  }

  //
  getAllBusDisponible(Map demande) async {
    //
    Requete requete = Requete();
    Response rep = await requete.postE("route", demande);
    if (rep.isOk) {
      //
    } else {
      //
    }
  }
  //
}
