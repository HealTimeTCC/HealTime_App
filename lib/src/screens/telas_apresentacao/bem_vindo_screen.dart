import 'package:flutter/material.dart';

import '../../../shared/background/background_page.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundPage(),
      ],
    );
  }
}
