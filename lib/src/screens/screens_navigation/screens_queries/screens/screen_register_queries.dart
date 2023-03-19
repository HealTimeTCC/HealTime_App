import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../shared/background/screen_background.dart';

class RegisterQueries extends StatefulWidget {
  const RegisterQueries({Key? key}) : super(key: key);

  @override
  State<RegisterQueries> createState() => _RegisterQueriesState();
}

class _RegisterQueriesState extends State<RegisterQueries> {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final GlobalKey<State> dropdownKey = GlobalKey();

  final List<String> listEspecialidades = [
    'Teste01',
    'Teste02',
    'Teste03',
    'Teste04',
    'Teste05',
  ];

  String? valueSelect = 'Teste01';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    const BorderSide colorBorderContainer =
        BorderSide(color: Color(0xff1c1c1c));

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: size.width * .08,
                            color: const Color(0xff1AE8E4),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Agendar consulta',
                            style: GoogleFonts.getFont('Poppins',
                                decoration: TextDecoration.none,
                                color: const Color(0xff1c1c1c),
                                fontSize: size.width * .05,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: size.height * .02),
                    Text(
                      'Agendamento',
                      style: GoogleFonts.getFont('Poppins',
                          decoration: TextDecoration.none,
                          color: const Color(0xff1c1c1c),
                          fontSize: size.width * .05,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: size.height * .01),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: const Border(
                            top: colorBorderContainer,
                            left: colorBorderContainer,
                            bottom: colorBorderContainer,
                            right: colorBorderContainer,
                          )),
                      child: Form(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              height: size.height * .05,
                              child: DropdownButton(
                                isExpanded: true,
                                icon: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: const Color(0xff706F6F),
                                  size: size.width * .08,
                                ),
                                underline: Container(),
                                items: listEspecialidades
                                    .map(
                                      (String e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    valueSelect = value;
                                  });
                                },
                                value: valueSelect,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
