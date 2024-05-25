import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_agent/pages/vendeur/reservations/details/details.dart';
import 'package:kenda_agent/utils/requetes.dart';
import 'package:kenda_agent/utils/utils.dart';
// import 'package:kenda/pages/recherche/infos.dart';
// import 'package:kenda/pages/reservations/details/details.dart';
// import 'package:kenda/utils/requetes.dart';
// import 'package:kenda/utils/utils.dart';
// import 'package:kenda/widgets/modal.dart';

import 'resultat_controller.dart';

// class Resultat extends GetView<ResultatController> {
//   @override
//   State<StatefulWidget> createState() {
//     return _Resultat();
//   }
// }

class Resultat extends GetView<ResultatController> {
  //
  String depart;
  String arrive;
  int jour;
  Resultat(this.depart, this.arrive, this.jour) {
    controller.rechercher(
      depart,
      arrive,
      jour,
    );
  }
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            snap: false,
            floating: false,
            centerTitle: false,
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
            // title: const Text(
            //   "Choix du bus",
            //   style: TextStyle(
            //     color: Colors.white,
            //   ),
            // ),
            // leading: IconButton(
            //   onPressed: () {
            //     //
            //   },
            //   icon: Icon(
            //     Icons.arrow_back,
            //     color: Colors.white,
            //   ),
            // ),
            expandedHeight: Get.size.height / 5,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 55,
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          flex: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                CupertinoIcons.bus,
                                size: 35,
                                color: Colors.white,
                              ),
                              Text("Bus")
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              titlePadding: const EdgeInsets.all(0),
              expandedTitleScale: 1,
              background: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Choix du bus",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "  $depart   ",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.grey.shade400,
                        size: 20,
                      ),
                      Text(
                        "  $arrive",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              // centerTitle: false,
            ),
            // bottom: PreferredSize(
            //   child: Container(color: Colors.green),
            //   preferredSize: Size(50, 50),
            // ),
          ),
          SliverToBoxAdapter(
            child: Card(
              elevation: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Du ${DateTime.now().day}, ${getMoisEnLettre(DateTime.now().month)}, ${DateTime.now().year} "),
                    Text("Total de bus"),
                  ],
                ),
              ),
            ),
          ),
          controller.obx(
            ((state) {
              List l = state!;
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    Map e = l[index];
                    print('id: ${e['id']}');
                    //
                    List dep = "${e['heureDepart']}".split(":");
                    List arr = "${e['heureArrive']}".split(":");
                    int prix = int.parse("${e['prix']}".split(".")[0]);
                    return Card(
                      child: SizedBox(
                        //color: index.isOdd ? Colors.white : Colors.black12,
                        height: 170.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // index.isOdd
                            //     ? Expanded(
                            //         flex: 2,
                            //         child: Container(),
                            //       )
                            //     : Container(),
                            Expanded(
                              flex: 7,
                              child: InkWell(
                                onTap: () {
                                  //
                                  //print(e['bus']);
                                  Get.to(Details(e, depart, arrive));
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: "${dep[0]}:${dep[1]}\n",
                                                  children: const [
                                                    TextSpan(
                                                      text: "Départ",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    )
                                                  ],
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              // color: Colors.green,
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Icon(
                                                Icons.arrow_forward,
                                                size: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              alignment: Alignment.center,
                                              //color: Colors.green,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: "${arr[0]}:${arr[1]}\n",
                                                  children: const [
                                                    TextSpan(
                                                      text: "Arrivé",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                top: 13,
                                              ),
                                              alignment: Alignment.topCenter,
                                              //color: Colors.blue,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "$prix Fc ",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 13,
                                                    color:
                                                        Colors.green.shade800,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //12 Places disponible
                                            Text(
                                              "",
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${Requete.urlSt}/companie/profil.png?id=${e['idPartenaire']}"),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                )
                                                //const Text("LOGO"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey.shade300,
                              height: 1,
                            ),
                            Expanded(
                              flex: 3,
                              child: InkWell(
                                onTap: () {
                                  //
                                  //showSimpleModal(Infos(e), context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                    bottom: 5,
                                  ),
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Durée ${getDuree('${e['heureDepart']}', '${e['heureArrive']}', e['nombreJours'])}",
                                        style: TextStyle(
                                          color: Colors.grey.shade800,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Info trajet ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 13,
                                            color: Colors.grey.shade800,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: l.length,
                ),
              );
            }),
            onEmpty: SliverToBoxAdapter(
              child: Container(),
            ),
            onLoading: const SliverToBoxAdapter(
              child: Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getDuree(String heureDepart, String heureArrive, int nombreJours) {
    //
    DateTime d1 = DateTime(0, 1, 1, int.parse(heureDepart.split(":")[0]),
        int.parse(heureDepart.split(":")[1]));
    DateTime d2 = DateTime(0, 1, 1, int.parse(heureArrive.split(":")[0]),
        int.parse(heureArrive.split(":")[1]));
    //
    Duration heure = d2.difference(d1);
    //DateUtils.getDaysInMonth(widget.annee, widget.mois);
    //
    return "${nombreJours == 1 ? heure.inHours : '$nombreJours J et ${heure.inHours}'} h";
  }
}
