import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_agent/utils/app_controller.dart';

class TicketDetails extends StatelessWidget {
  String? uniqueCode;
  String? idPartenaire;
  int type;
  //
  AppController appController = Get.find();
  //
  TicketDetails(this.idPartenaire, this.uniqueCode, this.type) {
    //print(e);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo.shade900,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: FutureBuilder(
          future: appController.getDetails(idPartenaire!, """$uniqueCode"""),
          builder: (c, t) {
            if (t.hasData) {
              Map e = t.data as Map;
              return Scaffold(
                appBar: AppBar(
                  centerTitle: false,
                  title: const Text(
                    "Détails du billet",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.indigo.shade900,
                  leading: IconButton(
                    onPressed: () {
                      //
                      Get.back();
                      //
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                body: ListView(
                  children: [
                    Container(
                      height: Get.size.height / 7,
                      color: Colors.indigo.shade100,
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            color: Colors.indigoAccent.shade400,
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Trajet éffectué en bus"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${e['itinerance']}".split("à")[0],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${e['itinerance']}"
                                            .split("à")[1]
                                            .replaceAll(" ", ""),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.center,
                              child: Icon(
                                CupertinoIcons.qrcode_viewfinder,
                                size: 100,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: Get.size.height / 6,
                      //color: Colors.blue,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 22,
                              bottom: 5,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Départ : ${getDate(e['dateDepart'])}",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 22,
                                  bottom: 5,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Heure: ${e['heureDepart']}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                                // color: Colors.green,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 22,
                              bottom: 5,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Réf : ${e['unique_code']}",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              //
                              // showSimpleModal(
                              //     InfoSupplementaireLoad(
                              //       id: "${e['idBoutique']}",
                              //       arrive: "${e['itinerance']}"
                              //           .split("à")[1]
                              //           .replaceAll(" ", ""),
                              //     ),
                              //     context);
                            },
                            leading: const Icon(CupertinoIcons.qrcode),
                            title: e['status'] == 0
                                ? const Text(
                                    "Ticket non scané",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : e['status'] == 1
                                    ? const Text("Ticket déjà")
                                    : const Text("Ticket déjà"),
                            subtitle: const Text("Type"),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              //showSimpleModal(Emplacement(), context);
                            },
                            leading:
                                Icon(Icons.airline_seat_recline_extra_rounded),
                            title: const Text("Emplacement dans le bus"),
                            subtitle: Text("Place N° ${e['emplacement']}"),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              //showSimpleModal(Emplacement(), context);
                            },
                            leading:
                                Icon(Icons.airline_seat_recline_extra_rounded),
                            title: const Text("Emplacement dans le bus"),
                            subtitle:
                                Text("Place N° ${e['infoPersonnel']['nom']}"),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              //showSimpleModal(Emplacement(), context);
                            },
                            leading:
                                Icon(Icons.airline_seat_recline_extra_rounded),
                            title: const Text("Emplacement dans le bus"),
                            subtitle: Text(
                                "Place N° ${e['infoPersonnel']['telephone']}"),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              //showSimpleModal(Emplacement(), context);
                            },
                            leading:
                                Icon(Icons.airline_seat_recline_extra_rounded),
                            title: const Text("Emplacement dans le bus"),
                            subtitle: Text(
                                "Place N° ${e['infoPersonnel']['adresse']}"),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              //showSimpleModal(Emplacement(), context);
                            },
                            leading:
                                Icon(Icons.airline_seat_recline_extra_rounded),
                            title: const Text("Emplacement dans le bus"),
                            subtitle:
                                Text("Place N° ${e['infoPersonnel']['sexe']}"),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ),
                          // const ListTile(
                          //   leading: Icon(Icons.map),
                          //   title: Text("Voir la carte"),
                          //   subtitle: Text("12 arrets"),
                          //   trailing: Icon(
                          //     Icons.arrow_forward_ios,
                          //     size: 15,
                          //   ),
                          // ),
                          // Divider(
                          //   color: Colors.grey,
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
                bottomNavigationBar: e['status'] == 0 && type == 1
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                        ),
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 6,
                              child: Container(
                                //color: Colors.grey,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 20),
                                child: getDetails("$idPartenaire"),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: InkWell(
                                onTap: () {
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
                                  Map ticket = e;
                                  ticket['status'] = 1;
                                  ticket['idAgent'] = agent['id'];
                                  //print("l'index: $iindex");
                                  appController.putDataAgent(ticket);
                                  //showSimpleModal(TicketQrCode(e), context);
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  color: Colors.green.shade800,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Enregistrer",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : e['status'] == 1 && type == 2
                        ? Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 1,
                                ),
                              ),
                            ),
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    //color: Colors.grey,
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 20),
                                    child: getDetails("$idPartenaire"),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: InkWell(
                                    onTap: () {
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
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                        ),
                                      );
                                      Map ticket = e;
                                      ticket['status'] = 2;
                                      ticket['idAgent'] = agent['id'];
                                      //print("l'index: $iindex");
                                      appController.putDataAgent(ticket);
                                      //showSimpleModal(TicketQrCode(e), context);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(5),
                                      color: Colors.green.shade800,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Sortie",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: 30,
                          ),
              );
            } else if (t.hasError) {
              return Scaffold(
                appBar: AppBar(),
              );
            }
            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //
  Widget getDetails(String idPartenaire) {
    print(idPartenaire);
    return FutureBuilder(
      future: appController.getCompanie(idPartenaire),
      builder: (c, t) {
        if (t.hasData) {
          Map d = t.data as Map;
          return RichText(
            text: TextSpan(
              text: "Tajet effectué avec\n",
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: "${d['nom']}",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        } else if (t.hasError) {
          return Container();
        }
        return Container();
      },
    );
  }

  //
  String getDate(String dateDepart) {
    //
    List date = dateDepart.split("-");
    //
    List semaine = [
      "",
      "Lun",
      "Mar",
      "Mer",
      "Jeu",
      "Ven",
      "Sam",
      "Dim",
    ];
    //
    List mois = [
      "",
      "Jen",
      "Fev",
      "Mar",
      "Avr",
      "Mai",
      "Juin",
      "Juil",
      "Aout",
      "Sep",
      "Oct",
      "Nom",
      "Dec",
    ];
    //
    DateTime d = DateTime(
      int.parse(date[2]),
      int.parse(date[1]),
      int.parse(date[0]),
    );
    //
    String jour = semaine[d.weekday];
    String moi = mois[d.month];
    //DateUtils.getDaysInMonth(widget.annee, widget.mois);
    //
    return "$jour. ${d.day} $moi";
  }
//
}
