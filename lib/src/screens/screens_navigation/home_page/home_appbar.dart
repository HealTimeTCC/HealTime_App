import 'package:flutter/material.dart';

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
        child: ElevatedButton(
          onPressed: () => TypeUser.typeUserNavigator(context),
          child: Text('Ir para a tela de consulta'),
        ),
      ),
    );
  }
}
