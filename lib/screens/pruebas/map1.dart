// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class MapWithLines extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mapa con Línea entre Puntos'),
//       ),
//       body: FlutterMap(
//         options: MapOptions(
//           center: LatLng(40.7128, -74.0060),
//           zoom: 12.0,
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: ['a', 'b', 'c'],
//           ),
//           MarkerLayer(
//             markers: [
//               Marker(
//                 point: LatLng(40.7128, -74.0060),
//                 builder: (ctx) => Icon(Icons.pin_drop, color: Colors.red),
//               ),
//               Marker(
//                 point: LatLng(40.730610, -73.935242),
//                 builder: (ctx) => Icon(Icons.pin_drop, color: Colors.blue),
//               ),
//             ],
//           ),
//           PolylineLayer(
//             polylines: [
//               Polyline(
//                 points: [
//                   LatLng(40.7128, -74.0060),
//                   LatLng(40.730610, -73.935242),
//                 ],
//                 strokeWidth: 4.0,
//                 color: Colors.green,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
