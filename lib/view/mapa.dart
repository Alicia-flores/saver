import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();

    // Solicitar los permisos de ubicación al usuario
    Geolocator().requestPermission().then((isGranted) {
      if (isGranted) {
        // Obtener la ubicación actual del dispositivo
        Geolocator().getCurrentPosition().then((location) {
          setState(() {
            _initMap(location);
          });
        });
      }
    });
  }

  void _initMap(Position position) {
    // Crear un mapa con el centro en la ubicación actual del dispositivo
    MapOptions mapOptions = MapOptions(
      center: LatLng(position.latitude, position.longitude),
      zoom: 15,
    );

    // Crear un controlador para el mapa
    mapController = GoogleMapController(
      options: mapOptions,
    );

    // Crear un marcador en el mapa con la ubicación actual del dispositivo
    Marker marker = Marker(
      position: position,
      // Establecer la marca del marcador
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    );

    // Agregar el marcador al mapa
    mapController.addMarker(marker);

    // Iniciar un flujo para obtener actualizaciones continuas de la ubicación del dispositivo
    Geolocator().getPositionStream().listen((location) {
      // Actualizar el marcador en el mapa
      marker.position = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ubicación'),
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          },
        ),
      ),
    );
  }
}