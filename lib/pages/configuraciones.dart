import 'package:flutter/material.dart';

class ConfiguracionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuraciones'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildConfiguracionItem(
              'Notificaciones',
              'Habilitar o deshabilitar notificaciones push',
              Switch(value: true, onChanged: (value) {}),
            ),
            _buildDivider(),
            _buildConfiguracionItem(
              'Idioma',
              'Cambiar el idioma de la aplicación',
              Icon(Icons.arrow_forward),
              onTap: () {
                // Agrega la lógica para cambiar el idioma
              },
            ),
            _buildDivider(),
            _buildConfiguracionItem(
              'Tema',
              'Seleccionar un tema de la aplicación',
              Icon(Icons.arrow_forward),
              onTap: () {
                // Agrega la lógica para cambiar el tema
              },
            ),
            _buildDivider(),
            _buildConfiguracionItem(
              'Privacidad',
              'Configurar quién puede ver tu información de perfil',
              Icon(Icons.arrow_forward),
              onTap: () {
                // Agrega la lógica para configurar la privacidad
              },
            ),
            _buildDivider(),
            // Agrega más opciones de configuración según tus necesidades
          ],
        ),
      ),
    );
  }

  Widget _buildConfiguracionItem(String title, String subtitle, Widget trailing,
      {VoidCallback? onTap}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          subtitle,
          style: TextStyle(fontSize: 14),
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[400],
      thickness: 1,
      height: 24,
    );
  }
}
