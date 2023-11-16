import 'package:flutter/material.dart';
import 'package:saver/pages/policia.dart';


class DenunciasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Denuncias'),
        backgroundColor: Colors.lightBlue,
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
      onTap: () {
        if (route == 'policia') {
         Navigator.push(context, MaterialPageRoute(builder: (context) => PoliciaPage()));
        } else if (route == 'cruzverde') {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => CruzVerdePage()));
        } else if (route == 'bomberos') {
         //Navigator.push(context, MaterialPageRoute(builder: (context) => BomberosPage()));
        } else if (route == 'proteccionCivil') {
          // Navegar a la página de Protección Civil
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

