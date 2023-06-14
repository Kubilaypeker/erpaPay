import 'package:erpapay/main.dart';
import 'package:erpapay/screens/homeScreen.dart';
import 'package:erpapay/screens/signInSteps/getUserName.dart';
import 'package:erpapay/widgets/signInScreen/userInputsWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:erpapay/helpers/constants.dart';
import 'package:provider/provider.dart';

import 'package:erpapay/helpers/AuthenticationServices.dart';


class loginScreen extends StatefulWidget {
  loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      backgroundColor: constants.backgroundBlack,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: constants.backgroundBlack,
        title: Text('Giriş Yap', style: GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.0.w, vertical: 10.h),
            child: Image.asset('assets/logo2.png'),
          ),
          userInputTextField(
              controller: email,
              hintText: "E-Mail",
              inputType: TextInputType.emailAddress),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              userInputTextField(
                  obscureCheck: obscure,
                  controller: password,
                  hintText: "Şifreniz",
                  inputType: TextInputType.number
              ),
              Container(
                padding: EdgeInsets.only(right: 25.w),
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                  if(obscure == true) {
                    setState(() {
                      obscure = false;
                    });
                  }
                  else{
                    setState(() {
                      obscure = true;
                    });
                  }
                },
                  icon: obsureIcon(obscure),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hesabınız yok mu?', style: GoogleFonts.questrial(color: Colors.white),),
              TextButton(
                  onPressed: () {
                    Get.to(getUserNameScreen());
                  },
                  child: Text('Kayıt Olun!',
                    style: GoogleFonts.questrial(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff665AF0),
                    ),
                  ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            child: TextButton(
              onPressed: (){
                context.read<AuthenticationService>().signIn(email: email.text, password: password.text);
                Get.off(AuthenticationWrapper());
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xff665AF0),),
                  fixedSize: MaterialStateProperty.all(const Size(50, 50))
              ),
              child: Text("Giriş Yap",
                style: GoogleFonts.roboto( fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

obsureIcon(bool obscure) {
  if(obscure == true) {
    return const Icon(Icons.remove_red_eye_outlined);
  }
  else {
    return const Icon(Icons.hide_source);
  }
}