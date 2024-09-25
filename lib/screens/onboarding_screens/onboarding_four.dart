import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parcel_smart/components/custom_button.dart';
import 'package:parcel_smart/utils/colors.dart';

class OnboardingScreenFour extends StatelessWidget {
  const OnboardingScreenFour({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.5,
                width: double.infinity,
                child: Image.asset(
                  'assets/maw.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Welcome to ',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 36.sp,
                              color: Color(0xFF16171C)),
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
                    Text(
                      'Say farewell to those endless waits! With Parcels Mart, your packages are guaranteed to reach you swiftly and in perfect security.',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xFF16171C)),
                    ),
                     SizedBox(
                      height: 25.h,
                    ),
                    CustomButton(
                        text: "Get Started",
                        color: AppColors.primaryColor,
                        onTap: () {})
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
