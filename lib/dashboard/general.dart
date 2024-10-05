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

class General extends StatelessWidget {
  const General({super.key});

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
                  'General',
                  style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                    'By filling your data you get a much better experience using our app.',
                    style: GoogleFonts.inter(
                      color: Color(0xff000000),
                        fontSize: 14.sp, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 20.h,
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
                const CustomField(
                    hint: 'John', type: TextInputType.emailAddress),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Last Name',
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff353535)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const CustomField(
                    hint: 'Doe',
                    type: TextInputType.text),
                SizedBox(height: 4.h,),
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

                    hint: 'johndoe@gmail.com',
                    type: TextInputType.text),
                Text(
                  'Phone Number',
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff353535)),
                ),
                SizedBox(height: 4,),
                IntlPhoneField(
                  cursorColor: AppColors.primaryColor,
                  decoration: InputDecoration(
                    hintText: '08165254019',
                    hintStyle: const TextStyle(
                      color: Color(0xff888888),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 1.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    counterText: '',
                  ),
                  dropdownIconPosition: IconPosition.trailing,
                  initialCountryCode: 'NG',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                ),
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
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: Image.asset(
                    'assets/FaceID.png',
                    height: 70.h,
                    width: 70.w,
                  ),
                ),
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
