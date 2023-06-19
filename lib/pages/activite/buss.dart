import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_agent/utils/app_controller.dart';

class Buss extends StatelessWidget {
  List l;
  int capacite;
  Buss(this.l, this.capacite) {
    //print("infos bus: ${e['bus']}");
  }
  //
  AppController appController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
/*
"place"
    return Center(
      child: Table(
        columnWidths: {2: FractionColumnWidth(.08)},
        defaultColumnWidth: const FractionColumnWidth(0.20),
        children: List.generate(
          12,
          (index) {
            return TableRow(
              children: List.generate(
                5,
                (i) {
                  if (i != 2) {
                    return Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.chair_outlined,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            );
          },
        ),
      ),
    );

*/
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      childAspectRatio: 1,
      children: List.generate(
        capacite,
        (index) {
          bool choix = false;
          int iindex = 0;
          //
          for (var element in l) {
            choix = element['emplacement'] == index;

            if (choix) {
              iindex = element['emplacement'];
              print("choisi: $choix = $index = ${element['emplacement']}");
              break;
            }
          }
          ;
          //
          if (choix) {
            return InkWell(
              onTap: () {
                //status//idAgent
                //
                var box = GetStorage();
                Map agent = box.read('agent') ?? {};
                //
                Get.dialog(
                  const Material(
                    color: Colors.transparent,
                    child: Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                );
                Map ticket = {};
                for (var x in l) {
                  if (x["emplacement"] == index) {
                    ticket = x;
                  }
                }
                ticket['status'] = 1;
                ticket['idAgent'] = agent['id'];
                print("l'index: $iindex");
                appController.putDataAgent(ticket);
                //
                print(index);
              },
              child: Container(
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.red.shade900,
                  size: 40,
                ),
              ),
            );
          } else {
            RxBool s = false.obs;
            return Obx(
              () => Container(
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: s.value ? Colors.green : Colors.black, width: 1),
                ),
                child: Icon(
                  s.value ? Icons.check : Icons.chair_outlined,
                  color: Colors.grey,
                  size: 40,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
