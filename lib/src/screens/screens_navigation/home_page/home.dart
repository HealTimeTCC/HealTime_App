// home page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens_queries/logics/logic_type_user.dart';
import 'home_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(children: [
        HomeAppBar(),
        // Positioned(
        //           top: 0,
        //           left: 0,
        //           right: 0,
        //           child: ClipRect(
        //            // clipper: WaveClipperOne(),
        //             child: Container(
        //               height: size.height * .2,
        //               decoration: BoxDecoration(
        //                 color: Color(0xFF14D8D5),
        //               ),
        //             ),
        //           ),
        //         ),
        Positioned(
          top: 110,
          left: size.width * .05,
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
                          color: Color.fromARGB(117, 24, 205, 202),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                          fixedSize: Size(MediaQuery.of(context).size.width / 2.3, 71),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {},
                        child: Icon(Icons.add),
                      ),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: Color.fromARGB(104, 140, 140, 140),
                    //       borderRadius: BorderRadius.all(Radius.circular(10))),
                    //   width: 154,
                    //   height: 71,
                    // )
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

/*Align(
            alignment: Alignment.center,
            child: Container(
              child: ElevatedButton(
                  onPressed: () => TypeUser.typeUserNavigator(context),
                  child: Text('Ir para a tela de listar as consultas')),
            ),
          ),*/




