import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:saver/pages/bomberos.dart';
import 'package:saver/pages/cruzroja.dart';
import 'package:saver/pages/cruzverde.dart';
import 'package:saver/pages/proteccion.dart';

class AsistenciasPage extends StatefulWidget {
  @override
  _AsistenciasPageState createState() => _AsistenciasPageState();
}

class _AsistenciasPageState extends State<AsistenciasPage> {
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    _initializeCameras();
  }

  Future<void> _initializeCameras() async {
    try {
      // Obtén la lista de cámaras disponibles
      cameras = await availableCameras();
    } on CameraException catch (e) {
      print('Error al inicializar las cámaras: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asistencias'),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<void>(
        future: _initializeCameras(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: <Widget>[
                  _buildImageCard(
                    context,
                    'images/cruzroja.png',
                    'Cruz Roja Salvadoreña',
                    'cruzRoja',
                  ),
                  _buildImageCard(
                    context,
                    'images/cruzverde.png',
                    'Cruz Verde Salvadoreña',
                    'cruzVerde',
                  ),
                  _buildImageCard(
                    context,
                    'images/bomberos.jpg',
                    'Bomberos de El Salvador',
                    'bomberos',
                  ),
                  _buildImageCard(
                    context,
                    'images/proteccion.jpg',
                    'Protección Civil',
                    'proteccionCivil',
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildImageCard(
    BuildContext context,
    String imagePath,
    String title,
    String route,
  ) {
    return InkWell(
      onTap: () {
        if (route == 'cruzRoja' && cameras.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CruzRojaPage(camera: cameras.first)),
          );
        } else if (route == 'cruzVerde' && cameras.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CruzVerdePage(camera: cameras.first)),
          );
        } else if (route == 'bomberos' && cameras.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BomberosPage(camera: cameras.first)),
          );
        } else if (route == 'proteccionCivil' && cameras.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProteccionPage(camera: cameras.first)),
          );
        }
      },
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(imagePath, width: 80, height: 80),
              SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
