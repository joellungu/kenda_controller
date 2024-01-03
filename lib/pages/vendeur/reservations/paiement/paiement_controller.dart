import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_agent/pages/accueil.dart';
import 'package:kenda_agent/pages/vendeur/accueil_vendeur.dart';
// import 'package:kenda/pages/accueil/accueil.dart';
// import 'package:kenda/utils/requetes.dart';
import 'package:kenda_agent/utils/requetes.dart';

class PaiementController extends GetxController with StateMixin<List> {
  RxList historique = RxList();
  //
  var box = GetStorage();
  //
  Requete requete = Requete();
  //
  Future<Map> paiement(Map e) async {
    Response rep = await requete.postE("paiement/paie", e);
    print("la reponse du serveur: ${rep.statusCode}");
    print("la reponse du serveur: ${rep.body}");

    if (rep.isOk) {
      return rep.body;
    } else {
      return {"erreur": rep.statusCode};
    }
  }

  //
  Future<void> achatTicket(List le) async {
    Response rep = await requete.postE("tickets", le);
    print("la reponse du serveur: ${rep.statusCode}");
    print("la reponse du serveur: ${rep.body}");

    if (rep.isOk) {
      List l = box.read("tickets") ?? [];
      l.add(le);
      box.write("tickets", l);
      //
      DateTime dateTime = DateTime.now();
      //
      Map e = {
        "date": "${dateTime.day}-${dateTime.month}-${dateTime.year}",
        "tickes": rep.body,
      };
      Get.back();
      Get.offAll(AccueilVendeur());
      Get.snackbar("Succes", "Enregistrement du billet effectué");

      //eturn rep.body;
    } else {
      Get.back();
      Get.snackbar("Erreur",
          "Un problème est survenu lors de l'enregistrement du billet");
      //return {"erreur": rep.statusCode};
    }
  }

  //
  Future<Map> saveTicket(Map e) async {
    Response rep = await requete.postE("tickets", e);
    print("la reponse du serveur: ${rep.statusCode}");
    print("la reponse du serveur: ${rep.body}");

    if (rep.isOk) {
      return rep.body;
    } else {
      return {"erreur": rep.statusCode};
    }
  }

  Future<Map> verification(String orderNumber) async {
    //flexpay
    //Uri.parse("http://41.243.7.46:3006/api/rest/v1/check/$orderNumber"),
    var rep = await requete.getEE(
      "http://41.243.7.46:3006/api/rest/v1/check/$orderNumber",
      {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJcL2xvZ2luIiwicm9sZXMiOlsiTUVSQ0hBTlQiXSwiZXhwIjoxNzQ2MTg5MDk2LCJzdWIiOiJlYWVjMjJmYjIzZDRmYzIxYjc1ZmViZTdjYThjNmEyOSJ9.V36-U2YBmK5WuIR2jz6fMIt6VcsGzdn_38205UygYT8",
      },
    );
    /**
     * timeout(
      const Duration(minutes: 1),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 408); // Request Timeout response status code
      },
    );
     */
    print(rep.statusCode);
    print(rep.body);
    //Response rep = await requete
    //  .get("http://41.243.7.46:3006/flexpay/api/rest/v1/$orderNumber");
    if (rep.isOk) {
      return rep.body;
    } else {
      return rep.body;
    }
  }

  getAllBusTranson() async {
    Timer(Duration(seconds: 3), () {
      change([
        {"id": "1234567890"}
      ], status: RxStatus.success());
    });
  }

  ///
  Future<Map> getCompanie(String id) async {
    Response rep = await requete.getE("companie/$id");
    if (rep.isOk) {
      return rep.body;
    } else {
      return {};
    }
  }

  //
  Future<Map> getBuss(String id) async {
    Response rep = await requete.getE("bus/via/$id");
    if (rep.isOk) {
      return rep.body;
    } else {
      return {};
    }
  }
  //
}
