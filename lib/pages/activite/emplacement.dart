import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_agent/utils/app_controller.dart';
import 'buss.dart';

class Emplacement extends StatefulWidget {
  //
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Emplacement();
  }
}

class _Emplacement extends State<Emplacement> {
  AppController appController = Get.find();

  //
  DateTime date = DateTime.now();
  //
  Map agent = {};
  //idPartenaire
  @override
  void initState() {
    //
    var box = GetStorage();
    agent = box.read('agent') ?? {};
    print("Agent: $agent");
    //
    super.initState();
    //
    date = DateTime.now();
    //
  }

  @override
  void dispose() {
    //
    super.dispose();
    //
    //reservationController.places.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: appController.getHoraire(
                "${agent['idPartenaire']}", "5-6-2023", 0),
            builder: (c, t) {
              if (t.hasData) {
                List l = t.data as List;
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
                          SizedBox(
                            width: 15,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Emplacement dans le bus\n",
                              children: [
                                TextSpan(
                                  text: "${l.length} Places déjà pris",
                                  style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
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
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Buss(l, 40),
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
          )),
    );
  }
}
