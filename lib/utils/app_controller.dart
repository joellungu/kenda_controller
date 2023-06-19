import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_agent/pages/accueil.dart';
import 'requetes.dart';

class AppController extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  loagingAgent(String numero, String mdp) async {
    //
    Response rep = await requete.getE("agents/login/$numero/$mdp");
    if (rep.isOk) {
      print(rep.statusCode);
      print(rep.body);
      box.write(
        "agent",
        rep.body,
      );
      //
      Get.back();
      //
      if (rep.body['actif']) {
        Get.off(Accueil());
      } else {
        Get.snackbar("Erreur",
            "Vous n'etes plus actif veuillez contacter vos superieurs.");
      }
      //
    } else {
      print(rep.statusCode);
      print(rep.body);
      //
      Get.back();
      //
      Get.snackbar(
          "Erreur", "Un problème est survenu lors de l'authentification");
      //
    }
  }

  //
  putDataAgent(Map e) async {
    //
    Response rep = await requete.putE("tickets/", e);
    if (rep.isOk) {
      print("::: ${rep.body}");
      Get.back();
      Get.snackbar("Mise à jour", "Ticket mise à jour",
          colorText: Colors.white, backgroundColor: Colors.indigo);
      Get.off(Accueil());
    } else {
      print("::: ${rep.body}");
      Get.back();
      Get.snackbar("Erreur", "Un problème est survenu lors de la mise à jour.",
          colorText: Colors.white, backgroundColor: Colors.red.shade900);
    }
  }

  //
  Future<List> getHoraire(String idPartenaire, String date, int status) async {
    Response rep =
        await requete.getE("tickets/horaire/$idPartenaire/$date/$status");
    if (rep.isOk) {
      print("::: ${rep.body}");
      return rep.body;
    } else {
      print("::: ${rep.body}");
      return [];
    }
  }

  //getDetails
  Future<Map> getDetails(String idBoutique, String uniqueCode) async {
    Response rep =
        await requete.getE("tickets/details/$idBoutique/$uniqueCode");
    if (rep.isOk) {
      print("::: ${rep.body}");
      return rep.body;
    } else {
      print("::: ${rep.body}");
      return {};
    }
  }

  //getCompanie
  Future<Map> getCompanie(String id) async {
    Response rep = await requete.getE("partenaires/$id");
    if (rep.isOk) {
      return rep.body;
    } else {
      return {};
    }
  }
}
