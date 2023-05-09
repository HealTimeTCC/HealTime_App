import 'package:flutter/material.dart';

import '../screens_medical/screen_doctor/screen_list_doctor.dart';
import '../screens_medical/screen_medicine/screen_include_medicine.dart';
import '../screens_queries/logics/logic_type_user.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(140),
      //     child: AppBar(
      //       elevation: 0,
      //       backgroundColor: Color(0xFF14D8D5),
      //     )),
      body: Column(
        children: [
          Container(
            height: size.height * .1,
            color: Color(0xFF14D8D5),
          ),
        ],
      ),
    );
  }
}
