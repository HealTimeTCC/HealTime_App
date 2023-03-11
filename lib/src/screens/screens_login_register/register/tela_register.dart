import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/background/screen_background.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key, required this.typeUser}) : super(key: key);

  final int typeUser;
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const CircleAvatar(
                        backgroundColor: Color(0xff25D8D5),
                        child: Icon(
                          Icons.arrow_back,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'HealTime',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont('Poppins',
                            decoration: TextDecoration.none,
                            color: const Color(0xff1c1c1c),
                            letterSpacing: 1,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * .12,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .06, vertical: size.height * .01),
              child: Column(
                children: [
                  Text(
                    'Ainda não tem uma conta cadastrada?',
                    style: GoogleFonts.getFont('Poppins',
                        decoration: TextDecoration.none,
                        color: const Color(0xff1c1c1c),
                        letterSpacing: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height * .03),
                  Text(
                    'Crie sua conta de forma rápida e fácil agora mesmo!',
                    style: GoogleFonts.getFont('Poppins',
                        decoration: TextDecoration.none,
                        color: const Color(0xff706F6F),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Form(
                    child: Column(
                      children: [
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
