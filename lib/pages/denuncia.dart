import 'package:flutter/material.dart';
import 'package:saver/pages/fiscalia.dart';
import 'package:saver/pages/fuerzaarmada.dart';
import 'package:saver/pages/policia.dart';
import 'package:camera/camera.dart';
import 'package:saver/pages/procuraduria.dart';


class DenunciasPage extends StatefulWidget {
  @override
  _DenunciasPageState createState() => _DenunciasPageState();
}

class _DenunciasPageState extends State<DenunciasPage> {
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
        title: Text('Denuncias'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          children: <Widget>[
            _buildImageCard(
              context,
              'images/policia.png',
              'Policía Nacional Civil',
              'police',
            ),
            _buildImageCard(
              context,
              'images/fuerza.jpg',
              'Fuerza Armada de El Salvador',
              'armada',
            ),
            _buildImageCard(
              context,
              'images/fiscalia.jpg',
              'Fiscalía General de la República',
              'fiscalia',
            ),
            _buildImageCard(
              context,
              'images/procuraduria.png',
              'Procuraduría General de El Salvador',
              'procuraduria',
            ),
            // Puedes agregar más imágenes y nombres de instituciones aquí
          ],
        ),
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
      onTap: ()  {
        if (route == 'police' && cameras.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => policePage(camera: cameras.first)),
          );
        } else if (route == 'armada' && cameras.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => armadaPage(camera: cameras.first)),
          );
        } else if (route == 'fiscalia' && cameras.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => fiscaliaPage(camera: cameras.first)),
          );
        } else if (route == 'procuraduria' && cameras.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => procuraduriaPage(camera: cameras.first)),
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

