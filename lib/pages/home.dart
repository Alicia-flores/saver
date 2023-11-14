import 'package:flutter/material.dart';
import 'package:saver/pages/acercade.dart';
import 'package:saver/pages/configuraciones.dart';
import 'package:saver/pages/mapa.dart';
import 'package:saver/pages/perfil.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _signOut(BuildContext context) {

    // FirebaseAuth.instance.signOut();
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Saver App"),
              accountEmail: Text("www.somossaverapp.org.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/logo.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              leading: Image.asset(
                'images/maps.png',
                width: 40,
                height: 40,
              ),
              title: Text(
                'Mapa',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                 context,
                  MaterialPageRoute(builder: (context) => Mapa()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                'images/denuncias.png',
                width: 40,
                height: 40,
              ),
              title: Text(
                'Denuncias',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                //Navigator.push(
                //  context,
                //  MaterialPageRoute(builder: (context) => DenunciasPage()),
                //);
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                'images/asistencia.png',
                width: 40,
                height: 40,
              ),
              title: Text(
                'Asistencia',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
              //Navigator.push(
                 // context,
                 // MaterialPageRoute(builder: (context) => AsistenciasPage()),
                //);
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                'images/configuraciones.png',
                width: 40,
                height: 40,
              ),
              title: Text(
                'Configuraciones',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfiguracionesPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                'images/perfil.png',
                width: 40,
                height: 40,
              ),
              title: Text(
                'Perfil',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset(
                'images/acerca.png',
                width: 40,
                height: 40,
              ),
              title: Text(
                'Acerca de',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AcercadePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                'Bienvenido',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Text(
                'App de Denuncias y Asistencias Ciudadanas',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildIconButton('images/policia.png', 'Policía Nacional Civil'),
                  _buildIconButton('images/cruzroja.png', 'Cruz Roja Salvadoreña'),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildIconButton('images/bomberos.jpg', 'Bomberos de El Salvador'),
                  _buildIconButton('images/proteccion.jpg', 'Protección Civil'),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildIconButton('images/fiscalia.jpg', 'Fiscalía General de El Salvador'),
                  _buildIconButton('images/procuraduria.png', 'Procuraduría General de El Salvador'),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildIconButton('images/fuerza.jpg', 'Fuerza Armada Salvadoreña'),
                  _buildIconButton('images/cruzverde.png', 'Cruz Verde Salvadoreña'),
                ],
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(String imageAsset, String label) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(imageAsset, width: 60, height: 60),
            ),
          ),
          SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
