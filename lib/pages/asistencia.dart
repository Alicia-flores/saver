import 'package:flutter/material.dart';
import 'package:saver/pages/bomberos.dart';
import 'package:saver/pages/cruzroja.dart';
//import 'package:saver/pages/bomberos.dart';
//import 'package:saver/pages/cruzroja.dart';
//import 'package:saver/pages/police.dart';

class AsistenciasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asistencias'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
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
        if (route == 'cruzRoja') {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => CruzRojaPage()));
        } else if (route == 'cruzVerde') {
          // Navegar a la página de Cruz Verde
        } else if (route == 'bomberos') {
         Navigator.push(context, MaterialPageRoute(builder: (context) => BomberosPage()));
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
