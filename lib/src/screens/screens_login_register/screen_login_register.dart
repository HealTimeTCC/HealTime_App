import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/src/screens/screens_login_register/register/screen_register_basic.dart';

import '../../../shared/decorations/screen_background.dart';
import 'login/screen_login.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({Key? key, required this.typeUser}) : super(key: key);

  final int typeUser;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return OrientationBuilder(
      builder: (context, orientation) {
        return Stack(
          children: [
            const BackgroundPage(),
            Positioned(
              top: size.height * .15,
              right: 0,
              left: 0,
              child: Text(
                'Bem Vindo (a)',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont('Poppins',
                    decoration: TextDecoration.none,
                    color: const Color(0xff1c1c1c),
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
              top: size.height * .20,
              right: 0,
              left: 0,
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.01,
                    horizontal: size.width * 0.02),
                height: size.height * .6,
                width: size.width * .17,
                child: const Image(
                    image: AssetImage('assets/img/Doctor-cuate.png'),
                    fit: BoxFit.contain),
              ),
            ),
            Positioned(
              bottom: size.height * 0.06,
              right: 0,
              left: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                decoration: BoxDecoration(
                    color: const Color(0xffCACACA),
                    borderRadius: BorderRadius.circular(25)),
                height: size.height * 0.07,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                RegisterScreen(typeUser: typeUser),
                          ),
                        ),
                        child: Text(
                          'Cadastrar',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont('Poppins',
                              decoration: TextDecoration.none,
                              color: const Color(0xff1c1c1c),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ScreenLogin(),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff18CDCA),
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * .02,
                            horizontal: size.width * .17),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: Text(
                        'Entrar',
                        style: GoogleFonts.getFont('Poppins',
                            decoration: TextDecoration.none,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
