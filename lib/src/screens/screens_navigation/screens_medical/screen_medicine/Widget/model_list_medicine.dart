import 'package:flutter/material.dart';
import 'package:healtime/shared/models/model_medicacao.dart';

class ModelListMedicine extends StatelessWidget {
  const ModelListMedicine({
    super.key,
  });

  //final ModelMedicacao medicine;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 350,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(
            Icons.photo_size_select_large_sharp,
            size: 50,
          ),
          SizedBox(width: 10),
          Text("Nome medicamento"),
        ],
      ),
    );
  }
}
