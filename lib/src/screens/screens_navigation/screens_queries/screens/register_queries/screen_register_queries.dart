import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/register_queries/widgets/app_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../shared/decorations/fonts_google.dart';
import '../../../../../../shared/decorations/screen_background.dart';
import '../../../../../../shared/dto/dto_post_query.dart';
import '../../../../../../shared/models/model_doctor.dart';
import '../../../../../../shared/models/model_especialidades.dart';
import '../../../../../../shared/models/model_pessoa.dart';
import '../../../screens_medical/screen_doctor/screen_list_doctor.dart';
import 'logic/date_time_query.dart';
import 'logic/register_querie.dart';

class RegisterQueries extends StatefulWidget {
  const RegisterQueries({Key? key, required this.dataPessoa}) : super(key: key);
  final Pessoa dataPessoa;

  @override
  State<RegisterQueries> createState() => _RegisterQueriesState();
}

class _RegisterQueriesState extends State<RegisterQueries> {
  final TextEditingController _textObsController = TextEditingController();
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final GlobalKey<State> dropdownKey = GlobalKey();

  String? valueSelect = 'Cardiologia';

  @override
  void dispose() {
    _textObsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerQuery = Provider.of<ProviderQueries>(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const BackgroundPage(),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const AppBarQueries(),
                    SizedBox(height: size.height * .02),
                    Form(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.width * .05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //#region Selecionar especialidade
                            Text(
                              'Selecione a especialidade',
                              style: FontGoogle.textSubTitleGoogle(size: size),
                            ),
                            SizedBox(height: size.height * .005),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * .01,
                                  horizontal: size.width * .04),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 1,
                                    offset: Offset(1, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButton(
                                borderRadius: BorderRadius.circular(15),
                                isExpanded: true,
                                icon: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Colors.grey,
                                  size: size.width * .08,
                                ),
                                underline: Container(),
                                items: providerQuery.listSpecialties
                                    .map((ModelEspecialidades element) {
                                  return DropdownMenuItem<String>(
                                    value: element.descEspecialidade,
                                    child: Text(
                                      element.descEspecialidade,
                                      style: FontGoogle.textNormaleGoogle(
                                          size: size),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (valueChanged) =>
                                    providerQuery.select(valueChanged),
                                value: providerQuery.valueSelect,
                              ),
                            ),
                            //#endregion

                            //#region Data e hora do agendamento
                            SizedBox(height: size.height * .03),
                            Text(
                              'Data agendamento',
                              style: FontGoogle.textSubTitleGoogle(size: size),
                            ),
                            SizedBox(height: size.height * .005),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () async =>
                                        await DateTimeQuery.selectDate(
                                            context, true),
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: size.height * .07,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              DateFormat('dd/MM/yyyy').format(
                                                  providerQuery.dtAgendamento!),
                                              textAlign: TextAlign.center,
                                              style: FontGoogle
                                                  .textNormalGreyGoogle(
                                                      size: size),
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
                                        await DateTimeQuery.selectTime(
                                            context, true),
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: size.height * .07,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          DateFormat('HH:mm').format(DateTime(
                                              0,
                                              0,
                                              0,
                                              providerQuery
                                                  .timeAgendamento!.hour,
                                              providerQuery
                                                  .timeAgendamento!.minute)),
                                          style:
                                              FontGoogle.textNormalGreyGoogle(
                                                  size: size),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //#endregion

                            //#region Data e hora da consulta
                            SizedBox(height: size.height * .03),
                            Text(
                              'Data consulta',
                              style: FontGoogle.textSubTitleGoogle(size: size),
                            ),
                            SizedBox(height: size.height * .005),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () async =>
                                        await DateTimeQuery.selectDate(
                                            context, false),
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: size.height * .07,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              DateFormat('dd/MM/yyyy').format(
                                                  providerQuery.dtConsulta!),
                                              textAlign: TextAlign.center,
                                              style: FontGoogle
                                                  .textNormalGreyGoogle(
                                                      size: size),
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
                                        await DateTimeQuery.selectTime(
                                            context, false),
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: size.height * .07,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          DateFormat('HH:mm').format(DateTime(
                                              0,
                                              0,
                                              0,
                                              providerQuery.timeConsulta!.hour,
                                              providerQuery
                                                  .timeConsulta!.minute)),
                                          style:
                                              FontGoogle.textNormalGreyGoogle(
                                                  size: size),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //#endregion

                            //#region Selecionar o médico
                            SizedBox(height: size.height * .04),
                            Text(
                              'Selecione o médico',
                              style: FontGoogle.textSubTitleGoogle(size: size),
                            ),
                            GestureDetector(
                              onTap: () async {
                                Medico? doctor =
                                    await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ListarMedico(),
                                  ),
                                );

                                if (doctor == null) {
                                  if (mounted) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor:
                                            const Color(0xff18CDCA),
                                        elevation: 1,
                                        behavior: SnackBarBehavior.floating,
                                        showCloseIcon: true,
                                        closeIconColor: const Color(0xff172331),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        content: Text(
                                          'Ação cancelada',
                                          style: FontGoogle.textNormaleGoogle(
                                            size: size * .7,
                                            colorText: const Color(0xff172331),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                } else {
                                  providerQuery.addDoctor(doctor);
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .05),
                                height: size.height * .07,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade100,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    (providerQuery.doctor == null)
                                        ? 'Selecione o médico'
                                        : providerQuery.doctor!.NmMedico,
                                    style: FontGoogle.textNormalGreyGoogle(
                                        size: size),
                                  ),
                                ),
                              ),
                            ),
                            //#endregion

                            //#region Selecionar se foi encaminhado
                            SizedBox(height: size.height * .04),
                            Text(
                              'Encaminhamento',
                              style: FontGoogle.textSubTitleGoogle(size: size),
                            ),
                            SizedBox(height: size.height * .005),
                            Row(
                              children: [
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  activeColor: const Color(0xff1AE8E4),
                                  value: providerQuery.flagEncaminhado == 0,
                                  onChanged: (value) {
                                    int? valueInt = value! ? 0 : null;
                                    providerQuery.addEncaminhamento(valueInt);
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    'Sim',
                                    style: FontGoogle.textNormaleGoogle(
                                        size: size),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  activeColor: const Color(0xff1AE8E4),
                                  value: providerQuery.flagEncaminhado == 1,
                                  onChanged: (value) {
                                    int? valueInt = value! ? 1 : null;

                                    providerQuery.addEncaminhamento(valueInt);
                                  },
                                ),
                                Expanded(
                                    child: Text(
                                  'Não',
                                  style:
                                      FontGoogle.textNormaleGoogle(size: size),
                                ))
                              ],
                            ),
                            //#endregion

                            //#region Adicionar observações
                            SizedBox(height: size.height * .04),
                            Text(
                              'Observações',
                              style: FontGoogle.textSubTitleGoogle(size: size),
                            ),
                            SizedBox(height: size.height * .005),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * .01),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 1,
                                      offset: Offset(1, 2),
                                    )
                                  ]),
                              child: Align(
                                alignment: Alignment.center,
                                child: TextFormField(
                                  controller: _textObsController,
                                  cursorColor: const Color(0xffEBEBEB),
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                      hintText: 'Digite aqui',
                                      hintStyle: FontGoogle.textNormaleGoogle(
                                          size: size,
                                          colorText: Colors.black12),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: size.width * .05),
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                ),
                              ),
                            )
                            //#endregion
                          ],
                        ),
                      ),
                    ),
                    //#region Botão para enviar a consulta
                    SizedBox(height: size.height * .05),
                    ElevatedButton(
                      onPressed: () async {
                        Iterable<ModelEspecialidades> selectSpecialty =
                            providerQuery.listSpecialties.where((element) =>
                                element.descEspecialidade == providerQuery.valueSelect);

                        PostQuery postQuery = PostQuery(
                            dataPerson: widget.dataPessoa,
                            doctorId: providerQuery.doctor?.MedicoId ?? 1,
                            flagForwarding: providerQuery.flagEncaminhado,
                            reasonConsultation: _textObsController.text,
                            specialtyId: selectSpecialty.first.especialidadeId);

                        LogicQueries.postQuery(
                            context: context, postQuery: postQuery);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: const Color(0xff1AE8E4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        ),
                      ),
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
                    //#endregion
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
