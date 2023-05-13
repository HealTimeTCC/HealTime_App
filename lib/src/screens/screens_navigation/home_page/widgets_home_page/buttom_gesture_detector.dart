import 'package:flutter/material.dart';

class ButtonNextDose extends StatelessWidget {
  const ButtonNextDose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            color: Colors.transparent,
            width: size.width * .4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Proxima dose', style: TextStyle(color: Colors.white),),
                Text('Remedio: Static g',style: TextStyle(color: Colors.white),),
                Text('hh:mm:ss',style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.transparent,
            width: size.width * .4,
            child: const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  size: 24,
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
