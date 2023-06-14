import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class walletSummaryWidget extends StatelessWidget {
  const walletSummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      child: Container(
        padding: EdgeInsets.all(10.h),
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffe7e6e8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('10.06.2023\n02:17', textAlign: TextAlign.center,style: GoogleFonts.questrial(color: Colors.black, fontWeight: FontWeight.w800),),
            Text('Kubilay Peker\nTR00 0000 0000 0000 0000 0000 00'.toUpperCase(), textAlign: TextAlign.center,style: GoogleFonts.questrial(color: Colors.black, fontWeight: FontWeight.w600),),
            Text('100 ₺', textAlign: TextAlign.center,style: GoogleFonts.questrial(color: Colors.green, fontWeight: FontWeight.w900),)
          ],
        ),
      ),
    );
  }
}
