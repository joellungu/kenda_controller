import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarteBus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  double taille = 45;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height / 1.1,
      width: Get.size.width,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 5,
      ),
      decoration: BoxDecoration(
        //color: Colors.lightBlue,
        border: Border.all(
          color: Colors.blue,
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 40,
                width: 70,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 40,
                width: 70,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    topLeft: Radius.circular(40),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                //height: 70,
                //width: 70,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                //height: 70,
                //width: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: List.generate(10, (index) {
                          RxBool c1 = false.obs;
                          RxBool c2 = false.obs;
                          RxBool c3 = false.obs;
                          //
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: InkWell(
                                    onTap: () {
                                      c2.value = !c2.value;
                                    },
                                    child: Obx(
                                      () => Icon(
                                        Icons.chair_outlined,
                                        size: taille,
                                        color: c2.value
                                            ? Colors.blue
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: InkWell(
                                    onTap: () {
                                      c3.value = !c3.value;
                                    },
                                    child: Obx(
                                      () => Icon(
                                        Icons.chair_outlined,
                                        size: taille,
                                        color: c3.value
                                            ? Colors.blue
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: List.generate(10, (index) {
                          RxBool c1 = false.obs;
                          RxBool c2 = false.obs;

                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: InkWell(
                                    onTap: () {
                                      c1.value = !c1.value;
                                    },
                                    child: Obx(
                                      () => Icon(
                                        Icons.chair_outlined,
                                        size: taille,
                                        color: c1.value
                                            ? Colors.blue
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: InkWell(
                                    onTap: () {
                                      c2.value = !c2.value;
                                    },
                                    child: Obx(
                                      () => Icon(
                                        Icons.chair_outlined,
                                        size: taille,
                                        color: c2.value
                                            ? Colors.blue
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * .03, size.height);
    path.quadraticBezierTo(
        size.width * .2, size.height * .5, size.width * .03, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}
