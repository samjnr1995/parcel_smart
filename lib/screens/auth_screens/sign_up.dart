import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parcel_smart/components/custom_button.dart';
import 'package:parcel_smart/components/custom_text_field.dart';
import 'package:parcel_smart/utils/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _termsAccepted = false;
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
                  height: 10.h,
                ),
                const Icon(Icons.arrow_back_ios),
                SizedBox(height: 10.h,),
                Text(
                  'Sign Up',
                  style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('Create an account',
                    style: GoogleFonts.inter(
                        fontSize: 14.sp, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'First Name',
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff353535)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const CustomField(hint: 'First Name', type: TextInputType.name),
                 SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Last Name',
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff353535)),
                ),
                SizedBox(height: 4.h,),
                const CustomField(
                    hint: ' Last Name', type: TextInputType.emailAddress),
                SizedBox(
                  height: 10.h,
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
                    hint: ' Email', type: TextInputType.emailAddress),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Phone Number',
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff353535)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const CustomField(
                    hint: ' Phone Number', type: TextInputType.emailAddress),
                SizedBox(
                  height: 10.h,
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
                const CustomField(icon: Icons.visibility_off,hint: 'Password', type: TextInputType.text),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Account Type',
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff353535)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const CustomField(
                    icon: Icons.keyboard_arrow_down,
                    hint: 'Account Type',
                    type: TextInputType.text),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'How did you hear about us?',
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff353535)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const CustomField(
                    icon: Icons.keyboard_arrow_down,
                    hint: 'How did you hear about us?',
                    type: TextInputType.text),

                Row(
                  children: [
                    Checkbox(
                      side: BorderSide.none,
                      fillColor:MaterialStateProperty.all(const Color(0xffEAECF0)),
                        focusColor: const Color(0xffF2F4F7),
                        value: _termsAccepted,
                        onChanged: (value) {
                          setState(() {
                            _termsAccepted = value!;
                          });
                        }),
                    Expanded(
                        child: Text(
                      'Agree With Privacy & Terms of Service',
                      style: GoogleFonts.inter(
                        color: const Color(0xff000000),
                          fontSize: 13.sp, fontWeight: FontWeight.w400),
                    ))
                  ],
                ),
                Center(
                    child: CustomButton(
                        color: AppColors.primaryColor,
                        text: 'Sign Up',
                        onTap: () {})),
                SizedBox(
                  height: 15.h,
                ),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: const Color(0xff000000)),
                      ),
                      SizedBox(
                        width: 4.h,
                      ),
                      Text(
                        'Sign In',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.primaryColor),
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
