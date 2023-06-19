import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/Conversa.dart';

class Conversas extends StatefulWidget {
  const Conversas({Key? key}) : super(key: key);

  @override
  State<Conversas> createState() => _ConversasState();
}

class _ConversasState extends State<Conversas> {
  List<Conversa> _conversas = [
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
          itemCount: _conversas.length,
          itemBuilder: (context, index) {
            var _lista = _conversas[index];
            return ListTile(
              contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              leading: CircleAvatar(
                maxRadius: 30, // tamanho da imagem
                backgroundImage: NetworkImage(_lista.foto),
              ),
              title: Text(_lista.nome,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              subtitle: Text(_lista.mensagem,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  )),
            );
          }),
    );
  }
}

// class ListaMensagens extends StatelessWidget {
//   const ListaMensagens({
//     super.key,
//     required List<Conversa> conversas,
//   }) : _conversas = conversas;
//
//   final List<Conversa> _conversas;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                     image: AssetImage(
//                       _conversas[index].foto,
//                     ),
//                     fit: BoxFit.cover)),
//             height: 60,
//             width: 60,
//           ),
//           const SizedBox(width: 20),
//           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text(_conversas[index].nome,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 )),
//             const SizedBox(height: 3),
//             Text(_conversas[index].mensagem,
//                 style: TextStyle(fontSize: 14, color: Colors.cyan))
//           ])
//         ],
//       ),
//     );
//   }
// }
