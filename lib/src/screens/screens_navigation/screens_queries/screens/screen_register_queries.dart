import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../shared/background/screen_background.dart';
import '../logics/post_query.dart';

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

  /* Variavel para adicionar a observação */
  TextEditingController textObsController = TextEditingController();

  /* Variaveis para a data agendamento*/
  DateTime? dtAgendamento = DateTime.now();
  TimeOfDay? timeAgendamento = TimeOfDay.now();

  /* Variaveis para a data consulta*/
  DateTime? dtConsulta = DateTime.now();
  TimeOfDay? timeConsulta = TimeOfDay.now();

  /* Flag encaminhado */
  int? flagEncaminhado;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont('Poppins',
                          decoration: TextDecoration.none,
                          color: const Color(0xff1c1c1c),
                          fontSize: size.width * .06,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600),
                    ),
                    const Divider(color: Color(0xffEBEBEB)),
                    Form(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.width * .05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            /* Selecionar especialidade */
                            Text(
                              'Selecione a especialidade',
                              style: GoogleFonts.getFont('Poppins',
                                  decoration: TextDecoration.none,
                                  color: const Color(0xff1c1c1c),
                                  fontSize: size.width * .05,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: size.height * .005),
                            Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: const Color(0xffEBEBEB)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: DropdownButton(
                                isExpanded: true,
                                icon: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Colors.grey,
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
                            ),

                            /* Data de agendamento */
                            SizedBox(height: size.height * .03),
                            Text(
                              'Data agendamento',
                              style: GoogleFonts.getFont('Poppins',
                                  decoration: TextDecoration.none,
                                  color: const Color(0xff1c1c1c),
                                  fontSize: size.width * .05,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: size.height * .005),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () async =>
                                        await _selectDate(context, true),
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: size.height * .07,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffD9D9D9),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${DateFormat('dd/MM/yyyy').format(dtAgendamento!)}',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.getFont(
                                                  'Poppins',
                                                  decoration:
                                                      TextDecoration.none,
                                                  color:
                                                      const Color(0xff6A6A6A),
                                                  fontSize: size.width * .05,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.calendar_month_outlined,
                                            color: Color(0xff1c1c1c),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: size.width * .04),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () async =>
                                        await _selectTime(context, true),
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: size.height * .07,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffD9D9D9),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${DateFormat('HH:mm').format(DateTime(0, 0, 0, timeAgendamento!.hour, timeAgendamento!.minute))}',
                                          style: GoogleFonts.getFont('Poppins',
                                              decoration: TextDecoration.none,
                                              color: const Color(0xff6A6A6A),
                                              fontSize: size.width * .05,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * .03),
                            Text(
                              'Data consulta',
                              style: GoogleFonts.getFont('Poppins',
                                  decoration: TextDecoration.none,
                                  color: const Color(0xff1c1c1c),
                                  fontSize: size.width * .05,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: size.height * .005),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () async =>
                                        await _selectDate(context, false),
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: size.height * .07,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffD9D9D9),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              DateFormat('dd/MM/yyyy')
                                                  .format(dtConsulta!),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.getFont(
                                                  'Poppins',
                                                  decoration:
                                                      TextDecoration.none,
                                                  color:
                                                      const Color(0xff6A6A6A),
                                                  fontSize: size.width * .05,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.calendar_month_outlined,
                                            color: Color(0xff1c1c1c),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: size.width * .04),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () async =>
                                        await _selectTime(context, false),
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: size.height * .07,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffD9D9D9),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          DateFormat('HH:mm').format(DateTime(
                                              0,
                                              0,
                                              0,
                                              timeConsulta!.hour,
                                              timeConsulta!.minute)),
                                          style: GoogleFonts.getFont('Poppins',
                                              decoration: TextDecoration.none,
                                              color: const Color(0xff6A6A6A),
                                              fontSize: size.width * .05,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            /* Selecionar o médico */
                            SizedBox(height: size.height * .04),
                            GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                height: size.height * .07,
                                decoration: BoxDecoration(
                                  color: const Color(0xffD9D9D9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Selecione o médico',
                                    style: GoogleFonts.getFont('Poppins',
                                        decoration: TextDecoration.none,
                                        color: const Color(0xff6A6A6A),
                                        fontSize: size.width * .05,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),

                            /* Selecionar se foi encaminhado */
                            SizedBox(height: size.height * .04),
                            Text(
                              'Encaminhamento',
                              style: GoogleFonts.getFont('Poppins',
                                  decoration: TextDecoration.none,
                                  color: const Color(0xff1c1c1c),
                                  fontSize: size.width * .05,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: size.height * .005),
                            Row(
                              children: [
                                Checkbox(
                                    value: flagEncaminhado == 0,
                                    onChanged: (value) {
                                      setState(() {
                                        flagEncaminhado = value! ? 0 : null;
                                      });
                                    }),
                                Expanded(
                                    child: Text(
                                  'Sim',
                                  style: GoogleFonts.getFont('Poppins',
                                      decoration: TextDecoration.none,
                                      color: const Color(0xff1c1c1c),
                                      fontSize: size.width * .05,
                                      fontWeight: FontWeight.w400),
                                ))
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: flagEncaminhado == 1,
                                    onChanged: (value) {
                                      setState(() {
                                        flagEncaminhado = value! ? 1 : null;
                                      });
                                    }),
                                Expanded(
                                    child: Text(
                                  'Não',
                                  style: GoogleFonts.getFont('Poppins',
                                      decoration: TextDecoration.none,
                                      color: const Color(0xff1c1c1c),
                                      fontSize: size.width * .05,
                                      fontWeight: FontWeight.w400),
                                ))
                              ],
                            ),

                            /* Adicionar a observação */
                            SizedBox(height: size.height * .04),
                            Text(
                              'Observações',
                              style: GoogleFonts.getFont('Poppins',
                                  decoration: TextDecoration.none,
                                  color: const Color(0xff1c1c1c),
                                  fontSize: size.width * .05,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: size.height * .005),
                            Container(
                              color: Colors.white,
                              child: TextFormField(
                                controller: textObsController,
                                cursorColor: const Color(0xffEBEBEB),
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffEBEBEB))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffEBEBEB))),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    /* Botão para enviar a consulta */
                    SizedBox(height: size.height * .05),
                    ElevatedButton(
                      onPressed: () async {
                        await PostQuery.modelPostQuery(
                            especialidadeId: 1,
                            medicoId: 1,
                            dateAgendamento: dtAgendamento!,
                            timeAgendamento: timeAgendamento!,
                            dateConsulta: dtConsulta!,
                            timeConsulta: timeConsulta!,
                            flagEncaminhamento: flagEncaminhado!,
                            motivoConsulta: textObsController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: const Color(0xff1AE8E4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45))),
                      child: Text(
                        'Adicionar consulta',
                        style: GoogleFonts.getFont('Poppins',
                            decoration: TextDecoration.none,
                            color: const Color(0xff172331),
                            fontSize: size.width * .04,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: size.height * .05),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* Selecionar a data */
  /* Data Agendamento = True      Data Consulta = False  */
  Future<void> _selectDate(BuildContext context, bool typeAgendamento) async {
    final DateTime initDate = typeAgendamento ? dtAgendamento! : dtConsulta!;

    final DateTime? picker = await showDatePicker(
      cancelText: 'CANCELAR',
      confirmText: 'CONFIRMAR',
      context: context,
      initialDate: initDate,
      firstDate: typeAgendamento ? DateTime(2000, 01) : DateTime.now(),
      lastDate: typeAgendamento ? DateTime.now() : DateTime(2050, 01),
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
      if (typeAgendamento) {
        setState(() {
          dtAgendamento = picker;
        });
      } else {
        setState(() {
          dtConsulta = picker;
        });
      }
    }
  }

  /*Selecionar o horario*/
  /* Data Agendamento = True      Data Consulta = False  */
  Future<void> _selectTime(BuildContext context, bool typeAgendamento) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: typeAgendamento ? timeAgendamento! : timeConsulta!,
      confirmText: 'CONFIRMAR',
      cancelText: 'CANCELAR',
      helpText: null,
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

    if (timeOfDay != null) {
      setState(() {
        if (typeAgendamento) {
          timeAgendamento = timeOfDay;
        } else {
          timeConsulta = timeOfDay;
        }
      });
    }
  }
}
