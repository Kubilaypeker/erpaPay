import 'package:erpapay/helpers/constants.dart';
import 'package:erpapay/screens/homeScreen.dart';
import 'package:erpapay/screens/moneyTransferScreen.dart';
import 'package:erpapay/screens/profileScreen.dart';
import 'package:erpapay/screens/walletSummaryScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class customNavBar extends StatefulWidget {
  customNavBar({Key? key, required this.selectedIndex}) : super(key: key);

  int selectedIndex;

  @override
  State<customNavBar> createState() => _customNavBarState();
}

class _customNavBarState extends State<customNavBar> {


  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
    Get.off(_pages.elementAt(widget.selectedIndex));
  }

  static const List<Widget> _pages = <Widget>[
    homeScreen(),
    moneyTransferScreen(),
    walletSummaryScreen(),
    profileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: constants.purple,
      elevation: 0,
      selectedLabelStyle: GoogleFonts.questrial(color: constants.purple),
      unselectedLabelStyle: GoogleFonts.questrial(),
      currentIndex: widget.selectedIndex, //New
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Ana Sayfa',
        ),
          BottomNavigationBarItem(
            icon: Icon(Icons.transform),
            label: 'Para Transferi',
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet),
          label: 'Cüzdan Özeti',
        ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
    );
  }
}




