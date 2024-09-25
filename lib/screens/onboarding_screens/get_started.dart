import 'package:flutter/material.dart';
import 'package:parcel_smart/screens/onboarding_screens/first_onboarding_screen.dart';
import 'package:parcel_smart/screens/onboarding_screens/onboarding_five.dart';
import 'package:parcel_smart/screens/onboarding_screens/onboarding_three.dart';
import 'package:parcel_smart/screens/onboarding_screens/onboarding_two.dart';

import 'onboarding_four.dart';



class GetStarted extends StatefulWidget {

  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;
  final List<Widget> _pages = [
    const OnboardingScreenThree(),
    const OnboardingScreenFour(),
    const OnboardingScreenFive()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              PageView.builder(

                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _activePage = page;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _pages[index % _pages.length];
                },
              ),

            ],
          ),
        ));




  }
}
