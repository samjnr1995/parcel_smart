import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parcel_smart/components/custom_button.dart';
import 'package:parcel_smart/screens/auth_screens/pin_code_screen.dart';
import 'package:parcel_smart/screens/auth_screens/set_new_password.dart';
import 'package:parcel_smart/utils/colors.dart';

import '../../components/custom_text_field.dart';
import '../../utils/labels.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _emailEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Back Arrow
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  // Handle back button
                },
              ),
              const SizedBox(height: 20),

              // Title and instruction
              Text(
                'Forgot Password',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.primaryColor),
              ),
              SizedBox(height: 10),
              Text(
                'Please enter your email address',
                textAlign: TextAlign.left,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xff000000)),
              ),
              const SizedBox(height: 20),

              // Pin code field for entering the OTP
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
              CustomField(
                  data: _emailEditingController,
                  val: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    value = _emailEditingController.text;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return Labels.emailRequired;
                    } else if (!RegExp(Labels.emailRex)
                        .hasMatch(value)) {
                      return Labels.invalidEmail;
                    }
                    return null;
                  },
                  hint: 'Enter your email', type: TextInputType.emailAddress),
              const SizedBox(height: 20),
              CustomButton(
                  color: AppColors.primaryColor,
                  text: 'Reset Password',
                  onTap: () {
                    if(_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpScreen()));
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
