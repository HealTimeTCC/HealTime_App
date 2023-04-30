import 'package:flutter/material.dart';

import '../../../../../services/data_locale/data_preferences.dart';
import '../../../../../services/data_locale/data_preferences_pessoa.dart';
import '../../../../../shared/consts/consts_key_preferences.dart';

class OptionsProfile extends StatelessWidget {
  const OptionsProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .03, vertical: size.height * .03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Icon(
                Icons.settings_outlined,
                color: Color(0xff494949),
              ),
              SizedBox(width: size.width * .02),
              const Expanded(
                child: Text('Configurações'),
              )
            ],
          ),
          const Divider(
            color: Color(0xffE3DDDD),
          ),
          Row(
            children: [
              const Icon(
                Icons.password_rounded,
                color: Color(0xff494949),
              ),
              SizedBox(width: size.width * .02),
              const Expanded(
                child: Text('Alterar senha'),
              )
            ],
          ),
          const Divider(
            color: Color(0xffE3DDDD),
          ),
          GestureDetector(
            onTap: () {
              DataPreferences.removeData(key: ConstsPreferences.keyUser);
              Navigator.of(context).pushNamedAndRemoveUntil('/SplashScreen', (route) => false);
            },
            child: GestureDetector(
              onTap: () async => await DataPreferencesPessoa.removeUser(context),
              child: Row(
                children: [
                  const Icon(
                    Icons.exit_to_app_rounded,
                    color: Color(0xff494949),
                  ),
                  SizedBox(width: size.width * .02),
                  const Expanded(
                    child: Text('Sair'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
