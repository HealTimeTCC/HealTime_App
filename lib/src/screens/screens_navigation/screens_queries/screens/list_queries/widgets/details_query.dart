import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../../../../shared/decorations/fonts_google.dart';
import '../../../../../../../shared/decorations/screen_background.dart';

class DetailsQuery extends StatelessWidget {
  const DetailsQuery({super.key, required this.queryId});

  final int queryId;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: size.width * .08,
                          color: const Color(0xff1AE8E4),
                        ),
                      ),
                      SizedBox(width: size.width * .02),
                      Expanded(
                        child: Text(
                          'Detalhes',
                          style: FontGoogle.textTitleGoogle(size: size),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
