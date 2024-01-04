import 'package:get/get.dart';
import 'package:kenda_agent/utils/requetes.dart';

class HistoriqueController extends GetxController with StateMixin<List> {
  Requete requete = Requete();
  //
  touteReservation(String idAgentVendeur, String date) async {
    //
    change([], status: RxStatus.loading());
    //
    Response response =
        await requete.getE("tickets/ticketvendupar/$idAgentVendeur/$date");
    //
    if (response.isOk) {
      //
      print("::: ${response.statusCode}");
      print("::: ${response.body}");
      change(response.body, status: RxStatus.success());
    } else {
      //
      print("::: ${response.statusCode}");
      print("::: ${response.body}");
      change([], status: RxStatus.empty());
    }
  }
}
