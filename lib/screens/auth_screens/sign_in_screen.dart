import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parcel_smart/components/custom_button.dart';
import 'package:parcel_smart/components/custom_text_field.dart';
import 'package:parcel_smart/screens/auth_screens/sign_up.dart';
import 'package:parcel_smart/utils/colors.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Sign In',
                  style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('Welcome Back, Sign in to continue.',
                    style: GoogleFonts.inter(
                        fontSize: 14.sp, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Email Address',
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff353535)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const CustomField(
                    hint: 'Enter your email', type: TextInputType.emailAddress),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Password',
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff353535)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const CustomField(
                    obs: true,
                    icon: Icons.visibility_off,
                    hint: 'Enter your password',
                    type: TextInputType.text),
                Padding(
                  padding: const EdgeInsets.only(left: 200),
                  child: Text(
                    'Forgot password?',
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                    child: CustomButton(
                        color: AppColors.primaryColor,
                        text: 'Sign In',
                        onTap: () {})),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                    child: Image.asset(
                  'assets/FaceID.png',
                  height: 70.h,
                  width: 70.w,
                )),
                SizedBox(height: 60.h),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account?',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: const Color(0xff000000)),
                      ),
                      SizedBox(
                        width: 4.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: AppColors.primaryColor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
