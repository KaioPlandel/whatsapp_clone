import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Cadastro.dart';
import 'package:whatsapp/Configuracoes.dart';
import 'package:whatsapp/Home.dart';
import 'package:whatsapp/Login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Login());
      case "/login":
        return MaterialPageRoute(builder: (_) => Login());
      case "/cadastro":
        return MaterialPageRoute(builder: (_) => Cadastro());
      case "/home":
        return MaterialPageRoute(builder: (_) => Home());
      case "/configuracoes":
        return MaterialPageRoute(builder: (_) => Configuracoes());
      default:
        _errorRota();
        throw Exception("");
    }
  }

  static Route<dynamic> _errorRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Tela não encontrada")),
        body: Center(child: Text("Tela não encontrada"),),
      );
    });
  }
}
