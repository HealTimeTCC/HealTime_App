import 'package:flutter/material.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';

import '../logic/details_query.dart';

class AlertCancelCloseQuery {
  static void alertCancelCloneQuery(
      {required BuildContext context,
      required int personId,
      required int queryId,
      required int status}) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          'Motivo do do cancelamento',
          style: FontGoogle.textTitleGoogle(size: size * .7),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: textController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: FontGoogle.textNormaleGoogle(size: size * .8),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: size.width * .03,
                        vertical: size.height * .02),
                    isCollapsed: true,
                    hintText: 'Informe o motivo',
                    hintStyle: FontGoogle.textNormalGreyGoogle(size: size * .8),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            Text(
              'O motivo tem que ter no minimo 15 caracteres.',
              style: FontGoogle.textNormalGreyGoogle(size: size * .5),
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: Text(
              'Cancelar',
              style: FontGoogle.textNormaleGoogle(size: size * .8),
            ),
          ),
          TextButton(
            onPressed: () async {
              if (textController.text.isNotEmpty ||
                  textController.text.length > 15) {
                await LogicDetailsQuery.alterStatusQuery(
                    context: context,
                    statusId: status,
                    motivo: textController.text,
                    personId: personId,
                    queryId: queryId);

                if (context.mounted) Navigator.of(context).pop();
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: Text(
              'Confirmar',
              style: FontGoogle.textNormaleGoogle(size: size * .8),
            ),
          )
        ],
      ),
    );
  }
}
