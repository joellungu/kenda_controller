import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_agent/utils/requetes.dart';

class CourseController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //recherche
//   recherche(String id, String phone) async {
//     //
//     change([], status: RxStatus.loading());
// //
//     Response rep = await requete.getE("tickets/recherche/$id/$phone");
//     print(rep.statusCode);
//     print(rep.body);
//     if (rep.isOk) {
//       //
//       change(rep.body, status: RxStatus.success());
//     } else {
//       //
//       change([], status: RxStatus.empty());
//     }
//     //
//   }
//   //course
  course() async {
    //
    //change([], status: RxStatus.loading());
//
    var box = GetStorage();
    Map a = box.read("agent") ?? {};
    DateTime dt = DateTime.now();
    String d = "${dt.day}-${dt.month}-${dt.year}";
    print(d);
    print("${a['idPartenaire']}");
    //d
    //${a['idPartenaire']}
    Response rep =
        await requete.getE("tickets/courseday/${a['idPartenaire']}/$d");
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
