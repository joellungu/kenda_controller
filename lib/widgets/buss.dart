import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:kenda/pages/reservations/reservation_controller.dart';
import 'package:kenda_agent/pages/vendeur/reservations/reservation_controller.dart';

class Buss extends StatelessWidget {
  List l;
  Map e;
  Buss(this.l, this.e) {
    //print("infos bus: ${e['bus']}");
  }

  ReservationController reservationController = Get.find();
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
        e['bus']['capacite'],
        (index) {
          bool choix = false;
          //
          for (var element in l) {
            choix = element['emplacement'] == index;
            if (choix) {
              print("choisi: $choix = $index = ${element['emplacement']}");
              break;
            }
          }
          ;
          //
          if (choix) {
            return Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.close,
                color: Colors.red.shade900,
                size: 40,
              ),
            );
          } else {
            RxBool s = false.obs;
            return InkWell(
              onTap: () {
                //
                s.value = !s.value;

                if (s.value) {
                  //
                  final formKey = GlobalKey<FormState>();
                  final nomComplet = TextEditingController();
                  final telephone = TextEditingController();
                  final adresse = TextEditingController();
                  RxInt c = 1.obs;
                  //
                  Get.dialog(
                    Material(
                      color: Colors.white,
                      child: Center(
                        child: Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            child: Form(
                              key: formKey,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text:
                                            "Information personnel\n", //Transco Métro
                                        children: [
                                          TextSpan(
                                            text:
                                                "Vos informations personnels seront utilisés pour la feuille de route et dans differents passages.",
                                            style: TextStyle(
                                              color: Colors.grey.shade900,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey.shade900,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: nomComplet,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        prefixIcon: const Icon(Icons.person),
                                        hintText: 'Nom complet'.tr,
                                        labelText: 'Nom complet'.tr,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 9) {
                                          return 'Nom complet'.tr;
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        //print("Password value $value");
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: telephone,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        prefixIcon: const Icon(Icons.phone),
                                        prefix: const Text("243 "),
                                        hintText: 'telephone'.tr,
                                        labelText: 'telephone'.tr,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'telephone'.tr;
                                        } else if (!value.isPhoneNumber) {
                                          return "telephone erreur";
                                        }

                                        return null;
                                      },
                                      onChanged: (value) {
                                        //print("Password value $value");
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: adresse,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        prefixIcon:
                                            const Icon(Icons.location_on),
                                        hintText: 'adresse'.tr,
                                        labelText: 'adresse'.tr,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'adresse_message'.tr;
                                        }

                                        return null;
                                      },
                                      onChanged: (value) {
                                        //print("Password value $value");
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Obx(
                                      () => Container(
                                        height: 55,
                                        //
                                        // ignore: sort_child_properties_last
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.person,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<int>(
                                                  items: const [
                                                    //"Chauffeur","Receveur","Embarqueur"
                                                    DropdownMenuItem(
                                                      child: Text("Homme"),
                                                      value: 1,
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text("Femme"),
                                                      value: 2,
                                                    ),
                                                  ],
                                                  onChanged: (e) {
                                                    c.value = e as int;
                                                  },
                                                  value: c.value,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          //
                                          Map u = {
                                            "emplacement": index,
                                            "nom": nomComplet.text,
                                            "telephone": "243${telephone.text}",
                                            "adresse": adresse.text,
                                            "sexe": [
                                              "Homme",
                                              "Femme",
                                            ][c.value - 1],
                                          };
                                          // Get.dialog(
                                          //   const Center(
                                          //     child: SizedBox(
                                          //       height: 40,
                                          //       width: 40,
                                          //       child:
                                          //           CircularProgressIndicator(),
                                          //     ),
                                          //   ),
                                          // );
                                          reservationController.places.add(u);
                                          //
                                          Get.back();
                                          //agentController.enregistrement(u);
                                        }
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 5,
                                          bottom: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.indigo.shade900,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // gradient: LinearGradient(
                                          //   begin: Alignment.centerLeft,
                                          //   end: Alignment.centerRight,
                                          //   colors: <Color>[Colors.yellow.shade700, Colors.black],
                                          // ),
                                        ),
                                        child: Text(
                                          "Enregistrer".tr,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        s.value = !s.value;
                                        Get.back();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 5,
                                          bottom: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red.shade900,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // gradient: LinearGradient(
                                          //   begin: Alignment.centerLeft,
                                          //   end: Alignment.centerRight,
                                          //   colors: <Color>[Colors.yellow.shade700, Colors.black],
                                          // ),
                                        ),
                                        child: Text(
                                          "Annuler".tr,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                  //
                } else {
                  reservationController.places.remove(index);
                }
                //
                print(index);
              },
              child: Obx(
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
              ),
            );
          }
        },
      ),
    );
  }
}
