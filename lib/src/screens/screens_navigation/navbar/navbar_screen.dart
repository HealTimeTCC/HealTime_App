import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../services/provider/queries/provider_navbar.dart';
import '../screens_queries/logics/logic_type_user.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  @override
  Widget build(BuildContext context) {
    final mp = Provider.of<NavbarProvider>(context);

    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xFF14D8D5),
        ),
        child: BottomNavigationBar(
          currentIndex: mp.indexSelecionado,
          onTap: (opcao) {
            mp.indexSelecionado = opcao;
          },
          items: mp.items
              .map((e) => BottomNavigationBarItem(
                  icon: Icon(e.iconData), label: e.label))
              .toList(),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(0, 24, 205, 202),
          unselectedItemColor: Color(0xffFBF8F8),
          fixedColor: Color(0xffFBF8F8),
        ),
      ),
      body: mp.items[mp.indexSelecionado].widget,
    );
  }
}
