import 'package:flutter/material.dart';

import '../telas_apresentacao/escolher_perfil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    navigatorSettings();
  }

  void navigatorSettings() async {
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Apresentacao(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff18CDCA),
      child: const Center(
        child: Image(
          image: AssetImage('assets/img/logoHealTime.png'),
        ),
      ),
    );
  }
}
