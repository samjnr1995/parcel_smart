import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parcel_smart/components/custom_button.dart';
import 'package:parcel_smart/components/custom_text_field.dart';
import 'package:parcel_smart/dashboard/home_screen.dart';
import 'package:parcel_smart/screens/auth_screens/forgot_password.dart';
import 'package:parcel_smart/screens/auth_screens/sign_up.dart';
import 'package:parcel_smart/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../Providers/login_provider.dart';
import '../../utils/labels.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailEditingController = TextEditingController();
  bool isLoading = false;
  final _passwordEditingController = TextEditingController();
  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    Labels.signIn,
                    style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(Labels.welcomeBack,
                      style: GoogleFonts.inter(
                          fontSize: 14.sp, fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    Labels.emailAddress,
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
                        loginProvider.validateEmail(value);
                      },
                      validator: (value) {
                        return loginProvider.emailError;
                      },
                      hint: Labels.enter,
                      type: TextInputType.emailAddress),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    Labels.password,
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
                        return loginProvider.passwordError;
                      },
                      onChanged: (value) {
                        loginProvider.validatePassword(value);
                      },
                      data: _passwordEditingController,
                      obs: !loginProvider.passwordInvisible,
                      icon: loginProvider.passwordInvisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      click: () {
                        loginProvider.togglePasswordVisibility();
                      },
                      hint: Labels.enterYourPassword,
                      type: TextInputType.text),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()));
                      },
                      child: Text(
                        Labels.forgotPassword,
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: CustomButton(
                          loading: isLoading,
                          color: AppColors.primaryColor,
                          text: Labels.signIn,
                          onTap: () {
                            if (loginProvider.validateForm(
                                _emailEditingController.text,
                                _passwordEditingController.text)) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            }
                          })),
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                    child: Image.asset(
                      Labels.faceId,
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
                          Labels.dontHave,
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
                            Labels.signUp,
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
      ),
    );
  }
}
