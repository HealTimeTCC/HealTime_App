import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingData extends StatelessWidget {
  const LoadingData({Key? key, required this.textLoading}) : super(key: key);

  final String textLoading;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width * .5,
        height: size.width * .4,
        decoration: BoxDecoration(
            color: const Color(0xffE4FFFF), borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: Color(0xff128F8D),
              ),
            ),
            SizedBox(height: size.height * .02),
            Text(
              textLoading,
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont('Poppins',
                  decoration: TextDecoration.none,
                  color: const Color(0xff1c1c1c),
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
