import 'package:flutter/material.dart';

class AcercadePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de'),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Image.asset(
                'images/logo.png',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20),
              Text(
                'App de Denuncias y Asistencias Ciudadanas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Cambia el color del texto
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Esta aplicación se dedica a brindar a la comunidad la capacidad de realizar denuncias y solicitar asistencia de manera rápida y sencilla. Nuestro objetivo es promover la seguridad y el bienestar en la comunidad, facilitando la comunicación con las autoridades y los servicios de emergencia.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Cambia el color del texto
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              Text(
                'Contáctanos:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Cambia el color del texto
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Email: contacto@appdenunciasyasistencia.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Cambia el color del texto
                ),
              ),
              Text(
                'Teléfono: +1 (123) 456-7890',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Cambia el color del texto
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
