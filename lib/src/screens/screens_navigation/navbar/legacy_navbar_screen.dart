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
    final providerNavbar = Provider.of<NavbarProvider>(context);

    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFF14D8D5),
        ),
        child: BottomNavigationBar(
          currentIndex: providerNavbar.indexSelecionado,
          onTap: (opcao) {
            providerNavbar.indexSelecionado = opcao;
          },
          items: providerNavbar.items.map((e) => BottomNavigationBarItem(
                  icon: Icon(e.iconData), label: e.label))
              .toList(),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor:  const Color.fromARGB(0, 24, 205, 202),
          unselectedItemColor: const Color(0xffFBF8F8),
          fixedColor: const Color(0xffFBF8F8),
        ),
      ),
      body: providerNavbar.items[providerNavbar.indexSelecionado].widget,
    );
  }
}
