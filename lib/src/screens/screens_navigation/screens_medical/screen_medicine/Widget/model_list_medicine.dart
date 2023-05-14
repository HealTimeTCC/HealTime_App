import 'package:flutter/material.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/models/model_medicacao.dart';

class ModelListMedicine extends StatelessWidget {
  const ModelListMedicine({super.key, required this.medicine});

  //final ModelMedicacao medicine;
  final ModelMedicacao medicine;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * .1, vertical: size.height * .01),
      padding: EdgeInsets.symmetric(
          vertical: size.height * .02, horizontal: size.width * .04),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 1, offset: Offset(1, 2), color: Colors.black12)
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  medicine.nomeMedicacao,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FontGoogle.textNormaleGoogle(size: size * .8),
                ),
              ),
              Text(
                (medicine.generico == 'S' ? 'Genérico' : ''),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: FontGoogle.textNormaleGoogle(size: size * .8),
              )
            ],
          ),
          SizedBox(width: size.width * .01),
          Row(
            children: [
              Expanded(
                child: Text(
                  medicine.compostoAtivoMedicacao,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FontGoogle.textNormaleGoogle(size: size * .7),
                ),
              ),
              Text(
                medicine.statusMedicacaoId.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: FontGoogle.textNormaleGoogle(size: size * .7),
              )
            ],
          )
        ],
      ),
    );
  }
}
