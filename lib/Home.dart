import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/Login.dart';
import 'package:whatsapp/telas/aba_contatos.dart';
import 'package:whatsapp/telas/aba_conversas.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> itemsMenu = ["Configurações", "Deslogar"];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    _deslogarUsuario() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      var auth = FirebaseAuth.instance;
      auth.signOut();
      Navigator.pushReplacementNamed(context, "/login");
    }

    _escolhaMenuItem(String itemSelecionado) {
      switch (itemSelecionado) {
        case "Configurações":
          Navigator.pushNamed(context, "/configuracoes");
          break;
        case "Deslogar":
          _deslogarUsuario();
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Whatsapp"),
        bottom: TabBar(
          indicatorWeight: 4,
          indicatorColor: Colors.white,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          controller: _tabController,
          tabs: const [
            Tab(text: "Conversas"),
            Tab(text: "Contato"),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
              onSelected: _escolhaMenuItem,
              itemBuilder: (context) {
                return itemsMenu.map((String item) {
                  return PopupMenuItem(value: item, child: Text(item));
                }).toList();
              })
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Conversas(),
          Contato(),
        ],
      ),
    );
  }
}
