import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saver/pages/home.dart';

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
      home: const MyHomePage(title: 'Camara'),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
    );
  }
}
//este codigo es de la camara
class _MyHomePageState extends State<MyHomePage> {
  List<String> paths = [];
  XFile? currentImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            currentImage != null
                ? Image(image: FileImage(File(currentImage!.path)))
                : Icon(Icons.camera_alt, size: 100.0, color: Colors.grey),
            ElevatedButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.camera);

                if (image != null) {
                  setState(() {
                    paths.add(image.path);
                    currentImage = image;
                  });
                }
              },
              child: const Text('Tomar foto'),
            ),
            currentImage != null
                ? ElevatedButton(
                    onPressed: () {
                      // Aquí puedes agregar la lógica para enviar la foto
                      // Puedes mostrar un cuadro de diálogo, navegar a otra pantalla, etc.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Enviar foto'),
                            content: Text('Añade la lógica de envío aquí'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cerrar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Enviar'),
                  )
                : SizedBox(), // Si no hay imagen, se muestra un contenedor vacío
          ],
        ),
      ),
    );
  }
}