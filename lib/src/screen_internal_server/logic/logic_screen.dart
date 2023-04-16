import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/provider/login/provider_login.dart';
import '../../../shared/decorations/fonts_google.dart';

class LogicAddressServer {
  static void postAddress(BuildContext context, String address) async {
    final Size size = MediaQuery.of(context).size;
    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

    ScaffoldMessenger.of(context).clearSnackBars();
    if (address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 4),
          elevation: 0,
          backgroundColor: Colors.redAccent,
          content: Text('Por favor, coloque um endereço para o servidor'),
        ),
      );
      return;
    }

    if (address.substring(address.length - 1) != '/') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 4),
          elevation: 0,
          backgroundColor: Colors.redAccent,
          content: Text('Por favor, coloque a  \'/\' no final do endereço.'),
        ),
      );

      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 0,
        backgroundColor: const Color(0xff1c1c1c),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: Colors.white),
        ),
        title: Text(
          'Confirmar alteração',
          style: FontGoogle.textSubTitleGoogle(
              size: size * .9, colorText: Colors.white),
        ),
        content: Text(
          'O endereço \'${address.trim()}\' está correto?',
          textAlign: TextAlign.center,
          style: FontGoogle.textSubTitleGoogle(
              size: size * .9, colorText: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(foregroundColor: Colors.transparent),
            child: Text(
              'Cancelar',
              style: FontGoogle.textSubTitleGoogle(
                  size: size * .9, colorText: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              providerLogin.decrementScreen();
              providerLogin.addAddressServer(context, address.trim());
            },
            style: TextButton.styleFrom(foregroundColor: Colors.transparent),
            child: Text(
              'Confirmar',
              style: FontGoogle.textSubTitleGoogle(
                  size: size * .9, colorText: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
