import 'package:flutter/material.dart';

class ConfiguracionesPage extends StatefulWidget {
  @override
  _ConfiguracionesPageState createState() => _ConfiguracionesPageState();
}

class _ConfiguracionesPageState extends State<ConfiguracionesPage> {
  bool _notificacionesActivadas = true;
  String _privacidadSeleccionada = 'Nadie';

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
              Switch(
                value: _notificacionesActivadas,
                onChanged: (value) {
                  setState(() {
                    _notificacionesActivadas = value;
                    _mostrarAlertaNotificaciones(value);
                  });
                },
              ),
            ),
            _buildDivider(),
            _buildConfiguracionItem(
              'Idioma',
              'Cambiar el idioma de la aplicación',
              Image.asset(
                'images/idiomas.png',
                width: 40,
                height: 40,
              ),
              onTap: () {
                _mostrarMenuIdiomas(context);
              },
            ),
            _buildDivider(),
            _buildConfiguracionItem(
              'Tema',
              'Seleccionar un tema de la aplicación',
              Icon(Icons.arrow_forward),
              onTap: () {
                // Lógica para cambiar el tema
              },
            ),
            _buildDivider(),
            _buildConfiguracionItem(
              'Privacidad',
              'Configurar quién puede ver tu información de perfil',
               Image.asset(
                'images/politica-de-privacidad.png',
                width: 40,
                height: 40,
              ),
              onTap: () {
                _mostrarOpcionesPrivacidad(context);
              },
            ),
            _buildDivider(),
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

  void _mostrarOpcionesPrivacidad(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Opciones de Privacidad'),
          content: Column(
            children: <Widget>[
              ListTile(
                title: Text('Nadie'),
                onTap: () {
                  setState(() {
                    _privacidadSeleccionada = 'Nadie';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Solo yo'),
                onTap: () {
                  setState(() {
                    _privacidadSeleccionada = 'Solo yo';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Compartir información personal'),
                onTap: () {
                  setState(() {
                    _privacidadSeleccionada = 'Compartir información personal';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _mostrarAlertaNotificaciones(bool activadas) {
    String mensaje =
        activadas ? 'Has activado las notificaciones' : 'Has desactivado las notificaciones';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notificaciones'),
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarMenuIdiomas(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seleccionar Idioma'),
          content: Column(
            children: <Widget>[
              ListTile(
                title: Text('Español'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Inglés'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
