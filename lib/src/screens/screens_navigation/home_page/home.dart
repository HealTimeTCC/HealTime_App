import 'package:flutter/material.dart';
import 'package:healtime/services/data_locale/data_preferences.dart';
import 'package:healtime/shared/consts/consts_key_preferences.dart';

import '../../splash/splash_screen.dart';

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
              icon: Icon(Icons.medical_services_outlined),
              label: 'Medic',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
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
        drawer: Drawer(
          child: ElevatedButton(onPressed: () {
            DataPreferences.removeData(key: ConstsPreferences.keyUser);

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
          }, child: Text('Sair')),
        ),
        body: Container(),

      ),
    );
  }
}
