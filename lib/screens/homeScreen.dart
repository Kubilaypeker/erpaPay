import 'package:erpapay/helpers/constants.dart';
import 'package:erpapay/helpers/firestoreServices.dart';
import 'package:erpapay/screens/profileScreen.dart';
import 'package:erpapay/widgets/customNavBar.dart';
import 'package:erpapay/widgets/homeScreenWidgets/offerWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';


class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {


  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, designSize: const Size(375, 812));

    getTime() {
      var username = context.read<firestoreService>().getData(FirebaseAuth.instance.currentUser!.uid);
      var dt = DateTime.now();
      if(dt.hour >= 6 && dt.hour < 10) {
        return Text('Günaydın,\n$username',
          textAlign: TextAlign.left,
          style: GoogleFonts.questrial(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 22.sp,
          ),
        );
      }
      else if(dt.hour >= 10 && dt.hour < 16) {
        return Text('Tünaydın,\n$username',
          textAlign: TextAlign.left,
          style: GoogleFonts.questrial(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 22.sp,
          ),
        );
      }
      else if (dt.hour >= 16 && dt.hour < 21) {
        return Text('İyi Akşamlar,\n$username',
          textAlign: TextAlign.left,
          style: GoogleFonts.questrial(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 22.sp,
          ),
        );
      }
      else {
        return Text('İyi Geceler,\n$username',
          textAlign: TextAlign.left,
          style: GoogleFonts.questrial(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 22.sp,
          ),
        );
      }
    }


    const String erpapaylogo = 'assets/erpapay-logo.svg';
    final Widget logoSvg = SvgPicture.asset(erpapaylogo);

    return Stack(
      children: [
        Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              color: constants.purple,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
            ),
            height: 278.h,
          ),
        ),
        Scaffold(
          backgroundColor: constants.backgroundBlack.withOpacity(0), // to make it invisible
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 100.h,
            elevation: 0,
            backgroundColor: constants.backgroundBlack.withOpacity(0),
            title: Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: SizedBox(
                height: 50.h,
                width: 140.h,
                child: logoSvg,
              ),
            ),
            actions: [
              Container(
                width: 70.h,
                height: 70.h,
                padding: EdgeInsets.only(right: 8.w),
                child: IconButton(
                    onPressed: () {
                      Get.to(profileScreen());
                    },
                    icon: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        fit: BoxFit.cover,
                        height: 60.h,
                        width: 60.h,
                      ),
                    ),
                ),
              )
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 30.0.w, right: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getTime(),
                      Text('Bakiye: 50.000',
                        style: GoogleFonts.questrial(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 570.h,
                  child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 80.h/80.h,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                      ),
                      children: const [
                        offerWidget(),
                        offerWidget(),
                        offerWidget(),
                        offerWidget(),
                        offerWidget(),
                        offerWidget(),
                        offerWidget(),
                        offerWidget(),
                        offerWidget(),
                        offerWidget(),
                        offerWidget(),
                        offerWidget(),
                      ],
                    ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: customNavBar(selectedIndex: 0,),
        ),
      ],
    );
  }
}

