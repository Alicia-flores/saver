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
                 const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: _signIn,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "¿No tienes una cuenta?",
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Signup()),
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "Registrarme",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  mensaje ?? "",
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    if (user != null) {
      print("Login Satisfactorio!!!");
      Navigator.pushReplacementNamed(context, "/home");

      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: '¡Inicio de sesión exitoso!',
      );
      setState(() {
        mensaje = "";
      });
    } else {
      setState(() {
        mensaje = "No se encontró el usuario especificado";
      });
    }
  }

  Widget _InputCustomized(
    TextEditingController? controller,
    bool? isPassword,
    String? hintText,
    String? labelText,
    TextInputType? inputType,
    IconData? icon,
  ) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(.4),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        controller: controller,
        keyboardType: inputType,
        obscureText: isPassword == true ? true : false,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          suffixIcon: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}