import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Cadastro.dart';
import 'package:whatsapp/Home.dart';

import 'model/Usuario.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  _validarCampos() {
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;
    if (email.isEmpty || senha.isEmpty) {
      setState(() {
        //    _mensagem = "Preencha as informações corretas";
      });
    } else {
      setState(() {
        //  _mensagem = "";
      });

      Usuario usuario = Usuario();
      usuario.email = email;
      usuario.senha = senha;

      _logarUsuario(usuario);
    }
  }

  _logarUsuario(Usuario usuario) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    var auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(
      email: usuario.email,
      password: usuario.senha,
    )
        .then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    }).catchError((error) {
      print("Error ${error.toString()}");
    });
  }

  _verfificarUsuarioLogado() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    var auth = FirebaseAuth.instance.currentUser;

    if(auth != null){
      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
    }
  }

  @override
  void initState() {
    _verfificarUsuarioLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            //para quando o teclado abrir o menu subir
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child:
                      Image.asset("images/logo.png", width: 200, height: 150),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    autofocus: true,
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Email",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  style: TextStyle(fontSize: 20),
                  controller: _controllerSenha,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 10),
                  child: MaterialButton(
                    onPressed: () {
                      _validarCampos();
                    },
                    color: Colors.green,
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    child: const Text("Entrar",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/cadastro");
                    },
                    child: const Text("Não tem conta cadastre-se",
                        style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
