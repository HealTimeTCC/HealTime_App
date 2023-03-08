import 'package:flutter/material.dart';
import 'package:healtime/shared/background/background_page.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key, required this.typeUser}) : super(key: key);

  final int typeUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundPage()
      ],
    );
  }
}
