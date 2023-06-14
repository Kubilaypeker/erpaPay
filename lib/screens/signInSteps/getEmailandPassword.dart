import 'package:erpapay/helpers/AuthenticationServices.dart';
import 'package:erpapay/helpers/firestoreServices.dart';
import 'package:erpapay/main.dart';
import 'package:erpapay/widgets/signInScreen/userInputsWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:erpapay/helpers/constants.dart';
import 'package:provider/provider.dart';


class getEmailandPassword extends StatefulWidget {
  getEmailandPassword({Key? key, required this.userName, required this.userSurname, required this.iban, required this.identityNumber}) : super(key: key);

  String iban;
  String userName;
  String userSurname;
  String identityNumber;

  @override
  State<getEmailandPassword> createState() => _getEmailandPasswordState();
}

class _getEmailandPasswordState extends State<getEmailandPassword> {
  TextEditingController email = TextEditingController();

  TextEditingController phoneNumber = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController checkPassword = TextEditingController();

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
          userInputTextField(controller: email,
              hintText: 'E-mail',
              inputType: TextInputType.emailAddress
          ),
          userInputTextField(controller: phoneNumber,
              hintText: 'Telefon Numarası',
              inputType: TextInputType.number,
          ),
          userInputTextField(controller: password,
              hintText: 'Şifre',
              inputType: TextInputType.text,
              obscureCheck: true,
          ),
          userInputTextField(controller: checkPassword,
              hintText: 'Şifrenizi Onaylayın',
              inputType: TextInputType.text,
              obscureCheck: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
            child: TextButton(
              onPressed: () async {
                if(password.text == checkPassword.text) {
                  context.read<AuthenticationService>().signUp(email: email.text, password: password.text);

                  Users user = Users(
                    id: FirebaseAuth.instance.currentUser!.uid,
                    name: widget.userName,
                    surname: widget.userSurname,
                    identityNumber: widget.identityNumber,
                    phoneNumber: phoneNumber.text,
                    iban: widget.iban,
                    balance: 100,
                  );
                  await context.read<firestoreService>().createUser(user);

                  Get.to(AuthenticationWrapper());
                }
                else {
                  Fluttertoast.showToast(msg: "Girdiğiniz şifreler uyuşmuyor. Lütfen tekrar deneyiniz.");
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xff665AF0),),
                  fixedSize: MaterialStateProperty.all(const Size(50, 50))
              ),
              child: Text("Kayıt Ol",
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

