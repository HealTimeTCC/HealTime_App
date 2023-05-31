import 'package:flutter/material.dart';

class DetailsPrescription extends StatefulWidget {
  const DetailsPrescription({Key? key}) : super(key: key);
  static GlobalKey<ScaffoldMessengerState> detailsScaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  State<DetailsPrescription> createState() => _DetailsPrescriptionState();
}

class _DetailsPrescriptionState extends State<DetailsPrescription> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: DetailsPrescription.detailsScaffoldKey,
      child: Scaffold(

      ),
    );
  }
}
