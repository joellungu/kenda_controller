import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_agent/pages/vendeur/recherche/lieu_controller.dart';
import 'package:kenda_agent/widgets/lieu.dart';
import 'package:kenda_agent/widgets/modal.dart';

import 'resultat.dart';
// import 'package:kenda/widgets/lieu.dart';
// import 'package:kenda/pages/recherche/lieu_controller.dart';
// import 'package:kenda/pages/recherche/resultat.dart';
// import 'package:kenda/utils/utils.dart';
// import 'package:kenda/widgets/modal.dart';

class Recherche extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Recherche();
  }
}

class _Recherche extends State<Recherche> {
  RxList categorie = [].obs;
  double top = 0.0;
  double y = -1.5;
  double y1 = -1.5;
  double y2 = -1;
  //
  RxBool renverser = false.obs;
  //
  //String jour = "", mois = "", annee = "";
  //
  String nombreP = '1';
  //

  RxInt jour = 1.obs;

  // List of items in our dropdown menu
  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
  ];
  //
  LieuController lieuController = Get.find();
  //
  var box = GetStorage();
  //
  RxList liste = RxList();
  //
  @override
  void initState() {
    //
    super.initState();
    //
    try {
      List ll = box.read("historiques") ?? [];
      liste.value = ll.toSet().toList();
      print(liste.value);
    } catch (e) {
      print(e);
    }
    //
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          //backgroundColor: Colors.grey.shade150,
          body: Stack(
            children: [
              NotificationListener<ScrollNotification>(
                onNotification: (sn) {
                  print("p: ${sn.metrics.pixels}");
                  print("eA: ${sn.metrics.extentAfter}");
                  print("eB: ${sn.metrics.extentBefore}");
                  print("eI: ${sn.metrics.extentInside}");
                  print("msE: ${sn.metrics.maxScrollExtent}");
                  print("msE: ${sn.metrics.minScrollExtent}");

                  if (sn.metrics.pixels <= 190) {
                    print('Get more data');
                    y = y1;
                    setState(() {});
                  } else {
                    y = y2;
                    setState(() {});
                  }
                  return true;
                },
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.black,
                      onStretchTrigger: () {
                        print("Le truc strck");
                        return Future.value();
                      },
                      pinned: true,
                      snap: false,
                      floating: false,
                      expandedHeight: Get.size.height / 3.7,
                      flexibleSpace: FlexibleSpaceBar(
                        expandedTitleScale: 2,
                        background: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          //
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.white,
                                              content: Container(
                                                height: 120,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: const Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ListTile(
                                                      leading: Icon(Icons
                                                          .help_outline_outlined),
                                                      title:
                                                          Text("Aide et FAQ"),
                                                    ),
                                                    ListTile(
                                                      leading: Icon(
                                                          CupertinoIcons
                                                              .info_circle),
                                                      title: Text(
                                                          "À propos de l'application"),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                          //showModalBottomSheet(context: context, builder: builder)
                                          // showBottomSheet(
                                          //   context: context,
                                          //   builder: (c) {
                                          //     return SizedBox(
                                          //       height: 100,
                                          //       child: Column(
                                          //         mainAxisAlignment:
                                          //             MainAxisAlignment.center,
                                          //         children: const [
                                          //           ListTile(
                                          //             leading: Icon(Icons
                                          //                 .help_outline_outlined),
                                          //             title:
                                          //                 Text("Aide et FAQ"),
                                          //           ),
                                          //           ListTile(
                                          //             leading: Icon(
                                          //                 CupertinoIcons
                                          //                     .info_circle),
                                          //             title: Text(
                                          //                 "À propos de l'application"),
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     );
                                          //   },
                                          // );
                                        },
                                        icon: const Icon(
                                          Icons.help,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Text(
                                        "Horaires et billets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          //
                                        },
                                        icon: Icon(
                                          Icons.help,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      //
                                      showSimpleModal(Lieu(0), context);

                                      //
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.black,
                                      ),
                                      elevation: MaterialStateProperty.all(0),
                                    ),
                                    child: SizedBox(
                                      width: Get.size.width / 1.2,
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Obx(
                                              () => Text(
                                                renverser.value
                                                    ? "Arrivée"
                                                    : "Départ",
                                                style: TextStyle(
                                                  color: Colors.grey.shade500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 9,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Obx(
                                                  () => Text(
                                                    renverser.value
                                                        ? lieuController
                                                            .arrive.value
                                                        : lieuController
                                                            .depart.value,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade400,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      showSimpleModal(Lieu(1), context);
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.black,
                                      ),
                                      elevation: MaterialStateProperty.all(0),
                                    ),
                                    child: SizedBox(
                                      width: Get.size.width / 1.2,
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Obx(
                                              () => Text(
                                                renverser.value
                                                    ? "Départ"
                                                    : "Arrivée",
                                                style: TextStyle(
                                                  color: Colors.grey.shade500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 9,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Obx(
                                                  () => Text(
                                                    renverser.value
                                                        ? lieuController
                                                            .depart.value
                                                        : lieuController
                                                            .arrive.value,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade400,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Text(
                                  //         "Via",
                                  //         style: TextStyle(
                                  //           fontSize: 17.0,
                                  //           color: Colors.grey.shade400,
                                  //         ),
                                  //       ),
                                  //       IconButton(
                                  //         onPressed: () {
                                  //           //
                                  //         },
                                  //         icon: Icon(
                                  //           Icons.help,
                                  //           color: Colors.green.shade900,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.only(right: 10, bottom: 40),
                            //   child: Align(
                            //     alignment: Alignment.centerRight,
                            //     child: InkWell(
                            //       onTap: () {
                            //         renverser.value =
                            //             renverser.value ? false : true;
                            //       },
                            //       child: Container(
                            //         height: 32,
                            //         width: 32,
                            //         // foregroundDecoration: BoxDecoration(
                            //         //   color: Colors.yellow,
                            //         //   borderRadius: BorderRadius.circular(16),
                            //         // ),
                            //         decoration: BoxDecoration(
                            //           color: Colors.green.shade900,
                            //           border: Border.all(
                            //             color: Colors.indigo.shade700,
                            //             width: 2,
                            //           ),
                            //           borderRadius: BorderRadius.circular(16),
                            //         ),
                            //         child: RotatedBox(
                            //           quarterTurns: 45,
                            //           child: Icon(
                            //             Icons.sync,
                            //             color: Colors.grey.shade500,
                            //           ),
                            //         ),
                            //         //color: Colors.grey.shade600,
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                        centerTitle: false,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              width: Get.size.width / 1.1,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          " Jour ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Obx(
                                      () => DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: jour.value,
                                          isExpanded: true,
                                          items: List.generate(
                                            7,
                                            (index) => DropdownMenuItem(
                                              value: index + 1,
                                              child: Text([
                                                "Lundi",
                                                "Mardi",
                                                "Mercredi",
                                                "Jeudi",
                                                "Vendredi",
                                                "Samedi",
                                                "Dimanche"
                                              ][index]),
                                            ),
                                          ),
                                          onChanged: (j) {
                                            jour.value = j as int;
                                            print(jour.value);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            /*
                              Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                width: Get.size.width / 1,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Adulte",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 8,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Aller ",
                                              style: TextStyle(
                                                fontSize: 17,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.grey.shade600,
                                              size: 13,
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            */
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                //Get.to(Resultat({}));
                                if (lieuController.depart.value.isNotEmpty &&
                                    lieuController.arrive.value.isNotEmpty) {
                                  //
                                  liste.add(
                                      "${lieuController.depart.value}|${lieuController.arrive.value}|${jour.value}");
                                  box.write("historiques", liste.value);
                                  //
                                  Get.to(
                                    Resultat(
                                        lieuController.depart.value,
                                        lieuController.arrive.value,
                                        jour.value),
                                  );
                                  //
                                } else {
                                  //
                                  Get.snackbar(
                                    "Attention",
                                    "Veuillez selectionner le lieu de départ et d'arrivé.",
                                    colorText: Colors.white,
                                    snackStyle: SnackStyle.GROUNDED,
                                  );
                                  //
                                }
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.green.shade900,
                                ),
                                elevation: MaterialStateProperty.all(0),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                child: Text(
                                  "Rechercher",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                width: Get.size.width / 1.2,
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, top: 20),
                                child: Text(
                                  "Dernière recherche effectué",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(
                      () => SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            String e = liste.toList()[index];
                            List l = e.split("|");
                            //,,
                            Map x = {
                              "depart": l[0],
                              "arriver": l[1],
                              "jour": l[2],
                            };
                            return Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              //color: index.isOdd ? Colors.white : Colors.black12,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              height: 60.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.grey.shade800,
                                      size: 30,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 7,
                                          child: InkWell(
                                            onTap: () {
                                              //depart,arriver,jour
                                              print(
                                                  "${x['depart']}--${x['arriver']}--${x['jour']}-- ");
                                              //
                                              Get.to(
                                                Resultat(
                                                  x['depart'],
                                                  x['arriver'],
                                                  jour.value,
                                                  // int.parse(
                                                  // x['jour'],
                                                  // ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: "${x['depart']}\n",
                                                  children: [
                                                    TextSpan(
                                                      text: "${x['arriver']}",
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  //
                                                  setState(() {
                                                    //
                                                    liste.removeAt(index);
                                                    //
                                                    box.write(
                                                        "historiques", liste);
                                                    //
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  size: 26,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          childCount: liste.length,
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 200,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedAlign(
                alignment: Alignment(0, y),
                duration: const Duration(milliseconds: 800),
                child: Container(
                  height: 55,
                  color: Colors.green.shade900,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Text(
                        "AIYA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //Get.to(Lunette());
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoriqueRecherche extends StatefulWidget {
  Map e;
  HistoriqueRecherche(this.e);
  //
  @override
  State<StatefulWidget> createState() {
    return _HistoriqueRecherche();
  }
}

class _HistoriqueRecherche extends State<HistoriqueRecherche> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //depart,arriver,jour
        print(
            "${widget.e['depart']}--${widget.e['arriver']}--${widget.e['jour']}-- ");
        //
        Get.to(
          Resultat(
            widget.e['depart'],
            widget.e['arriver'],
            int.parse(
              widget.e['jour'],
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        //color: index.isOdd ? Colors.white : Colors.black12,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(3),
        ),
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: RotatedBox(
                quarterTurns: 90,
                child: IconButton(
                  icon: Icon(
                    Icons.sync,
                    color: Colors.grey.shade800,
                    size: 30,
                  ),
                  onPressed: () {
                    //
                  },
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: "${widget.e['depart']}\n",
                          children: [
                            TextSpan(
                              text: "${widget.e['arriver']}",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Icon(
                        //   Icons.search,
                        //   size: 35,
                        //   color: Colors.grey.shade600,
                        // ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 13,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
