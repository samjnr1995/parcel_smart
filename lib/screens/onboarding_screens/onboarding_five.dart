import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parcel_smart/components/custom_button.dart';
import 'package:parcel_smart/utils/colors.dart';

import '../auth_screens/sign_in_screen.dart';

class OnboardingScreenFive extends StatelessWidget {
  const OnboardingScreenFive({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70.h,),
              SizedBox(
                height: 250.h,
                width: 350.w,
                child: Image.asset(
                  'assets/shipping.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(height: 26.h,),
                        Text(
                          'Welcome to ',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 36.sp,
                              color: const Color(0xFF16171C)),
                        ),

                        Image.asset(
                          "assets/waving_hand.png",
                          width: 30.w,
                          height: 30.h,
                        )
                      ],
                    ),
                    Text(
                      "PARCELS MART",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 36.sp,
                          color: const Color(0xff157C7B)),
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      'Say farewell to those endless waits! With Parcels Mart, your packages are guaranteed to reach you swiftly and in perfect security.',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xFF16171C)),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomButton(
                        text: "Get Started",
                        color: AppColors.primaryColor,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignIn()));
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
