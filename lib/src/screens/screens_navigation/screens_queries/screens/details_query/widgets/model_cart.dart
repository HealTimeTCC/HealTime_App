import 'package:flutter/material.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';

class ModelCartSingle extends StatelessWidget {
  const ModelCartSingle(
      {Key? key,
      required this.colorContainer,
      required this.subTitleText,
      required this.titleText})
      : super(key: key);

  final String titleText;
  final String subTitleText;
  final Color colorContainer;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .05, vertical: size.height * .02),
      decoration: BoxDecoration(
        color: colorContainer,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            titleText,
            style: FontGoogle.textNormaleGoogle(size: size * .8),
          ),
          SizedBox(height: size.height * .01),
          Text(
            subTitleText,
            style: FontGoogle.textNormaleGoogle(size: size * .7),
          )
        ],
      ),
    );
  }
}

class ModelCartTwo extends StatelessWidget {
  const ModelCartTwo(
      {Key? key,
      required this.colorContainerPrimary,
      required this.subTitleTextPrimary,
      required this.titleTextPrimary,
      required this.subTitleTextSecondary,
      required this.titleTextSecondary,
      required this.colorContainerSecondary})
      : super(key: key);

  final String titleTextPrimary;
  final String subTitleTextPrimary;
  final Color colorContainerPrimary;

  final String titleTextSecondary;
  final String subTitleTextSecondary;
  final Color colorContainerSecondary;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .05, vertical: size.height * .02),
            decoration: BoxDecoration(
              color: colorContainerPrimary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  titleTextPrimary,
                  style: FontGoogle.textNormaleGoogle(size: size * .75),
                ),
                SizedBox(height: size.height * .02),
                Text(
                  subTitleTextPrimary,
                  style: FontGoogle.textNormaleGoogle(size: size * .7),
                ),
                SizedBox(height: size.height * .03),
              ],
            ),
          ),
        ),
        SizedBox(width: size.width * .02),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .05, vertical: size.height * .02),
            decoration: BoxDecoration(
              color: colorContainerSecondary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  titleTextSecondary,
                  style: FontGoogle.textNormaleGoogle(size: size * .8),
                ),
                SizedBox(height: size.height * .02),
                Text(
                  subTitleTextSecondary,
                  style: FontGoogle.textNormaleGoogle(size: size * .7),
                ),
                SizedBox(height: size.height * .03),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
