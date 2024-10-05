import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:parcel_smart/dashboard/get_quote.dart';
import 'package:parcel_smart/dashboard/home_screen.dart';
import 'package:parcel_smart/dashboard/profile_screen.dart';
import 'package:parcel_smart/dashboard/recent_transaction.dart';
import 'package:parcel_smart/utils/colors.dart';

import '../dashboard/wallet.dart';
import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  final Color? textColor;
  final String? text;
  final bool loading;
  final Color? color;
  final TextStyle? style;
  final double? width;
  final Function() onTap;

  const CustomButton({
    this.loading = false,
    this.color,
    this.width,
    this.style,
    required this.onTap,
    this.text = 'Submit',
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 60,
          width: 800,
          child: (loading)
              ? const SizedBox(
                  height: 30,
                  width: 40,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                )
              : Text(
                  text!,
                  style: style ??
                      GoogleFonts.inter(
                        color: textColor ?? const Color(0xffFFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                ),
        ),
      ),
    );
  }
}

class ButtomNav extends StatefulWidget {

  const ButtomNav({super.key,});

  @override
  State<ButtomNav> createState() => _ButtomNavState();
}

class _ButtomNavState extends State<ButtomNav> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: AppColors.primaryColor),
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()));
                },
                child: Image.asset(
                  'assets/home.png',
                  width: 20,
                  height: 20,
                ),
              )),
          BottomNavigationBarItem(
              label: 'Shipment',
              icon: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GetQuoteScreen()));
                },
                child: Image.asset(
                  'assets/bus.png',
                  width: 20,
                  height: 20,
                ),
              )),
          BottomNavigationBarItem(
              label: 'Wallet',
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const WalletScreen()));
                },
                child: Image.asset(
                  'assets/pause.png',
                  width: 20,
                  height: 20,
                ),
              )),
          BottomNavigationBarItem(

              label: 'Account',
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ProfileScreen()));
                },
                child: Image.asset(
                  'assets/pic.png',
                  width: 20,
                  height: 20,
                ),
              )),
        ],
      ),
    );
  }
}
