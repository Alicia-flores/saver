// Asegúrate de agregar estas dependencias en tu pubspec.yaml
// dependencies:
//   flutter:
//     sdk: flutter
//   camera: ^0.10.25
//   microphone: ^0.10.6

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:saver/pages/audio.dart';
//import 'package:microphone/microphone.dart';

// Importa la nueva página
//import 'audio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Página de Cruz Roja',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CruzRojaPage(),
    );
  }
}

class CruzRojaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cruz Roja'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '¡Bienvenido a la Página de Cruz Roja!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'images/cruzroja.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GrabacionDeAudioPage()),
                );
              },
              child: Text('Grabar Audio'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                      },
              child: Text('Grabar Video'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Lógica para tomar una foto
                // Implementa la funcionalidad necesaria
              },
              child: Text('Tomar Foto'),
            ),
          ],
        ),
      ),
    );
  }
}
