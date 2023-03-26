import 'package:flutter/material.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/logics/typeUser.dart';
import 'package:healtime/services/data_locale/data_preferences.dart';
import 'package:healtime/shared/consts/consts_key_preferences.dart';

import '../../splash/splash_screen.dart';
import '../screens_queries/screens/screen_list_queries.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff18CDCA),
          unselectedItemColor: Color(0xffFBF8F8),
          fixedColor: Color(0xffFBF8F8),
          items: const [
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
          ],
        ),
        appBar: AppBar(
          backgroundColor: Color(0xff18CDCA),
        ),
        drawer: Drawer(),
        body: Align(
          alignment: Alignment.center,
          child: Container(
            child: ElevatedButton(
                onPressed: () => TypeUser.typeUserNavigator(context),
                child: Text('Ir para a tela de listar as consultas')),
          ),
        ),
      ),
    );
  }
}
