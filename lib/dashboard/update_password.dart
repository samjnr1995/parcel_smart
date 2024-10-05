import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:parcel_smart/components/custom_button.dart';
import 'package:parcel_smart/components/custom_text_field.dart';
import 'package:parcel_smart/dashboard/home_screen.dart';
import 'package:parcel_smart/screens/auth_screens/forgot_password.dart';
import 'package:parcel_smart/screens/auth_screens/sign_up.dart';
import 'package:parcel_smart/utils/colors.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({super.key});

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
                  height: 20.h,
                ),
                Icon(Icons.arrow_back_ios),
                SizedBox(height: 10.h,),
                Text(
                  'Password',
                  style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                    'Update your  password to a more stronger password',
                    style: GoogleFonts.inter(
                        color: const Color(0xff000000),
                        fontSize: 14.sp, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Current Password',
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff353535)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const CustomField(
                    icon: Icons.visibility_off,
                    type: TextInputType.text, hint: '',),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'New Password',
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff353535)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const CustomField(
                    icon: Icons.visibility_off,
                    hint: '',
                    type: TextInputType.text),
                SizedBox(height: 4.h,),
                Text(
                  'Confirm New Password',
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff353535)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const CustomField(
                    icon: Icons.visibility_off,
                    hint: 'Password',
                    type: TextInputType.text),

                SizedBox(
                  height: 20.h,
                ),
                Center(
                    child: CustomButton(
                        color: AppColors.primaryColor,
                        text: 'Update',
                        onTap: () {
                          Navigator.pop(context);
                        })),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
