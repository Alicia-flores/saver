
import 'package:flutter/material.dart';
import 'foto.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camara',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        colorScheme: ColorScheme.dark(),
      ),
      home: const FotoPage(title: 'Camara'),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
    );
  }
}