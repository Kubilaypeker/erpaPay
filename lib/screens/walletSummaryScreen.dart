import 'package:erpapay/widgets/customNavBar.dart';
import 'package:erpapay/widgets/walletSummary/walletSummaryWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:erpapay/helpers/constants.dart';

class walletSummaryScreen extends StatefulWidget {
  const walletSummaryScreen({Key? key}) : super(key: key);

  @override
  State<walletSummaryScreen> createState() => _walletSummaryScreenState();
}

class _walletSummaryScreenState extends State<walletSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Stack(
      children: [
        const Scaffold(backgroundColor: constants.purple,),
        Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: constants.purple,
            elevation: 0,
            title: Text('Cüzdan Özeti', style: GoogleFonts.questrial(fontWeight: FontWeight.bold),),
            centerTitle: true,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(10.h),
                child: Text("Hesap Bakiyeniz: 50000 ", style: GoogleFonts.questrial(fontWeight: FontWeight.w500, color: Colors.white),)),
          ),
          body: SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 600.h,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: ListView(
                  children: [
                    walletSummaryWidget(),
                    walletSummaryWidget(),
                    walletSummaryWidget(),
                    walletSummaryWidget(),
                    walletSummaryWidget(),
                    walletSummaryWidget(),
                    walletSummaryWidget(),
                    walletSummaryWidget(),
                    walletSummaryWidget(),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: customNavBar(selectedIndex: 2,),
        ),
      ],
    );
  }
}
