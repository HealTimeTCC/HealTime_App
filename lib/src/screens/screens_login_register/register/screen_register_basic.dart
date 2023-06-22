import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/decorations/screen_background.dart';
import 'package:healtime/src/screens/screens_login_register/register/screen_register_contact.dart';
import 'package:intl/intl.dart';

import '../../../../shared/dto/dto_pessoa_register.dart';
import '../widgets/text_form_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key, required this.typeUser}) : super(key: key);

  final int typeUser;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();

  /* Chave Global para o formulario para que seja possível realizar validações */
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  DateTime dtNascimento = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          BackgroundPageV2(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .05, vertical: size.height * .01),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'HealTime',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont('Poppins',
                                decoration: TextDecoration.none,
                                color: Color.fromARGB(255, 255, 255, 255),
                                letterSpacing: 1,
                                fontSize: 32,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 120),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
            ),
            child: ListView(
              padding: EdgeInsets.only(left: 20, right: 20),
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * .03),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Ainda não tem uma conta cadastrada?',
                    style: GoogleFonts.getFont('Poppins',
                        decoration: TextDecoration.none,
                        color: const Color(0xff1c1c1c),
                        letterSpacing: 1,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: size.height * .02),
                Text(
                  'Crie sua conta de forma rápida e fácil agora mesmo!',
                  style: GoogleFonts.getFont('Poppins',
                      decoration: TextDecoration.none,
                      color: Color(0xFF155352),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: size.height * .02),
                Form(
                  key: keyForm,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * .02,
                      ),
                      ModelTextForm.modelTextForm(
                          textController: nameController,
                          validator: true,
                          size: size,
                          textLabel: 'Nome',
                          typeKeyboard: TextInputType.text,
                          obscure: false),
                      ModelTextForm.modelTextForm(
                        textController: lastNameController,
                        validator: true,
                        size: size,
                        textLabel: 'Sobrenome',
                        typeKeyboard: TextInputType.text,
                        obscure: false,
                      ),
                      ModelTextForm.modelTextForm(
                          textController: cpfController,
                          validator: true,
                          size: size,
                          textLabel: 'CPF',
                          typeKeyboard: TextInputType.number,
                          obscure: false),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Data de nascimento',
                          style: GoogleFonts.getFont('Poppins',
                              decoration: TextDecoration.none,
                              color: const Color(0xff1c1c1c),
                              fontSize: 15,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async => _selectDate(context),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: EdgeInsets.only(bottom: size.height * 0.04),
                          height: size.height * .08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(107, 78, 225, 225),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today_outlined),
                              SizedBox(width: size.width * .05),
                              Expanded(
                                child: Text(
                                  DateFormat('dd/MM/yyyy').format(dtNascimento),
                                  style: GoogleFonts.getFont('Poppins',
                                      decoration: TextDecoration.none,
                                      color: const Color(0xff1c1c1c),
                                      fontSize: 15,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: navigatorNextPage,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0xFF333333),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45)),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .08,
                                vertical: size.height * .02),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Proximo',
                                style: GoogleFonts.getFont('Poppins',
                                    decoration: TextDecoration.none,
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(width: size.width * .01),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: Color(0xFFFFFFFF),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
      cancelText: 'CANCELAR',
      confirmText: 'CONFIRMAR',
      context: context,
      initialDate: dtNascimento,
      firstDate: DateTime(1900, 01),
      lastDate: DateTime.now(),
      helpText: '',
      locale: const Locale('pt', 'BR'),
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    foregroundColor:
                        const Color(0xff172331) // cor do texto dos botões
                    ),
              ),

              /* Alterar a estrutura do calendario */
              dialogTheme: DialogTheme(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),

              /* Alterar a cor do cabeçario do calendario */
              colorScheme: const ColorScheme.light().copyWith(
                primary: const Color(0xff18CDCA),
              ),
            ),
            child: child ?? Container());
      },
    );

    if (picker != null) {
      setState(() {
        dtNascimento = picker;
      });
    }
  }

  void navigatorNextPage() {
    DtoPessoaRegister pessoa = DtoPessoaRegister(
        contatoCelular: '',
        contatoEmail: '',
        cpfPessoa: cpfController.text,
        nomePessoa: nameController.text,
        sobrenomePessoa: lastNameController.text,
        dtNascPessoa: dtNascimento,
        tipoPessoaId: widget.typeUser,
        passwordString: '');

    final FormState? formState = keyForm.currentState;

    /* Se os registros estiverem 'Ok' */
    if (formState != null && formState.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RegisterContactScreen(pessoa: pessoa),
        ),
      );
    }
  }
}



//Cor Color(0xff18CDCA)
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:healtime/shared/decorations/screen_background.dart';
// import 'package:healtime/src/screens/screens_login_register/register/screen_register_contact.dart';
// import 'package:intl/intl.dart';

// import '../../../../shared/dto/dto_pessoa_register.dart';
// import '../widgets/text_form_model.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key, required this.typeUser}) : super(key: key);

//   final int typeUser;

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController cpfController = TextEditingController();

