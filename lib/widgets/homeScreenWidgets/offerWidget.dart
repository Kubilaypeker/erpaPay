import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class offerWidget extends StatefulWidget {
  const offerWidget({Key? key}) : super(key: key);

  @override
  State<offerWidget> createState() => _offerWidgetState();
}

class _offerWidgetState extends State<offerWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return TextButton(
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Container(
          width: 200.h,
          height: 200.h,
          decoration: BoxDecoration(
            color: const Color(0xffFCFCFC),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(blurRadius: 0, blurStyle: BlurStyle.outer)]
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network('https://i.insider.com/576837b852bcd01a008ca3bf?width=750&format=jpeg&auto=webp',
                    fit: BoxFit.cover,
                    height: 60.h,
                    width: 60.h,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0.h),
                child: Text('Netflix', style: GoogleFonts.questrial(color: Colors.black, fontWeight: FontWeight.w600),),
              ),
              Text('Her ay 30₺ Kazan!',style: GoogleFonts.questrial(color: Colors.black, fontWeight: FontWeight.w500),)
            ],
          )
        ),
      ),
    );
  }
}
