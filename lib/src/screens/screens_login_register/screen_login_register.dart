import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/src/screens/screens_login_register/register/tela_register.dart';

import '../../../shared/background/screen_background.dart';
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
                    vertical: size.height * 0.05,
                    horizontal: size.width * 0.05),
                height: size.height * .5,
                width: size.width * .15,
                child: const Image(
                    image: AssetImage('assets/img/ImagemLoginRegister.png'),
                    fit: BoxFit.contain),
              ),
            ),
            Positioned(
              bottom: size.height * 0.05,
              right: 0,
              left: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                decoration: BoxDecoration(
                    color: const Color(0xffCACACA),
                    borderRadius: BorderRadius.circular(45)),
                height: size.height * 0.09,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(typeUser: typeUser),
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
                          builder: (context) => ScreenLogin(),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff172331),
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * .03,
                            horizontal: size.width * .18),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        'Entrar',
                        style: GoogleFonts.getFont('Poppins',
                            decoration: TextDecoration.none,
                            color: Colors.white,
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
