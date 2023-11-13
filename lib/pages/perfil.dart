import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                CircleAvatar(
                  backgroundImage: AssetImage('images/usuario.png'),
                  radius: 80, 
                ),
                SizedBox(height: 20),
                Text(
                  'Nombre Completo:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, 
                  ),
                ),
                Text(
                  'SAVER APP', // Reemplaza con el nombre del usuario
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black, 
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Dirección:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, 
                  ),
                ),
                Text(
                  'Zacatecoluca, La Paz', 
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black, 
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Correo:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, 
                  ),
                ),
                Text(
                  'denunciasciudadanas503@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black, 
                  ),
                ),
                SizedBox(height: 20),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
