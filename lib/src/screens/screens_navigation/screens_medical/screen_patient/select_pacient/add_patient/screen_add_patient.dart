import 'package:flutter/material.dart';

import '../../../../../../../shared/decorations/fonts_google.dart';
import '../../../../../../../shared/decorations/screen_background.dart';

class AddPatient extends StatelessWidget {
  const AddPatient({Key? key, required this.personId}) : super(key: key);

  final int personId;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .02),
              child: Column(
                children: [
                  SizedBox(height: size.height * .01),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Color(0xff1AE8E4),
                        ),
                      ),
                      SizedBox(width: size.width * .03),
                      Text(
                        'Cadastrar paciente',
                        style: FontGoogle.textTitleGoogle(size: size * .8),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .04),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
