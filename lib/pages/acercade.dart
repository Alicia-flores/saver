import 'package:flutter/material.dart';

class AcercadePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2.0),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset(
                  'images/logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'App de Denuncias y Asistencias Ciudadanas',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Esta aplicación se dedica a brindar a la comunidad la capacidad de realizar denuncias y solicitar asistencia de manera rápida y sencilla. Nuestro objetivo es promover la seguridad y el bienestar en la comunidad, facilitando la comunicación con las autoridades y los servicios de emergencia.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  buildContactCard('Gmail','appdenunciasyasistencia@gmail.com', 'images/gmail.png'),
                  buildContactCard('Teléfono','+1 (123) 456-7890 456-7890 456-789', 'images/llamada-telefonica.png'),
                  buildContactCard('Página Web','www.appdenunciasyasistencias.com', 'images/sitio-web.png'),
                  buildContactCard('Facebook', 'www.facebook.com/appdenunciasv', 'images/facebook.png'),
                  buildContactCard('Instagram', 'www.instagram.com/appdenuncias', 'images/instagram.png'),
                  buildContactCard('YouTube', 'www.youtube.com/appdenunciasv', 'images/youtube.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContactCard(String title, String content, String iconPath) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(iconPath, width: 24, height: 24),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
