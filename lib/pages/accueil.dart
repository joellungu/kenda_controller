import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'activite/activite.dart';
import 'profil/profil.dart';

class Accueil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Accueil();
  }
}

class _Accueil extends State<Accueil> {
  //
  RxInt index = 0.obs;
  //
  var box = GetStorage();
  Map e = {};
  //
  @override
  void initState() {
    //
    e = box.read("agent") ?? {};
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kenda",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: Obx(
        () => index.value == 0 ? Activite() : Profil(e, true),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (e) {
          setState(() {
            index.value = e;
          });
        },
        currentIndex: index.value,
        selectedItemColor: Colors.indigo.shade900,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.list_dash), label: "Activité"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: "Profil"),
        ],
      ),
    );
  }
}

/**
 * Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      padding: const EdgeInsets.all(20),
                      children: List.generate(menus.length, (index) {
                        return Card(
                          elevation: 1,
                          child: InkWell(
                            onTap: () {
                              //
                              if (index == 0) {
                                Get.to(const Reservation());
                              } else if (index == 1) {
                                Get.to(Profil());
                              } else if (index == 2) {
                                Get.to(Notifications());
                              } else if (index == 3) {
                                Get.to(Historiques());
                              } else {
                                Get.to(Propos());
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: SizedBox(
                                    child: Image.asset(
                                      "assets/${menus[index]['icon']}",
                                    ),
                                    // child: Icon(
                                    //   menus[index]['icon'],
                                    //   color: Colors.blue,
                                    //   size: 100,
                                    // ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                    child: Text(
                                      //nunito
                                      //cutiveMono
                                      "${menus[index]['titre']}",
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.green.shade700,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "K'enda",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
 */
