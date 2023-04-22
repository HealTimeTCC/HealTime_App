import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../services/provider/queries/provider_queries.dart';

class DateTimeQuery {

  /* Selecionar a data */
  /* Data Agendamento = True      Data Consulta = False  */
  static Future<void> selectDate(BuildContext context, bool typeAgendamento) async {
    final providerQuery = Provider.of<ProviderQueries>(context, listen: false);

    final DateTime initDate =
    typeAgendamento ? providerQuery.dtAgendamento! : providerQuery.dtConsulta!;

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
        providerQuery.addDtAgendamento(picker);
      } else {
        providerQuery.addDateConsulta(picker);
      }
    }
  }

  /*Selecionar o horario*/
  /* Data Agendamento = True      Data Consulta = False  */
  static Future<void> selectTime(BuildContext context, bool typeAgendamento) async {
    final providerQuery = Provider.of<ProviderQueries>(context, listen: false);
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime:
      typeAgendamento ? providerQuery.timeAgendamento! : providerQuery.timeConsulta!,
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
      if (typeAgendamento) {
        providerQuery.addTimeAgendamento(timeOfDay);
      } else {
        providerQuery.addTimeConsulta(timeOfDay);
      }
    }
  }
}