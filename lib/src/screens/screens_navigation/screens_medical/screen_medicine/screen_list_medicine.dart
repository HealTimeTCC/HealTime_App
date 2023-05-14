import 'package:flutter/material.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';

import '../../../../../shared/decorations/screen_background.dart';
import 'Widget/model_list_medicine.dart';

class ListaRemedios extends StatelessWidget {
  const ListaRemedios({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () => Navigator.of(context).pushNamed('/IncludeMedicine'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * .05),
        ),
        foregroundColor: const Color(0xff1AE8E4),
        backgroundColor: const Color(0xff1AE8E4),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: size.width * .09,
        ),
      ),
      body: Stack(
        children: [
          const BackgroundPage(),
          Positioned(
            top: 0,
            right: 20,
            left: 0,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_ios_new,
                        color: const Color(0xff18CDCA), size: size.width * .08),
                  ),
                  SizedBox(width: size.width * .02),
                  Expanded(
                    child: Text(
                      'Lista de medicamentos',
                      style: FontGoogle.textTitleGoogle(size: size * .9),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            top: 150,
            right: 0,
            left: 0,
            child: Center(
              child: ModelListMedicine(),
            ),
          )
        ],
      ),
    );
  }
}
