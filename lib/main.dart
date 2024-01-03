import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/course/course_controller.dart';
import 'pages/recherche/recherche_controller.dart';
import 'pages/splash.dart';
import 'pages/vendeur/recherche/lieu_controller.dart';
import 'pages/vendeur/recherche/resultat_controller.dart';
import 'pages/vendeur/reservations/paiement/paiement_controller.dart';
import 'pages/vendeur/reservations/reservation_controller.dart';
import 'utils/app_controller.dart';

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  //
  RechercheController rechercheController = Get.put(RechercheController());
  //
  CourseController courseController = Get.put(CourseController());
  //
  ReservationController reservationController =
      Get.put(ReservationController());
  //
  PaiementController paiementController = Get.put(PaiementController());
  //
  LieuController lieuController = Get.put(LieuController());
  //
  ResultatController resultatController = Get.put(ResultatController());
  //
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.indigo.shade900));
  await GetStorage.init();
  //
  AppController appController = Get.put(AppController());
  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kenda Agent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
        textTheme: const TextTheme(),
      ).copyWith(
        bottomSheetTheme: const BottomSheetThemeData(
          modalBackgroundColor: Colors.transparent,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
        primaryColor: Colors.blue,
        backgroundColor: Colors.grey.shade200,
        appBarTheme: AppBarTheme(
          color: Colors.grey.shade200,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.grey.shade200,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.blue.shade700,
          linearMinHeight: 1.5,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.blue,
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.blue,
            primary: Colors.white,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Colors.purple,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      home: Splash(),
    );
  }
}
