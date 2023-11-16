import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Página de Policía',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Cambié el color a azul
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PoliciaPage(), // Cambié el nombre de la clase
    );
  }
}

class PoliciaPage extends StatelessWidget { // Cambié el nombre de la clase
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Policía'), // Cambié el título
        backgroundColor: Colors.blue, // Cambié el color a azul
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '¡Bienvenido a la Página de Policía!', // Cambié el mensaje
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
                  'images/policia.jpg', // Cambié la imagen a una de policía
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Agrega la lógica para mostrar información de policía
                // Puedes navegar a otra pantalla o mostrar un diálogo aquí
              },
              child: Text('Ver información de Policía'), // Cambié el texto del botón
            ),
          ],
        ),
      ),
    );
  }
}
