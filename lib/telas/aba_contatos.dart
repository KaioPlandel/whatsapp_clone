import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/Conversa.dart';

class Contato extends StatefulWidget {
  const Contato({Key? key}) : super(key: key);

  @override
  State<Contato> createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {
  List<Conversa> _contatos = [
    Conversa("JonSon", "How are you ?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-beae0.appspot.com/o/perfil2.jpg?alt=media&token=03250869-b7d0-4414-88ea-dc450329c773"),
    Conversa("João Paulo", "How are you ?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-beae0.appspot.com/o/perfil2.jpg?alt=media&token=03250869-b7d0-4414-88ea-dc450329c773"),
    Conversa("Gustavo", "How are you ?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-beae0.appspot.com/o/perfil2.jpg?alt=media&token=03250869-b7d0-4414-88ea-dc450329c773"),
    Conversa("Figueredo", "How are you ?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-beae0.appspot.com/o/perfil2.jpg?alt=media&token=03250869-b7d0-4414-88ea-dc450329c773"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: _contatos.length,
          itemBuilder: (context, index) {
            var _lista = _contatos[index];
            return ListTile(
              contentPadding: EdgeInsets.fromLTRB(18, 6, 18, 6),
              leading: CircleAvatar(
                maxRadius: 30,
                backgroundImage: NetworkImage(_lista.foto),
              ),
              title: Text(_lista.nome),
            );
          }),
    );
  }
}
