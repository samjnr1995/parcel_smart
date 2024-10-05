import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parcel_smart/components/custom_button.dart';
import 'package:parcel_smart/screens/auth_screens/forgot_password.dart';
import 'package:parcel_smart/screens/auth_screens/set_new_password.dart';
import 'package:parcel_smart/utils/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _otpController = TextEditingController();
  late Timer _timer;
  int _remainingTime = 60;
  bool _isResendButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  void startResendTimer() {
    _remainingTime = 60; // Reset the timer to 60 seconds
    _isResendButtonDisabled = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _isResendButtonDisabled = false;
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              // Back Arrow
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  // Handle back button
                },
              ),
              SizedBox(height: 20.h),

              // Title and instruction
              Text(
                'Enter the 4-digit code',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: AppColors.primaryColor),
              ),
              SizedBox(height: 10.h),
              Text(
                'Please enter the verification code sent to your email hk****@gmail.com',
                textAlign: TextAlign.left,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: const Color(0xff000000)),
              ),
              SizedBox(height: 20.h),

              // Pin code field for entering the OTP
              PinCodeTextField(
                appContext: context,
                length: 4,
                controller: _otpController,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeColor: AppColors.primaryColor,
                  selectedColor: AppColors.primaryColor,
                  inactiveColor: AppColors.primaryColor,
                ),
                cursorColor: AppColors.primaryColor,
                enableActiveFill: true,
                onChanged: (value) {},
              ),
              SizedBox(height: 10.h),

              // Resend timer and text
              _isResendButtonDisabled
                  ? Row(
                      children: [
                        Text(
                          'Didnt receive any code?',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: const Color(0xff000000)),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "Resend 00:${_remainingTime.toString().padLeft(2, '0')}s",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: AppColors.primaryColor),
                        ),
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        // Handle resend action
                        startResendTimer();
                      },
                      child: const Text(
                        "Resend",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
              SizedBox(height: 20.h),
              CustomButton(
                  color: AppColors.primaryColor,
                  text: 'Verify',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetPasswordScreen()));
                    print("Verifying code: ${_otpController.text}");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
