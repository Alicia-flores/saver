import 'package:flutter/material.dart';
import 'package:saver/pages/policia.dart';
import 'package:camera/camera.dart';


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
        if (route == 'Policia' && cameras.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PoliciaPage(camera: cameras.first)),
          );
        } /*else if (route == 'cruzVerde' && cameras.isNotEmpty) {
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
        }*/
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

