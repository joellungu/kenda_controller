import 'package:get/get.dart';
import 'package:kenda_agent/utils/requetes.dart';

class RechercheController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  recherche(String id, String phone) async {
    //
    //change([], status: RxStatus.loading());

    DateTime dt = DateTime.now();
    String d = "${dt.day}-${dt.month}-${dt.year}";
//
    Response rep = await requete.getE("tickets/recherche/$id/$phone/$d");
    print(rep.statusCode);
    print(rep.body);
    if (rep.isOk) {
      //
      change(rep.body, status: RxStatus.success());
    } else {
      //
      change([], status: RxStatus.empty());
    }
    //
  }
}
