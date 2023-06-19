import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Home.dart';
import 'package:whatsapp/model/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  var _mensagem = "";

  _validarCampos() {
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;
    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
      setState(() {
        _mensagem = "Preencha as informações corretas";
      });
    } else {
      setState(() {
        _mensagem = "";
      });
      Usuario usuario = Usuario();
      usuario.nome = nome;
      usuario.email = email;
      usuario.senha = senha;

      _cadastrarUsuario(usuario);
    }
  }

  _cadastrarUsuario(Usuario usuario) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    var auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((value) {
      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
      FirebaseFirestore db = FirebaseFirestore.instance;
      db.collection("usuarios")
      .doc(value.user?.uid)
      .set(usuario.toMap());
      setState(() {
        _mensagem = "Sucesso ao cadastrar";
        _controllerSenha.text = "";
        _controllerNome.text = "";
        _controllerEmail.text = "";
      });
    }).catchError((error) {
      _mensagem = "Error ao cadastrar usuario";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff075E54),
        title: Text("Cadastrar"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("images/usuario.png"),
                SizedBox(height: 10),
                TextField(
                  autofocus: true,
                  controller: _controllerNome,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Nome"),
                ),
                SizedBox(height: 12),
                TextField(
                  autofocus: false,
                  controller: _controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Email"),
                ),
                SizedBox(height: 12),
                TextField(
                  autofocus: false,
                  controller: _controllerSenha,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Senha"),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15, left: 15, top: 12),
                  child: MaterialButton(
                      onPressed: () {
                        _validarCampos();
                      },
                      color: Colors.green,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      child: const Center(
                          child: Text("Cadastrar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20)))),
                ),
                Center(child: Text(_mensagem))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
