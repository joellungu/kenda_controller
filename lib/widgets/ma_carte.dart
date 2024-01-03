import 'package:flutter/material.dart';
//import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/state_manager.dart';

class MaCarte extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaCarte();
  }
}

class _MaCarte extends State<MaCarte> {
  RxMap pos = {"lat": -4.34367258730203, "lon": 15.339215138650047}.obs;
  //
  //MapController controller = MapController(
    //initMapWithUserPosition: true,
    // initPosition: GeoPoint(
    //   latitude: -4.34367258730203,
    //   longitude: 15.339215138650047,
    // ),
    // areaLimit: BoundingBox(
    //   east: 15.4922941,
    //   north: 15.8084648,
    //   south: 15.817995,
    //   west: -5.927006881516333,
    // ),
  //);
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: Text(
          "Carte",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      /*
      body: OSMFlutter(
        controller: controller,
        trackMyPosition: true,
        initZoom: 12,
        minZoomLevel: 8,
        maxZoomLevel: 14,
        stepZoom: 1.0,
        onLocationChanged: (g) {
          print("position: $g");
          setState(() {
            pos.value['lat'] = g.latitude;
            pos.value['lon'] = g.longitude;
          });
        },
        staticPoints: [
          StaticPositionGeoPoint(
            "position",
            MarkerIcon(
              iconWidget: Icon(
                Icons.home,
                color: Colors.green,
                size: 200,
              ),
            ),
            [
              GeoPoint(
                latitude: pos.value['lat'], //-4.34367258730203,
                longitude: pos.value['lon'], //15.339215138650047,
              ),
            ],
          ),
        ],
        userLocationMarker: UserLocationMaker(
          personMarker: MarkerIcon(
            icon: Icon(
              Icons.location_history_rounded,
              color: Colors.red,
              size: 48,
            ),
          ),
          directionArrowMarker: MarkerIcon(
            icon: Icon(
              Icons.double_arrow,
              size: 48,
            ),
          ),
        ),
        roadConfiguration: RoadConfiguration(
          startIcon: MarkerIcon(
            icon: Icon(
              Icons.person,
              size: 64,
              color: Colors.brown,
            ),
          ),
          roadColor: Colors.yellowAccent,
        ),
        markerOption: MarkerOption(
          defaultMarker: MarkerIcon(
            icon: Icon(
              Icons.person_pin_circle,
              color: Colors.blue,
              size: 56,
            ),
          ),
        ),
      ),
      */
    );
  }

  @override
  void dispose() {
    //
    //controller.dispose();
    //
    super.dispose();
  }
}
