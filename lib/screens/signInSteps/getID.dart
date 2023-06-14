import 'package:erpapay/screens/signInSteps/getIBAN.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:erpapay/helpers/constants.dart';
import '../../widgets/signInScreen/userInputsWidget.dart';

class getIDscreen extends StatelessWidget {
  getIDscreen({Key? key, required this.userName, required this.userSurname}) : super(key: key);

  TextEditingController identityNumber = TextEditingController();
  String userName;
  String userSurname;

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
              hintText: "TC Kimlik Numarası",
              controller: identityNumber,
              inputType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
              child: TextButton(
                onPressed: () {
                  Get.to(getIbanScreen(userName: userName, userSurname: userSurname, identityNumber: identityNumber.text));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xff665AF0),),
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
