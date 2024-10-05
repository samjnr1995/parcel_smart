import 'package:flutter/material.dart';
import 'package:parcel_smart/utils/colors.dart';

import '../../dashboard/get_quote.dart';
import '../../dashboard/home_screen.dart';
import '../../dashboard/profile_screen.dart';
import '../../dashboard/wallet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    GetQuoteScreen(),
    const WalletScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  BottomNavigationBar buildMyNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: pageIndex,
      onTap: (index) {
        setState(() {
          pageIndex = index;
        });
      },
      backgroundColor: const Color(0xffFFFFFF),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/ship.png'),
          ),
          label: 'Shipment',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/wallet.png'),
          ),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
    );
  }
}
