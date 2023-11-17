import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:saver/pages/audio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  MyApp({required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PoliciaPage(camera: camera),
    );
  }
}

class PoliciaPage extends StatefulWidget {
  final CameraDescription camera;

 PoliciaPage({required this.camera});

  @override
  _PoliciaPageState createState() => _PoliciaPageState();
}

class _PoliciaPageState extends State<PoliciaPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  XFile? _takenPhoto;

  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePhoto(BuildContext context) async {
    try {
      final imagePicker = ImagePicker();
      final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          _takenPhoto = pickedFile;
        });
      }
    } catch (e) {
      print('Error al tomar la foto: $e');
    }
  }

  Future<void> _uploadPhotoToFirebase() async {
    if (_takenPhoto == null) {
      print('No se ha tomado ninguna foto.');
      return;
    }

    setState(() {
      _isUploading = true;
    });

    try {
      final firebaseStorage = FirebaseStorage.instance;
      final ref = firebaseStorage.ref().child('fotos/${DateTime.now().toIso8601String()}.jpg');
      await ref.putFile(File(_takenPhoto!.path));

      print('Foto subida exitosamente a Firebase.');

      // Limpiar la vista previa después de subir la foto
      setState(() {
        _takenPhoto = null;
        _isUploading = false;
      });
    } catch (e) {
      print('Error al subir la foto a Firebase: $e');

      // Manejar el error si la carga falla
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Policia'),
        backgroundColor: Color.fromARGB(255, 26, 3, 156),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '¡Bienvenido a la Página de la Policia!',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
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
                    child: _takenPhoto != null
                        ? Image.file(File(_takenPhoto!.path), fit: BoxFit.cover)
                        : CameraPreview(_controller),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildColorButton(Colors.red, 'Rojo', () {
                      // Lógica para el botón Rojo
                    }),
                    _buildColorButton(Colors.green, 'Verde', () {
                      // Lógica para el botón Verde
                    }),
                    _buildColorButton(Colors.blue, 'Azul', () {
                      // Lógica para el botón Azul
                    }),
                    _buildColorButton(Colors.orange, 'Naranja', () {
                      // Lógica para el botón Naranja
                    }),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _takePhoto(context);
                  },
                  child: Text('Tomar Foto'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _recordVideo(context);
                  },
                  child: Text('Grabar Video'),
                ),
                SizedBox(height: 10),
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
                  onPressed: _isUploading ? null : () => _uploadPhotoToFirebase(),
                  child: _isUploading ? CircularProgressIndicator() : Text('Enviar a Firebase'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorButton(Color color, String label, Function() onPressed) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        primary: color,
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(label),
    );
  }

  Future<void> _recordVideo(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(camera: widget.camera),
      ),
    );

    if (result != null) {
      // Aquí puedes manejar el resultado del video grabado
      print('Video grabado en: $result');
    }
  }
}

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cámara')),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final path = await _controller.takePicture();
            Navigator.pop(context, path.path);
          } catch (e) {
            print('Error al tomar la foto: $e');
          }
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
