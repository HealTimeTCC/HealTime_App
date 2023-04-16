import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/decorations/fonts_google.dart';
import '../../../src/screen_internal_server/screen_internal_server.dart';

class ProviderLogin extends ChangeNotifier {
  int _navigatorScreenServer = 0;

  int get navigatorScreenServer => _navigatorScreenServer;

  String? _addressServer;

  String? get addressServer => _addressServer;

  void incrementScreen(BuildContext context) {
    _navigatorScreenServer++;

    if (_navigatorScreenServer == 5) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ScreenInternalServer()),
          (route) => false);
    }
  }

  void decrementScreen() {
    _navigatorScreenServer = 0;
    notifyListeners();
  }

  void addAddressServer(BuildContext context, String address) {
    final Size size = MediaQuery.of(context).size;
    _addressServer = address;

    Navigator.of(context).pop();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        elevation: 0,
        backgroundColor: const Color(0xff1c1c1c),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: Colors.white),
        ),
        content: Text(
          'Servidor configurado com sucesso!',
          style: FontGoogle.textSubTitleGoogle(
              size: size * .9, colorText: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context)
                .pushNamedAndRemoveUntil('/SplashScreen', (route) => false),
            style: TextButton.styleFrom(foregroundColor: Colors.transparent),
            child: Text(
              'Ok',
              style: FontGoogle.textSubTitleGoogle(
                  size: size * .9, colorText: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
