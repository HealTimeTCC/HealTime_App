import 'package:flutter/material.dart';

import '../telas_apresentacao/apresentacao.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    NavigatorSettings();
  }

  void NavigatorSettings() async {
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
      child: Center(
        child: Image.asset('assets/img/splash.jpeg'),
      ),
    );
  }
}
