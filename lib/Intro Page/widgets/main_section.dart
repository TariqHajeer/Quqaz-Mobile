import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'contact_us.dart';

class Main extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.2033018, 44.0371523),
    zoom: 14.4746,
  );

  Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.5,
                  height: Get.height * 0.2,
                  child: Image.asset("images/quqaz.jpeg"),
                ),
                SizedBox(height: 20),
                Container(
                  width: Get.width,
                  height: Get.height * 0.4,
                  child: GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: {
                      Marker(
                        markerId: MarkerId('dist'),
                        infoWindow:
                            const InfoWindow(title: 'القوقز للتوصيل السريع'),
                        position: LatLng(36.2033018, 44.0371523),
                      ),
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: Get.width,
                  child: ContactUs(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
