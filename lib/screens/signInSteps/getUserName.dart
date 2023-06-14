import 'package:erpapay/helpers/constants.dart';
import 'package:erpapay/screens/signInSteps/getID.dart';
import 'package:erpapay/widgets/signInScreen/userInputsWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class getUserNameScreen extends StatelessWidget {
  getUserNameScreen({Key? key}) : super(key: key);

  TextEditingController userName = TextEditingController();
  TextEditingController userSurname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      backgroundColor: constants.backgroundBlack,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
          elevation: 0,
          backgroundColor: constants.backgroundBlack,
          title: Text('Kayıt Ol', style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.w500),),
          centerTitle: true,
        ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.0.w, vertical: 10.h),
            child: Image.asset('assets/logo2.png'),
          ),
          userInputTextField(
            hintText: "İsim",
            controller: userName,
            inputType: TextInputType.text,
          ),
          userInputTextField(
            hintText: "Soy isim",
            controller: userSurname,
            inputType: TextInputType.text,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
            child: TextButton(
              onPressed: (){
                Get.to(getIDscreen(userName: userName.text, userSurname: userSurname.text,));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(constants.purple),
                  fixedSize: MaterialStateProperty.all(const Size(50, 50))
              ),
              child: Text("İleri",
                style: GoogleFonts.roboto( fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
