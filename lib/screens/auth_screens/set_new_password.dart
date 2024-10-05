import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parcel_smart/components/custom_button.dart';
import 'package:parcel_smart/screens/auth_screens/registration_successful.dart';
import 'package:parcel_smart/utils/colors.dart';

import '../../components/custom_text_field.dart';
import '../../utils/labels.dart';

class SetPasswordScreen extends StatefulWidget {
  @override
  _SetPasswordScreenState createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  TextEditingController _setNewPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordInVisible = true;
  bool isLoading = false;
  final _passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                  'Set New Password',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: AppColors.primaryColor),
                ),
                SizedBox(height: 10),
                Text(
                  'Please enter your new Password',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xff000000)),
                ),
                const SizedBox(height: 20),

                // Pin code field for entering the OTP
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
                CustomField(
                    val: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Labels.passwordRequired;
                      } else if (value.length < 8) {
                        return Labels.weakPassordPlease;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      value = _passwordEditingController.text;
                    },

                    data: _passwordEditingController,
                    obs: _passwordInVisible,
                    icon: _passwordInVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    click:  () {
                      setState(() {
                        _passwordInVisible =
                        !_passwordInVisible;
                      });
                    },
                    hint: 'Enter your password',
                    type: TextInputType.text),
                const SizedBox(height: 20),
                Text(
                  'Confirm Password',
                  style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff353535)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomField(
                    val: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please confirm password';
                      } else if (_setNewPasswordController.text != _passwordEditingController.text) {
                        return 'mismatched password';
                      }else if (_setNewPasswordController.text == _passwordEditingController.text){
                        return null;
                      }

                    },
                    onChanged: (value) {
                      value = _setNewPasswordController.text;
                    },

                    data: _setNewPasswordController,
                    obs: _passwordInVisible,
                    icon: _passwordInVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    click:  () {
                      setState(() {
                        _passwordInVisible =
                        !_passwordInVisible;
                      });
                    },
                    hint: 're-enter your password',
                    type: TextInputType.text),
                const SizedBox(height: 20),

                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                    color: AppColors.primaryColor,
                    text: 'Save Password',
                    onTap: () {
                      if(_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrationSuccessDialog()));
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
