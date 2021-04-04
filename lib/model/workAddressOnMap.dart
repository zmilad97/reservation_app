// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class WorkAddress extends StatefulWidget {
//   @override
//   _WorkAddressState createState() => _WorkAddressState();
// }
//
// class _WorkAddressState extends State<WorkAddress> {
//   Map data = {};
//   GoogleMapController mapController;
//
//   //TODO : fix here
//   double x = 1;
//   double y = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: GoogleMap(
//         onMapCreated: onMapCreated,
//         initialCameraPosition: CameraPosition(target: LatLng(x, y), zoom: 100),
//       ),
//     );
//   }
//
//   void onMapCreated(GoogleMapController controller) {
//     setState(() {
//       mapController = controller;
//     });
//   }
// }
