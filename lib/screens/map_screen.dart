import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class MapScreen extends StatefulWidget {
  final String title;
  const MapScreen({super.key, required this.title});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> googleMapController = Completer();
  final List<LatLng> posiciones = [];
  final Set<Polyline> polylines = {};
  final Set<Marker> markers = {};
  final CameraPosition initialCameraPosition = const CameraPosition(
    zoom: 16,
    target: LatLng(-12.1973, -76.9702),
  );

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    posiciones.addAll([
      const LatLng(-12.1973, -76.9702),
      const LatLng(-12.1977, -76.9678),
      const LatLng(-12.1967, -76.9678),
      const LatLng(-12.1957, -76.9678),
      const LatLng(-12.1947, -76.9678),
      const LatLng(-12.1937, -76.9678),
      const LatLng(-12.1927, -76.9678),
    ]);
    setMarkers();
    setPolylines();
  }

  void setMarkers() {
    for (var posicion in posiciones) {
      markers.add(
        Marker(
          markerId: MarkerId(posicion.toString()),
          position: posicion,
          infoWindow: InfoWindow(
            title: DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.now()),
          ),
        ),
      );
    }
  }

  void setPolylines() {
    polylines.add(
      Polyline(
        polylineId: const PolylineId('id'),
        points: posiciones,
        width: 4,
        color: Colors.purple,
      ),
    );
  }

  void addMarker(LatLng nuevaPosicion) {
    LatLng ultimaPosicion = markers.last.position;
    markers.add(
      Marker(
        markerId: MarkerId(nuevaPosicion.toString()),
        position: nuevaPosicion,
        infoWindow: InfoWindow(
          title: DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.now()),
        ),
      ),
    );
    polylines.add(
      Polyline(
        polylineId: PolylineId(nuevaPosicion.toString()),
        points: [ultimaPosicion, nuevaPosicion],
        width: 4,
        color: Colors.green,
        patterns: [
          PatternItem.dot,
          PatternItem.gap(10),
        ],
      ),
    );
    moverCamera(nuevaPosicion);
    setState(() {});
  }

  Future<void> moverCamera(LatLng posicion) async {
    final controller = await googleMapController.future;
    controller.animateCamera(CameraUpdate.newLatLng(posicion));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: GoogleMap(
          markers: markers,
          polylines: polylines,
          mapType: MapType.normal,
          initialCameraPosition: initialCameraPosition,
          onMapCreated: (GoogleMapController controller) {
            googleMapController.complete(controller);
          },
          onTap: (LatLng posicion) {
            addMarker(posicion);
          },
        ),
      ),
    );
  }
}