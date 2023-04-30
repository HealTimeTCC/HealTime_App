import 'package:flutter/material.dart';

import '../screens_medical/screen_doctor/screen_list_doctor.dart';
import '../screens_queries/logics/logic_type_user.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(140),
          child: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFF14D8D5),
          )),


      drawer: Drawer(
        child: ListView(
          children: [
          ListTile(
            title: Text('Cosultas'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => TypeUser.typeUserNavigator(context),
          ),
          ListTile(
            title: Text('Cosultas'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.of(context),
          ),
          ListTile(
            title: Text('Cosultas'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => TypeUser.typeUserNavigator(context),
          ),
      ]),
    ));
  }
}
