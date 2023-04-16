import 'package:flutter/material.dart';
import 'package:healtime/services/provider/queries/provider_navbar.dart';
import 'package:provider/provider.dart';

import '../screens_queries/logics/logic_type_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    /*
      Aqui você coloca para iniciar os valores do usuário
      Provider.of<NavbarProvider>(context).<Metodo que vai inicializar>();
    */
  }

  @override
  Widget build(BuildContext context) {
    final mp = Provider.of<NavbarProvider>(context);

    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(255, 20, 216, 213),
        ),
        child: BottomNavigationBar(
          currentIndex: mp.indexSelecionado,
          onTap: (opcao) {
            mp.indexSelecionado = opcao;
          },
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(0, 24, 205, 202),
          unselectedItemColor: Color(0xffFBF8F8),
          fixedColor: Color(0xffFBF8F8),
          items: mp.items
              .map((e) => BottomNavigationBarItem(
                  icon: Icon(e.iconData), label: e.label))
              .toList(),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff18CDCA),
      ),
      drawer: Drawer(
        child: ElevatedButton(
          onPressed: () => TypeUser.typeUserNavigator(context),
          child: Text('Ir para a tela de consulta'),
        ),
      ),
      body: mp.indexSelecionado == 0
          ? Container()
          : mp.items[mp.indexSelecionado].widget,
    );
  }
}

/*Align(
            alignment: Alignment.center,
            child: Container(
              child: ElevatedButton(
                  onPressed: () => TypeUser.typeUserNavigator(context),
                  child: Text('Ir para a tela de listar as consultas')),
            ),
          ),*/

/*const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.medication_rounded),
                label: 'Remedios',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.queue_play_next_rounded),
                label: 'Consulta',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ], */