//   /* Chave Global para o formulario para que seja possível realizar validações */
//   final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
//   DateTime dtNascimento = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Stack(
//         children: [
//           const BackgroundPageV2(),
//           Container(
//             margin: EdgeInsets.only(top: size.height * .2 - 60),
           
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(topLeft : Radius.circular(30), topRight: Radius.circular(30)),
//                color: Colors.white,
//             ),
//           ),
//           SingleChildScrollView(
//             child: SafeArea(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: size.width * .05, vertical: size.height * .01),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () => Navigator.of(context).pop(),
//                           child: Icon(
//                             Icons.arrow_back_ios_new,
//                             size: 35,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             'HealTime',
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.getFont('Poppins',
//                                 decoration: TextDecoration.none,
//                                 color: Color.fromARGB(255, 255, 255, 255),
//                                 letterSpacing: 1,
//                                 fontSize: 32,
//                                 fontWeight: FontWeight.w400),
//                           ),
//                         )
//                       ],
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top: size.height * .08 + 1),
//                       child: Text(                
//                         'Ainda não tem uma conta cadastrada?',
//                         style: GoogleFonts.getFont('Poppins',
//                             decoration: TextDecoration.none,
//                             color: const Color(0xff1c1c1c),
//                             letterSpacing: 1,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     SizedBox(height: size.height * .02),
//                     Text(
//                       'Crie sua conta de forma rápida e fácil agora mesmo!',
//                       style: GoogleFonts.getFont('Poppins',
//                           decoration: TextDecoration.none,
//                           color: Color(0xFF155352),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     SizedBox(height: size.height * .02),
//                     Form(
//                       key: keyForm,
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: size.height * .02,
//                           ),
//                           ModelTextForm.modelTextForm(
//                               textController: nameController,
//                               validator: true,
//                               size: size,
//                               textLabel: 'Nome',
//                               typeKeyboard: TextInputType.text,
//                               obscure: false
//                               ),
//                           ModelTextForm.modelTextForm(
//                               textController: lastNameController,
//                               validator: true,
//                               size: size,
//                               textLabel: 'Sobrenome',
//                               typeKeyboard: TextInputType.text,
//                               obscure: false, ),
//                           ModelTextForm.modelTextForm(
//                               textController: cpfController,
//                               validator: true,
//                               size: size,
//                               textLabel: 'CPF',
//                               typeKeyboard: TextInputType.number,
//                               obscure: false),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Data de nascimento',
//                               style: GoogleFonts.getFont('Poppins',
//                                   decoration: TextDecoration.none,
//                                   color: const Color(0xff1c1c1c),
//                                   fontSize: 15,
//                                   letterSpacing: 1,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () async => _selectDate(context),
//                             child: Container(
                              
//                               padding: const EdgeInsets.all(8.0),
//                               margin:
//                                   EdgeInsets.only(bottom: size.height * 0.04),
//                               height: size.height * .08,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Color.fromARGB(107, 78, 225, 225),
                                
//                               ),
//                               child: Row(
//                                 children: [
//                                   const Icon(Icons.calendar_today_outlined),
//                                   SizedBox(width: size.width * .05),                          
//                                   Expanded(
//                                     child: Text(
//                                       DateFormat('dd/MM/yyyy')
//                                           .format(dtNascimento),
//                                       style: GoogleFonts.getFont('Poppins',
//                                           decoration: TextDecoration.none,
//                                           color: const Color(0xff1c1c1c),
//                                           fontSize: 15,
//                                           letterSpacing: 1,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: ElevatedButton(
//                               onPressed: navigatorNextPage,
//                               style: ElevatedButton.styleFrom(
//                                 elevation: 0,
//                                 backgroundColor: Color(0xFF333333),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(45)),
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: size.width * .08,
//                                     vertical: size.height * .02),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Text(
//                                     'Proximo',
//                                     style: GoogleFonts.getFont('Poppins',
//                                         decoration: TextDecoration.none,
//                                         color: Color(0xFFFFFFFF),
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                   SizedBox(width: size.width * .01),
//                                   const Icon(
//                                     Icons.arrow_forward_ios,
//                                     size: 15,
//                                     color: Color(0xFFFFFFFF),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picker = await showDatePicker(
//       cancelText: 'CANCELAR',
//       confirmText: 'CONFIRMAR',
//       context: context,
//       initialDate: dtNascimento,
//       firstDate: DateTime(1900, 01),
//       lastDate: DateTime.now(),
//       helpText: '',
//       locale: const Locale('pt', 'BR'),
//       builder: (context, child) {
//         return Theme(
//             data: ThemeData.light().copyWith(
//               textButtonTheme: TextButtonThemeData(
//                 style: TextButton.styleFrom(
//                     foregroundColor:
//                         const Color(0xff172331) // cor do texto dos botões
//                     ),
//               ),

//               /* Alterar a estrutura do calendario */
//               dialogTheme: DialogTheme(
//                 elevation: 0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16.0),
//                 ),
//               ),

//               /* Alterar a cor do cabeçario do calendario */
//               colorScheme: const ColorScheme.light().copyWith(
//                 primary: const Color(0xff18CDCA),
//               ),
//             ),
//             child: child ?? Container());
//       },
//     );

//     if (picker != null) {
//       setState(() {
//         dtNascimento = picker;
//       });
//     }
//   }

//   void navigatorNextPage() {
//     DtoPessoaRegister pessoa = DtoPessoaRegister(
//         contatoCelular: '',
//         contatoEmail: '',
//         cpfPessoa: cpfController.text,
//         nomePessoa: nameController.text,
//         sobrenomePessoa: lastNameController.text,
//         dtNascPessoa: dtNascimento,
//         tipoPessoaId: widget.typeUser,
//         passwordString: '');

//     final FormState? formState = keyForm.currentState;

//     /* Se os registros estiverem 'Ok' */
//     if (formState != null && formState.validate()) {
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => RegisterContactScreen(pessoa: pessoa),
//         ),
//       );
//     }
//   }
// }
