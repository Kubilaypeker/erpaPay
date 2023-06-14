import 'package:erpapay/screens/loginScreen.dart';
import 'package:erpapay/screens/signInSteps/getUserName.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:erpapay/helpers/constants.dart';


class welcomeScreen extends StatelessWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const String erpapaylogo = 'assets/erpapay-logo.svg';
    final Widget logoSvg = SvgPicture.asset(erpapaylogo);


    return Scaffold(
      backgroundColor: constants.backgroundBlack,
      body: ListView(
        children: [
          SizedBox(height: 50,),
          SizedBox(
              child: Lottie.asset("assets/welcomeAnimation.json", repeat: false)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: logoSvg,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: TextButton(
                onPressed: (){
                  Get.to(loginScreen());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(constants.purple),
                  fixedSize: MaterialStateProperty.all(const Size(50, 50))
                ),
                child: Text("Başlayın",
                  style: GoogleFonts.roboto( fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16),
                ),
            ),
          ),

        ]
      ),
    );
  }
}
