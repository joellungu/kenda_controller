import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_agent/pages/vendeur/reservations/paiement/paiement_controller.dart';
import 'package:kenda_agent/utils/requetes.dart';

class InfoSupplementaireLoad extends StatelessWidget {
  String? id;
  String? arrive;
  InfoSupplementaireLoad({Key? key, this.id, this.arrive}) : super(key: key) {
    print(id!);
    print(arrive!);
  }
  //
  PaiementController paiementController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: paiementController.getBuss(id!),
          builder: (c, t) {
            if (t.hasData) {
              Map details = t.data as Map;
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            //
                            Get.back();
                            //
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 40,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Informations supplémentaire",
                            children: [
                              TextSpan(
                                text: "",
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        //                           Text(
                        //   "Info trajet",
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 20,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                //
                                //Get.back();
                                //
                              },
                              icon: const Icon(
                                CupertinoIcons.bus,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "${details['nom']}\n", //Transco Métro
                                children: [
                                  TextSpan(
                                    text: "vers $arrive",
                                    style: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey.shade900,
                                ),
                              ),
                            ),
                          ],
                        ),
                        (details['logo'] != null)
                            ? Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "${Requete.urlSt}companie/profil.png?id=${details['idPartenaire']}"),
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              )
                            : Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  //color: Colors.red,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Icon(
                                  Icons.photo_camera,
                                  color: Colors.white,
                                ),
                              )
                        //Text("LOGO")
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Divider(),
                              ListTile(
                                title: Text(
                                  "Info. Bus",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.safety_divider),
                                title: Text("Nombre de places"),
                                subtitle: Text("${details['capacite']}"),
                              ),
                              ListTile(
                                leading:
                                    Icon(CupertinoIcons.thermometer_snowflake),
                                title: Text(
                                    " ${details['climatisation'] ? '' : 'Non '} Climatisé"),
                                //subtitle: const Text("Receptionniste"),
                              ),
                              ListTile(
                                leading: Icon(CupertinoIcons.gauge),
                                title: Text("Vitesse max"),
                                subtitle: Text("250 Km/h"),
                              ),
                              ListTile(
                                leading: Icon(CupertinoIcons.wrench_fill),
                                title: Text("Plus"),
                                subtitle:
                                    Text("${details['caracteristiques']}"),
                              ),
                              Divider(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else if (t.hasError) {
              return Container();
            }
            return Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            );
          },
        ));
  }
}
