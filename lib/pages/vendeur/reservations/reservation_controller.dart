import 'package:get/get.dart';
import 'package:kenda_agent/utils/requetes.dart';

class ReservationController extends GetxController {
  //
  Requete requete = Requete();
  //
  RxList places = [].obs;
  //

  Future<List> getHoraire(
      String id, String idPartenaire, String date, int status) async {
    Response rep =
        await requete.getE("tickets/horaire/$id/$idPartenaire/$date/$status");
    if (rep.isOk) {
      print("::: ${rep.statusCode}");
      print("::: ${rep.body}");
      return rep.body;
    } else {
      print("::: ${rep.statusCode}");
      print("::: ${rep.body}");
      return [];
    }
  }

  Future<List> enregistrer(Map e) async {
    Response rep = await requete.postE("tickets", e);
    if (rep.isOk) {
      print(rep.body);
      return rep.body;
    } else {
      print(rep.body);
      return [];
    }
  }
}
