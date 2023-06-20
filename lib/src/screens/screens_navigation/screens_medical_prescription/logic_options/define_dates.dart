import 'package:flutter/material.dart';
import 'package:healtime/services/provider/prescription_medical/provider_prescription_medic.dart';
import 'package:provider/provider.dart';

class DefineDatePrescriptionMedical {
  /* Selecionar a data */
  /* Data Emissao = True      Data Validade = False  */
  static Future<void> selectDate({
    required BuildContext context,
    required typeEmissao,
  }) async {
    final ProviderPrescriptionMedical providerPrescriptionMedical = Provider.of(context, listen: false);

    final DateTime? picker = await showDatePicker(
      cancelText: 'CANCELAR',
      confirmText: 'CONFIRMAR',
      context: context,
      initialDate: DateTime.now(),
      firstDate: typeEmissao ? DateTime(2000, 01) : DateTime.now(),
      lastDate: typeEmissao ? DateTime.now() : DateTime(2050, 01),
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
      if (typeEmissao) {
        providerPrescriptionMedical.updateEmissaoEm(picker);
      } else {
        providerPrescriptionMedical.updateValidade(picker);
      }
    }
  }

  /*Selecionar o horario*/
  /* Data Emissao = True      Data Validade = False  */
  static Future<void> selectTime({
    required BuildContext context,
    required typeEmissao,
  }) async {
    final ProviderPrescriptionMedical providerPrescriptionMedical =
        Provider.of(context, listen: false);
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      hourLabelText: '',
      anchorPoint: const Offset(1, 2),
      initialTime: TimeOfDay.now(),
      confirmText: 'CONFIRMAR',
      cancelText: 'CANCELAR',
      helpText: null,
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    foregroundColor:
                        const Color(0xff172331), // cor do texto dos botões
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
      if (typeEmissao) {
        providerPrescriptionMedical.setTime = timeOfDay;
      } else {
        providerPrescriptionMedical.setTime = timeOfDay;
      }
    }
  }
}
