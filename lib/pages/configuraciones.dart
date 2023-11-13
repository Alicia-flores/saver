import 'package:flutter/material.dart';

class ConfiguracionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuraciones'),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text('Notificaciones'),
                subtitle: Text('Habilitar o deshabilitar notificaciones push'),
                trailing: Switch(value: true, onChanged: (value) {}),
              ),
              Divider(),
              ListTile(
                title: Text('Idioma'),
                subtitle: Text('Cambiar el idioma de la aplicación'),
                onTap: () {
                  // Agrega la lógica para cambiar el idioma
                },
              ),
              Divider(),
              ListTile(
                title: Text('Tema'),
                subtitle: Text('Seleccionar un tema de la aplicación'),
                onTap: () {
                  // Agrega la lógica para cambiar el tema
                },
              ),
              Divider(),
              ListTile(
                title: Text('Privacidad'),
                subtitle: Text('Configurar quién puede ver tu información de perfil'),
                onTap: () {
                  // Agrega la lógica para configurar la privacidad
                },
              ),
              Divider(),
              // Agrega más opciones de configuración según tus necesidades
            ],
          ),
        ),
      ),
    );
  }
}
