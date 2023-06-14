import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class userInputTextField extends StatelessWidget {
  userInputTextField({Key? key,
    required this.controller,
    required this.hintText,
    this.obscureCheck = false,
    required this.inputType,
    this.prefixText = "",
    this.maxLength = 100,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String prefixText;
  bool obscureCheck;
  TextInputType inputType;
  int maxLength;

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xffE5E5E5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xff665AF0), width: 2)
        ),
        child: TextFormField(
          maxLength: maxLength,
          keyboardType: inputType,
          obscureText: obscureCheck,
          style: GoogleFonts.questrial(fontSize: 16, color: Colors.black),
          controller: controller,
          decoration: InputDecoration(
            counter: Offstage(),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              hintText: hintText,
              hintStyle: GoogleFonts.questrial(color: const Color(0xff7F7F92),fontSize: 14,),
              prefixText: prefixText,
              prefixStyle: GoogleFonts.questrial(color: Colors.black,fontSize: 14,),
          ),
        ),
      ),
    );
  }
}