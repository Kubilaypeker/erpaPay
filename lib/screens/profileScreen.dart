import 'package:erpapay/helpers/constants.dart';
import 'package:erpapay/main.dart';
import 'package:erpapay/screens/loginScreen.dart';
import 'package:erpapay/widgets/customNavBar.dart';
import 'package:erpapay/widgets/signInScreen/userInputsWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../helpers/AuthenticationServices.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}
    const int phoneNumber = 05415056351;
    TextEditingController newIban = TextEditingController();
    TextEditingController newEmail = TextEditingController();


class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Stack(
      children: [
        const Scaffold(backgroundColor: constants.purple,),
        Scaffold(
          backgroundColor: constants.purple.withOpacity(0),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 70.h, bottom: 20.h),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    fit: BoxFit.cover,
                    height: 120.h,
                    width: 120.h,
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.only(bottom: 10.h),
                child: Text('Kubilay Peker', style: GoogleFonts.questrial(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24.sp),),
              ),
              Container(
                height: 506.7.h,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric( horizontal: 30.w, vertical: 10.h),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.h, bottom: 4.h),
                        child: Text(phoneNumber.toString(), style: GoogleFonts.questrial(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('TRXX XXXX XXXX XXXX XXXX XX', style: GoogleFonts.questrial(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600),),
                          IconButton(onPressed: () {
                            showAlertDialog(context, 'Iban', newIban, TextInputType.number);
                          }, icon: Icon(Icons.change_circle_outlined, color: constants.purple,  size: 30.sp,))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Kubilaypeker0651@gmail.com', style: GoogleFonts.questrial(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600),),
                          IconButton(onPressed: () {
                            showAlertDialog(context, 'E-Mail', newEmail, TextInputType.emailAddress);
                          }, icon: Icon(Icons.change_circle_outlined, color: constants.purple,  size: 30.sp,))
                        ],
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            //
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(const Color(0xff665AF0),),
                              fixedSize: MaterialStateProperty.all(Size(140.w, 40.h))
                          ),
                          child: Text("Şifre Değiştir",
                            style: GoogleFonts.roboto( fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Get.to(loginScreen());
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(const Color(0xff665AF0),),
                              fixedSize: MaterialStateProperty.all(Size(140.w, 40.h))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.logout, color: Colors.white,),
                              Text("Çıkış Yap",
                                style: GoogleFonts.roboto( fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: customNavBar(selectedIndex: 3),
        ),
      ],
    );
  }
}

showAlertDialog(BuildContext context, hintText, controller, inputType) {

  Widget changeButton = ElevatedButton(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(constants.purple)),
    child: Text("Değiştir",
      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
    ),
    onPressed: () {
      context.read<AuthenticationService>().signOut();
      Get.off(() => AuthenticationWrapper());
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: const Color(0xFF282828),
    content: userInputTextField(
      hintText: hintText,
      controller: controller,
      inputType: inputType,
    ),
    actions: [
      changeButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}