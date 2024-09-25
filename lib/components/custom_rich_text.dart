import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parcel_smart/utils/colors.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final String actionText;
  final TextStyle? textStyle;
  final TextStyle? actionStyle;
  final VoidCallback? onTap;

  const CustomRichText({
    Key? key,
    required this.text,
    required this.actionText,
    this.textStyle,
    this.actionStyle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: textStyle ??
            GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: 0.5,
                color: const Color(0xff000000)),
        children: [
          TextSpan(
            text: actionText,
            style: actionStyle ??
                GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.primaryColor),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
