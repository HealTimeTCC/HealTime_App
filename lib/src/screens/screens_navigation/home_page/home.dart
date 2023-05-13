// home page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/src/screens/screens_navigation/screens_medical/screen_medicine/screen_list_medicine.dart';

import '../screens_medical/screen_doctor/screen_add_doctor.dart';
import '../screens_medical/screen_doctor/screen_list_doctor.dart';
import '../screens_queries/logics/logic_type_user.dart';
import 'home_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final providerLogin = ProviderLogin();

  // @override
  // void initState() {
  //   super.initState();
  //   final usuarioProvider = Provider.of<ProviderLogin>(context);
  // }
  

  //ModelListMedicine listaRemedio = ModelListMedicine(medicine: medicine);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF14D8D5),
      ),
      drawer: Drawer(
        elevation: 0,
        child: ListView(children: [
          ListTile(
            title: Text('Consultas'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => TypeUser.typeUserNavigator(context),
          ),
          ListTile(
            title: Text('Medicamentos'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ListaRemedios())),
          ),
          ListTile(
              title: Text('Pacientes'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => null),
          ListTile(
              title: Text('Medico'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => IncluirMedico()))),
          ListTile(
              title: Text('Listar Medico'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ListarMedico()))),
        ]),
      ),
      body: Stack(children: [
        HomeAppBar(),
        Positioned(
          top: 25,
          left: size.width * .05,
          child: Center(
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 14.20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 245, 245),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(33, 15, 0, 0),
                                spreadRadius: .1,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          width: size.width * .9,
                          height: 130,
                          child: Row(
                            children: [
                              SizedBox(width: size.width * .03),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: size.height * .02),
                                  Text(
                                    "Seg",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.getFont('Poppins',
                                        decoration: TextDecoration.none,
                                        color: const Color(0xff1c1c1c),
                                        fontSize: size.width * .08,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Abril, 2023",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.getFont('Poppins',
                                        decoration: TextDecoration.none,
                                        color: const Color(0xff1c1c1c),
                                        fontSize: size.width * .05,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: size.height * .01),
                                  Text(
                                    "Ultima dose aplicada às 00h00",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.getFont('Poppins',
                                        decoration: TextDecoration.none,
                                        color: const Color(0xff1c1c1c),
                                        fontSize: size.width * .03,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              SizedBox(width: size.width * .08),
                              Image.asset(
                                'assets/img/ImagemRemedio.png',
                                width: 100,
                                height: 100,
                              ),
                            ],
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 18),
                        decoration: BoxDecoration(
                            color: Color(0x7518CDCA),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: MediaQuery.of(context).size.width / 2.3,
                        height: 71,
                        child: Row(
                          children: [
                            SizedBox(width: size.width * .03),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: size.height * .009),
                                  Text(
                                    "Próxima dose",
                                    style: GoogleFonts.getFont('Poppins',
                                        decoration: TextDecoration.none,
                                        color: const Color(0xff1c1c1c),
                                        fontSize: size.width * .04,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Remédio: lalalala 5g",
                                    style: GoogleFonts.getFont('Poppins',
                                        decoration: TextDecoration.none,
                                        color: const Color(0xff1c1c1c),
                                        fontSize: size.width * .03,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "00/00/00 às 00h00",
                                    style: GoogleFonts.getFont('Poppins',
                                        decoration: TextDecoration.none,
                                        color: const Color(0xff1c1c1c),
                                        fontSize: size.width * .03,
                                        fontWeight: FontWeight.w400),
                                  )
                                ]),
                          ],
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(24, 28, 28, 28),
                            elevation: 0,
                            fixedSize: Size(
                                MediaQuery.of(context).size.width / 2.3, 71),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.3,
          right: 0,
          left: 0,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Meus Remédios",
                    style: GoogleFonts.getFont('Poppins',
                        decoration: TextDecoration.none,
                        color: const Color(0xff1c1c1c),
                        fontSize: size.width * .05,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF333333),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13))),
                      child: Text("ver tudo"))
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                height: size.height * .1,
                width: size.width * .9,
                decoration: BoxDecoration(
                    color: Color(0xFFF0F4F3),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(155, 155, 155, 0.129),
                          blurRadius: 3.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            2.0,
                            4.0,
                          ))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "Ibuprofeno",
                          style: GoogleFonts.getFont('Poppins',
                              decoration: TextDecoration.none,
                              color: const Color(0xff1c1c1c),
                              fontSize: size.width * .05,
                              fontWeight: FontWeight.w500),
                        ),
                        Text("1x ao dia"),
                      ],
                    ),
                    SizedBox(width: size.width * .3),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(13),
                            backgroundColor: Color(0xFF18CDCA),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          "1",
                          style: GoogleFonts.getFont('Poppins',
                              decoration: TextDecoration.none,
                              color: Color(0xFFFFFFFF),
                              fontSize: size.width * .06,
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                height: size.height * .1,
                width: size.width * .9,
                decoration: BoxDecoration(
                    color: Color(0xFFF0F4F3),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(155, 155, 155, 0.129),
                          blurRadius: 3.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            2.0,
                            4.0,
                          ))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "Remédio 2",
                          style: GoogleFonts.getFont('Poppins',
                              decoration: TextDecoration.none,
                              color: const Color(0xff1c1c1c),
                              fontSize: size.width * .05,
                              fontWeight: FontWeight.w500),
                        ),
                        Text("4x ao dia"),
                      ],
                    ),
                    SizedBox(width: size.width * .3),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(13),
                            backgroundColor: Color(0xFF18CDCA),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          "7",
                          style: GoogleFonts.getFont('Poppins',
                              decoration: TextDecoration.none,
                              color: Color(0xFFFFFFFF),
                              fontSize: size.width * .06,
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                height: size.height * .1,
                width: size.width * .9,
                decoration: BoxDecoration(
                    color: Color(0xFFF0F4F3),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(155, 155, 155, 0.129),
                          blurRadius: 3.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            2.0,
                            4.0,
                          ))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "Remédio 3",
                          style: GoogleFonts.getFont('Poppins',
                              decoration: TextDecoration.none,
                              color: const Color(0xff1c1c1c),
                              fontSize: size.width * .05,
                              fontWeight: FontWeight.w500),
                        ),
                        Text("3x ao dia"),
                      ],
                    ),
                    SizedBox(width: size.width * .3),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(13),
                            backgroundColor: Color(0xFF18CDCA),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          "13",
                          style: GoogleFonts.getFont('Poppins',
                              decoration: TextDecoration.none,
                              color: Color(0xFFFFFFFF),
                              fontSize: size.width * .06,
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
