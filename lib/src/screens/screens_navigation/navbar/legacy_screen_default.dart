import 'package:flutter/material.dart';

import '../../../../core/routes.dart';
import 'legacy_navbar_screen.dart';

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key});

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  @override
  Widget build(BuildContext context) {
    return const NavBarScreen();
     // routes: Routes.mapRoutes(),
    
  }
}
