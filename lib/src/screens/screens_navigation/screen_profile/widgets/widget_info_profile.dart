import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/models/enuns/enum_type_screen_profile.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

import '../../home_page/logic/drawer.dart';
import '../logic/profile.dart';

class InfoProfile extends StatefulWidget {
  const InfoProfile({Key? key}) : super(key: key);

  @override
  State<InfoProfile> createState() => _InfoProfileState();
}

class _InfoProfileState extends State<InfoProfile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return FutureBuilder<Map<String, dynamic>>(
      future: LogicProfile.getDataProfile(context),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            {
              return Column(
                children: [
                  const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff333333),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Text(
                    'Carregando perfil...',
                    style: FontGoogle.textNormaleGoogle(
                      size: size * .9,
                      colorText: const Color(0xff333333),
                    ),
                  )
                ],
              );
            }
          default:
            {
              if (snapshot.data == null) return Container();

              final Pessoa person = snapshot.data!['person'];
              final Uint8List img = snapshot.data!['img'];

              return Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                height: size.height * .2,
                decoration: BoxDecoration(
                  color: const Color(0xffEBEBEB),
                  borderRadius: BorderRadius.circular(size.width * .03),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await LogicDrawer.addImageProfile(
                          context: context,
                          typeOperation: TypeProfile.typeScreenProfile,
                        );
                        setState(() {});
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size.width),
                            border: Border.all(
                              color: const Color(0xff6A6A6A),
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xffD9D9D9),
                            radius: size.width * .15,
                            child: Align(
                              alignment: Alignment.center,
                              child: img.isNotEmpty
                                  ? Container(
                                      width: size.width * .46,
                                      height: size.height * .23,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFFCC8C),
                                        borderRadius:
                                            BorderRadius.circular(size.width),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: MemoryImage(img, scale: 0.7),
                                        ),
                                      ),
                                    )
                                  : SvgPicture.asset(
                                      'assets/svg/user.svg',
                                      height: size.height * .1,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * .02),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            '${person.nomePessoa} ${person.sobreNomePessoa}',
                            style:
                                FontGoogle.textNormaleGoogle(size: size * .7),
                          ),
                          SizedBox(height: size.height * .01),
                          Text(
                            person.contact!.email,
                            style:
                                FontGoogle.textNormaleGoogle(size: size * .7),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
