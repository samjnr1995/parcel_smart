import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/labels.dart';
import '../utils/colors.dart'; // Import your labels here

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  String _accountType = 'Business';
  String _accountTypeTwo = 'Personal';
  String? _emailError;
  String? _firstNameError;
  String? _lastNameError;
  String? _passwordError;
  bool _termsAccepted = true;
  bool _passwordInVisible = true;

  bool get isLoading => _isLoading;
  String? get accountTypeTwo => _accountTypeTwo;
  String? get firstNameError => _firstNameError;
  String? get accountType => _accountType;
  String? get lastNameError => _lastNameError;
  bool get termsAccepted => _termsAccepted;
  String? get emailError => _emailError;
  String? get passwordError => _passwordError;
  bool get passwordInvisible => _passwordInVisible;

  void togglePasswordVisibility() {
    _passwordInVisible = !_passwordInVisible;
    notifyListeners();
  }

  void toggleTermsAccepted() {
    _termsAccepted = !_termsAccepted;
    notifyListeners();
  }

  void selectAccountTwo() {
    _accountTypeTwo = 'Personal';
    notifyListeners();
  }


  bool validateName(String name) {
    if (name.isEmpty) {
      _firstNameError = Labels.nameIsRequired;
      notifyListeners();
      return false;
    } else {
      _firstNameError = null;
      notifyListeners();
      return true;
    }
  }
  void login(String email, String password) {
    if (!validateForm(email, password)) {
      return;
    }
    _isLoading = true;
    notifyListeners();
    Future.delayed(const Duration(seconds: 2), () {
      _isLoading = false;
      notifyListeners();
    });
  }

  bool validateLastName(String lastname) {
    if (lastname.isEmpty) {
      _lastNameError = Labels.nameIsRequired;
      notifyListeners();
      return false;
    } else {
      _lastNameError = null;
      notifyListeners();
      return true;
    }
  }

  bool validateEmail(String email) {
    if (email.isEmpty) {
      _emailError = Labels.emailRequired;
      notifyListeners();
      return false;
    } else if (!RegExp(Labels.emailRex).hasMatch(email)) {
      _emailError = Labels.invalidEmail;
      notifyListeners();
      return false;
    } else {
      _emailError = null;
      notifyListeners();
      return true;
    }
  }

  bool validatePassword(String password) {
    if (password.isEmpty) {
      _passwordError = Labels.passwordRequired;
      notifyListeners();
      return false;
    } else if (password.length < 8) {
      _passwordError = Labels.weakPassordPlease;
      notifyListeners();
      return false;
    } else {
      _passwordError = null;
      notifyListeners();
      return true;
    }
  }

  bool validateSignUpForm(
      String email, String password, String name, String lastName) {
    final isEmailValid = validateEmail(email);
    final isLastNameValid = validateName(lastName);
    final isNameValid = validateName(name);
    final isPasswordValid = validatePassword(password);
    return isEmailValid && isPasswordValid && isNameValid && isLastNameValid;
  }

  bool validateForm(String email, String password) {
    final isEmailValid = validateEmail(email);
    final isPasswordValid = validatePassword(password);
    return isEmailValid && isPasswordValid;
  }
  void selectAccount(String type) {
    _accountType = type;
    notifyListeners();
  }

  void showAccountTypeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Account Type',
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff353535),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close),
                    )
                  ],
                ),
                SizedBox(height: 20.h),

                // Business Account Tile
                ListTile(
                  onTap: () {
                    selectAccount('Business');
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.business, color: AppColors.primaryColor),
                  title: Text(
                    'Business',
                    style: GoogleFonts.inter(
                        fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                  tileColor: _accountType == 'Business'
                      ? AppColors.primaryColor.withOpacity(0.2)
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: _accountType == 'Business'
                            ? AppColors.primaryColor
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                SizedBox(height: 10.h),

                // Personal Account Tile
                ListTile(
                  onTap: () {
                    selectAccount('Personal');
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.person, color: AppColors.primaryColor),
                  title: Text(
                    'Personal',
                    style: GoogleFonts.inter(
                        fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                  tileColor: _accountType == 'Personal'
                      ? AppColors.primaryColor.withOpacity(0.2)
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: _accountType == 'Personal'
                            ? AppColors.primaryColor
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


}

