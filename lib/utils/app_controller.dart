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
      if (rep.body['role'] != 5) {
        //Get.off(Accueil());
        Get.snackbar("Erreur", "Vous n'etes pas autorisé!");
      } else {
        if (rep.body['actif']) {
          Get.off(Accueil());
        } else {
          Get.snackbar("Erreur",
              "Vous n'etes plus actif veuillez contacter vos superieurs.");
        }
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
  }
}
