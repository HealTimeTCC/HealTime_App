import 'package:flutter/material.dart';
import 'package:healtime/src/screens/screens_navigation/screen_profile/widgets/widget_info_profile.dart';
import 'package:healtime/src/screens/screens_navigation/screen_profile/widgets/widget_options_profile.dart';

import '../../../../shared/decorations/screen_background.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          ListView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()
            ),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .1, vertical: size.height * .07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const InfoProfile(),
                    SizedBox(height: size.height * .05),
                    const OptionsProfile(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
