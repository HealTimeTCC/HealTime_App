import 'package:flutter/material.dart';

class DefineDataPrescription extends StatefulWidget {
  const DefineDataPrescription({Key? key}) : super(key: key);

  @override
  State<DefineDataPrescription> createState() => _DefineDataPrescriptionState();
}

class _DefineDataPrescriptionState extends State<DefineDataPrescription> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * .1,
            color: const Color(0xFF14D8D5),
            child: Text("APP BAR"),
          ),
          ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()
            ),
            children: [
              Column(
                children: [
                  Text('data')
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
