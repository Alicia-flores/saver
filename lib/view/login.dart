import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:saver/View/signup.dart';
import 'package:saver/user_auth/firebase_auth_services.dart';
import 'package:saver/widget/input_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? mensaje;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => print('Has presionado el icono menú'));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/logo.png",
                  height: 180,
                  width: 180,
                ),
                const SizedBox(
                  height: 30,
                ),
                _InputCustomized(
                    _emailController,
                    false,
                    'Correo electrónico',
                    'E-mail',
                    TextInputType.emailAddress,
                    Icons.email_sharp),
                const SizedBox(
                  height: 30,
                ),
                InputWidget(
                  controller: _passwordController,
                  hintText: 'Contraseña',
                  isPasswordField: true,
                ),