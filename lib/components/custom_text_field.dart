import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:parcel_smart/utils/colors.dart';

import '../utils/styles.dart';

class CustomField extends StatelessWidget {
  final String hint;
  final AutovalidateMode? val;
  final String? actualHint;
  final Color? textColor;
  final bool isMap;
  final Color? fillColor;
  final bool isDisabled;
  final bool readOnly;
  final IconData? icon;
  final IconData? preIcon;
  final int? maxlines;
  final int? maxlength;
  final Function()? click;
  final Color? color;
  final TextEditingController? data;
  final TextInputType type;
  final bool obs;
  final String? Function(String?)? validator;
  final Function(String)? submit;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final TextCapitalization? tc;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  const CustomField({
    Key? key,
    required this.hint,
    this.fillColor,
    this.color,
    required this.type,
    this.preIcon,
    this.actualHint,
    this.val,
    this.onChanged,
    this.icon,
    this.readOnly = false,
    this.maxlines,
    this.maxlength,
    this.click,
    this.textColor,
    this.data,
    this.validator,
    this.submit,
    this.tc,
    this.isMap = false,
    this.isDisabled = false,
    this.obs = false,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(

        readOnly: readOnly,
        autovalidateMode: val,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        maxLength: maxlength,
        enabled: !isDisabled,
        onSaved: onSaved,
        onFieldSubmitted: submit,
        textCapitalization: tc ?? TextCapitalization.none,
        validator: validator,
        onChanged: onChanged,
        obscureText: obs,
        keyboardType: type,
        controller: data,
        maxLines: maxlines ?? 1,
        cursorColor: Colors.grey,
        style: const TextStyle(
            fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          fillColor: fillColor ?? Colors.white,
          filled: isMap,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          hintText: actualHint ?? hint,
          alignLabelWithHint: true,
          hintStyle: const TextStyle(
            color: Color(0xff888888),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          focusedErrorBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),
              width: 1.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(.3),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.primaryColor
              ,
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
          errorStyle: AppTextStyles.text.copyWith(
            fontWeight: FontWeight.normal,
            color: const Color(0xffC30A3B),
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 35,
            minHeight: 30,
          ),
          prefixIcon: preIcon == null
              ? null
              : Icon(
            preIcon,
            color: const Color(0xff888888),
            size: 20,
          ),
          suffixIcon: IconButton(
            onPressed: click,
            icon: Icon(
              icon,
              size: 18,
              color: const Color(0xff111111),
            ),
          ),
        ),
      ),
    );
  }
}
class IntlPhoneNumber extends StatelessWidget {
  const IntlPhoneNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      pickerDialogStyle: PickerDialogStyle(
          countryCodeStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w400),
          countryNameStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w400),
          backgroundColor: Colors.white),
      dropdownTextStyle: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w400),
      style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w400),
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
            vertical: 18, horizontal: 10),
        alignLabelWithHint: true,
        hintStyle: const TextStyle(
          color: Color(0xff888888),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(.3),
            width: 1.5,
          ),
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
        errorStyle: AppTextStyles.text.copyWith(
          fontWeight: FontWeight.normal,
          color: const Color(0xffC30A3B),
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 35,
          minHeight: 30,
        ),
      ),
      dropdownIconPosition: IconPosition.trailing,
      initialCountryCode: 'NG',
      onChanged: (phone) {
        print(phone.completeNumber);
      },
      onCountryChanged: (country) {
        print('Country changed to: ${country.name}');
      },
    );
  }
}
