import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  String nombreUsuario = 'SAVER APP';
  String direccion = 'Zacatecoluca, La Paz';
  String correo = 'denunciasciudadanas503@gmail.com';
  File? imagenPerfil; 

  Future<void> _elegirImagen() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagenPerfil = File(pickedFile.path);
      });
    }
  }

  Future<void> _cambiarFotoPerfil() async {
    await _elegirImagen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _cambiarFotoPerfil();
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    backgroundImage: imagenPerfil != null
                        ? Image.file(imagenPerfil!).image
                        : AssetImage('images/usuario.png'),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _cambiarFotoPerfil();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, 
                  ),
                  child: Text(
                    'Cambiar Foto de Perfil',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 16),
                _buildCard('Nombre Completo', nombreUsuario, 'images/usuario.png'),
                SizedBox(height: 8),
                _buildCard('Dirección', direccion, 'images/hogar.png'),
                SizedBox(height: 8),
                _buildCard('Correo', correo, 'images/correo-electronico.png'),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String subtitle, String iconPath) {
    return Card(
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        leading: Image.asset(iconPath, width: 24, height: 24),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PerfilPage(),
  ));
}
