import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';


class Configuracoes extends StatefulWidget {
  const Configuracoes({Key? key}) : super(key: key);

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  final TextEditingController _nameController =
      TextEditingController(text: "Kaio Plandel");

  File? _imagem;


  Future _recuperarImage(String imagem) async {
    File? imagemSelecionada;

    switch(imagem) {
      case "camera":
        imagemSelecionada = (await ImagePicker().pickImage(source: ImageSource.camera)) as File;
        break;
      case "galeria":
        imagemSelecionada = (await ImagePicker().pickImage(source: ImageSource.gallery)) as File;
        break;
    }

    setState(() {
      _imagem = imagemSelecionada!;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/whatsapp-beae0.appspot.com/o/perfil2.jpg?alt=media&token=03250869-b7d0-4414-88ea-dc450329c773"),
                  backgroundColor: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _recuperarImage("camera");
                      },
                      child: Text("Camera"),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _recuperarImage("galeria");
                      },
                      child: Text("Galeria"),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 6, 18, 6),
                        filled: true,
                        hintText: "Nome",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                  ),
                ),
                SizedBox(height: 20,),
                MaterialButton(
                  color: Colors.green,
                  padding: EdgeInsets.all(15),
                  elevation: 7,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                    child: Text("Salvar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
