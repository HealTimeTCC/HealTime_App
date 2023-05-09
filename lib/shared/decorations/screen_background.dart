import 'package:flutter/material.dart';

class BackgroundPage extends StatelessWidget {
  const BackgroundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Positioned(
          top: -size.height * .15,
          left: -size.height * .15,
          child: Opacity(
            opacity: 0.15,
            child: CircleAvatar(
              backgroundColor: const Color(0xff18CDCA),
              radius: size.height * .25,
            ),
          ),
        ),
        Positioned(
          bottom: -size.height * .15,
          right: -size.height * .15,
          child: Opacity(
            opacity: 0.15,
            child: CircleAvatar(
              backgroundColor: const Color(0xff949999),
              radius: size.height * .25,
            ),
          ),
        )
      ],
    );
  }
}

class BackgroundPageV2 extends StatelessWidget {
  const BackgroundPageV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color.fromRGBO(10, 228, 224, 1),
        )
      ],
    );
  }
}
