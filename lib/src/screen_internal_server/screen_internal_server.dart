import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/provider/login/provider_login.dart';
import '../../shared/decorations/fonts_google.dart';
import 'logic/logic_screen.dart';

class ScreenInternalServer extends StatefulWidget {
  const ScreenInternalServer({Key? key}) : super(key: key);

  @override
  State<ScreenInternalServer> createState() => _ScreenInternalServerState();
}

class _ScreenInternalServerState extends State<ScreenInternalServer> {
  final TextEditingController _textAddressServer = TextEditingController();

  @override
  void dispose() {
    _textAddressServer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final provider = Provider.of<ProviderLogin>(context);

    return Scaffold(
      backgroundColor: const Color(0xff1c1c1c),
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: -size.height * .20,
              left: -size.width * .15,
              child: CircleAvatar(
                radius: size.width * .4,
                backgroundColor: Colors.white10,
              ),
            ),
            Positioned(
              top: -size.height * .15,
              left: -size.width * .3,
              child: CircleAvatar(
                radius: size.width * .4,
                backgroundColor: Colors.white10,
              ),
            ),
            Positioned(
              bottom: -size.height * .15,
              right: -size.width * .15,
              child: CircleAvatar(
                radius: size.width * .39,
                backgroundColor: Colors.white12.withOpacity(.02),
              ),
            ),
            Positioned(
              bottom: -size.height * .15,
              right: -size.width * .3,
              child: CircleAvatar(
                radius: size.width * .4,
                backgroundColor: Colors.white10,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .1, vertical: size.height * .05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Modo configuração Sparrow',
                        textAlign: TextAlign.center,
                        style: FontGoogle.textTitleGoogle(
                            size: size * 1.2, colorText: Colors.white),
                      ),
                      SizedBox(height: size.height * .02),
                      Text(
                        'Alterar endereço do servidor',
                        textAlign: TextAlign.center,
                        style: FontGoogle.textSubTitleGoogle(
                            size: size * .9, colorText: Colors.white),
                      ),
                      SizedBox(height: size.height * .04),
                      Text(
                        'O formato do endereço do servidor tem que seguir o seguinte formado para evitar problemas:\n\n'
                        'Ex: http://localhost/\n\n'
                        'Obs: Lembre-se de colocar no final do endereço a barrinha,sem ela o app não funcionará.',
                        textAlign: TextAlign.justify,
                        style: FontGoogle.textNormaleGoogle(
                            size: size * .9, colorText: Colors.white),
                      ),
                      SizedBox(height: size.height * .06),
                      Text(
                        'Endereço do servidor',
                        textAlign: TextAlign.left,
                        style: FontGoogle.textNormaleGoogle(
                            size: size * .9, colorText: Colors.white),
                      ),
                      SizedBox(height: size.height * .01),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.white38),
                        ),
                        child: TextField(
                          controller: _textAddressServer,
                          cursorColor: Colors.white38,
                          style: FontGoogle.textNormaleGoogle(
                              size: size * .9, colorText: Colors.white),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: size.height * .01,
                                  horizontal: size.width * .02),
                              isCollapsed: true),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      ElevatedButton(
                        onPressed: () => LogicAddressServer.postAddress(
                            context, _textAddressServer.text),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          padding: const EdgeInsets.all(5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        child: Text(
                          'Confirmar',
                          style: FontGoogle.textNormaleGoogle(
                            size: size * .9,
                            colorText: const Color(0xff1c1c1c),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          provider.decrementScreen();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/SplashScreen', (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white60,
                          padding: const EdgeInsets.all(5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        child: Text(
                          'Voltar',
                          style: FontGoogle.textNormaleGoogle(
                            size: size * .9,
                            colorText: const Color(0xff1c1c1c),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
