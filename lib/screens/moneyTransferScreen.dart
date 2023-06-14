import 'package:erpapay/helpers/constants.dart';
import 'package:erpapay/widgets/customNavBar.dart';
import 'package:erpapay/widgets/signInScreen/userInputsWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:erpapay/helpers/inputFormatters.dart';

class moneyTransferScreen extends StatefulWidget {
  const moneyTransferScreen({Key? key}) : super(key: key);

  @override
  State<moneyTransferScreen> createState() => _moneyTransferScreenState();
}

class _moneyTransferScreenState extends State<moneyTransferScreen> {

  TextEditingController iban = TextEditingController();
  TextEditingController receiverName = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController cardUserName = TextEditingController();
  TextEditingController cardNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Stack(
      children: [
        const Scaffold(backgroundColor: constants.purple,),
        DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: constants.purple,
              elevation: 0,
              title: Text('Para Transferi', style: GoogleFonts.questrial(fontWeight: FontWeight.bold),),
              centerTitle: true,
              bottom: PreferredSize(
              preferredSize: Size.fromHeight(80.h),
              child: Column(
                children: [
                  Text("Hesap Bakiyeniz: ", style: GoogleFonts.questrial(fontWeight: FontWeight.w500, color: Colors.white),),
                  TabBar(
                    labelPadding: EdgeInsets.zero,
                    labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12.sp),
                    labelColor: Colors.white,
                    indicatorColor: constants.purple,
                    tabs: const [
                      Tab(icon: Icon(Icons.money), text: "Para Çek",),
                      Tab(icon: Icon(Icons.money_off), text: "Para Gönder"),
                    ],
                  ),
                ],
              )),
            ),
            body: TabBarView(
              children: [
                SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 600.h,
                      alignment: Alignment.bottomCenter,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffE5E5E5),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: constants.purple, width: 2)
                              ),
                              child: TextFormField(
                                controller: cardNumber,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  CardNumberFormatter(),
                                ],
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Image.network(
                                      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/800px-Mastercard-logo.svg.png',
                                      height: 40.h,
                                      width: 40.w,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'XXXX XXXX XXXX XXXX',
                                    counter: Offstage()
                                ),
                                maxLength: 19,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          userInputTextField(
                              controller: cardUserName,
                              hintText: 'Kartın Üzerindeki İsim',
                              inputType: TextInputType.text
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  width: 100.w,
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                  color: const Color(0xffE5E5E5),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: constants.purple, width: 2),
                                  ),
                                    child: TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      CardDateFormatter(),
                                    ],
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: 'Ay/Yıl',
                                      counter: Offstage()
                                    ),
                                    maxLength: 5,
                                    onChanged: (value) {},
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  width: 100.w,
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffE5E5E5),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: constants.purple, width: 2),
                                  ),
                                  child: TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: 'CVV',
                                        counter: Offstage()
                                    ),
                                    maxLength: 3,
                                    onChanged: (value) {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                //
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(const Color(0xff665AF0),),
                                  fixedSize: MaterialStateProperty.all(Size(120.w, 40.h))
                              ),
                              child: Text("Para Çek",
                                style: GoogleFonts.roboto( fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 600.h,
                      alignment: Alignment.bottomCenter,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 20.h, left: 25.w,),
                            child: Text('IBAN No', style: GoogleFonts.questrial(fontWeight: FontWeight.w900),),
                          ),
                          userInputTextField(controller: iban, hintText: '00 0000 0000 0000 0000 0000 00', inputType: TextInputType.number, prefixText: 'TR',),
                          Padding(
                            padding:  EdgeInsets.only(left: 25.w,),
                            child: Text('Alıcı Adı Soyadı', style: GoogleFonts.questrial(fontWeight: FontWeight.w900),),
                          ),
                          userInputTextField(controller: receiverName, hintText: 'Alıcı Adı Soyadı', inputType: TextInputType.text),
                          Padding(
                            padding:  EdgeInsets.only(left: 25.w,),
                            child: Text('Transfer Miktarı', style: GoogleFonts.questrial(fontWeight: FontWeight.w900),),
                          ),
                          userInputTextField(controller: amount, hintText: 'Miktar', inputType: TextInputType.number),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  //
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(const Color(0xff665AF0),),
                                    fixedSize: MaterialStateProperty.all(Size(120.w, 40.h))
                                ),
                                child: Text("Para Gönder",
                                  style: GoogleFonts.roboto( fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: customNavBar(selectedIndex: 1,),
          ),
        ),
      ],
    );
  }
}