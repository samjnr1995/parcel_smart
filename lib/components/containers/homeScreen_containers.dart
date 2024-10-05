import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../dashboard/recent_transaction.dart';
import '../../dashboard/wallet.dart';
import '../../utils/colors.dart';
import '../../utils/labels.dart';
import '../../utils/styles.dart';
import 'package:flutter/material.dart';

import '../custom_button.dart';
import '../custom_text_field.dart';

class GreyCardContainer extends StatelessWidget {
  final String image;
  final String firstTExt;
  final String secondText;
  const GreyCardContainer({
    super.key,
    required this.image,
    required this.firstTExt,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 325.h,
      decoration: BoxDecoration(
          color: const Color(0xffEDEDED),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Image.asset(
              image,
              width: 50,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(firstTExt,
                style: AppTextStyles.text.copyWith(
                    fontWeight: FontWeight.w400, color: AppColors.navyBlue)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(secondText,
                style: AppTextStyles.text.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.navyBlue)),
          )
        ],
      ),
    );
  }
}

class CyanContainer extends StatelessWidget {
  const CyanContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000.h,
      decoration: const BoxDecoration(color: AppColors.primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Image.asset(
                Labels.person,
                height: 50.h,
                width: 50.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Labels.welcome, style: AppTextStyles.text),
                  Text(Labels.goodMorning,
                      style: AppTextStyles.text
                          .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(
                width: 100.w,
              ),
              Image.asset(
                Labels.fluent,
                height: 25.h,
                width: 25.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Image.asset(
                Labels.notification,
                height: 25.h,
                width: 25.w,
              ),
            ],
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(Labels.track,
                style: AppTextStyles.text
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 18)),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              width: 320.w,
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.circular(13),
              ),
              padding: const EdgeInsets.all(2),
              child: TextField(
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.primaryColor,
                    ),
                    border: InputBorder.none,
                    hintText: Labels.trackingNumber,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    hintStyle: AppTextStyles.text.copyWith(
                        fontSize: 14,
                        color: Colors.grey.shade300,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeGreyCardTwo extends StatefulWidget {
  const HomeGreyCardTwo({
    super.key,
  });

  @override
  State<HomeGreyCardTwo> createState() => _HomeGreyCardTwoState();
}

class _HomeGreyCardTwoState extends State<HomeGreyCardTwo> {
  bool _balanceVisible = true;
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  String? _selectedAccountType;


  @override
  void dispose() {
    _textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 325.w,
      decoration: BoxDecoration(
        color: const Color(0xffEDEDED),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Image.asset(
                  'assets/wallet.png',
                  width: 50.w,
                  height: 50.h,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Wallet balance',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: const Color(0xff16171C),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      _balanceVisible ? '₦ 5000' : '****',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: const Color(0xff16171C),
                      ),
                    ),
                     SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _balanceVisible = !_balanceVisible;
                        });
                      },
                      child: Icon(
                        _balanceVisible ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 75.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: (){
                  _showAccountTypeBottomSheet(context);
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/fund.png',
                      height: 20.h,
                      width: 20.h,
                    ),
                     SizedBox(width: 3.w),
                    Text(
                      'Fund wallet',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: const Color(0xff16171C),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _showAccountTypeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: 350.h,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fund Wallet',
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
                          child: Image.asset(
                            'assets/close.png',
                            height: 25.h,
                            width: 25.h,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),

                    ListTile(
                      onTap: () {
                        setState(() {
                          _selectedAccountType = 'Fund with Paystack';
                        });
                      },
                      leading: Icon(
                        _selectedAccountType == 'Fund with Paystack'
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: AppColors.primaryColor,
                      ),
                      title: Text(
                        'Fund with Paystack',
                        style: GoogleFonts.inter(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // Option 2: Bank Transfer
                    ListTile(
                      onTap: () {
                        setState(() {
                          _selectedAccountType = 'Fund with Bank Transfer';
                        });
                      },
                      leading: Icon(
                        _selectedAccountType == 'Fund with Bank Transfer'
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: AppColors.primaryColor,
                      ),
                      title: Text(
                        'Fund with Bank Transfer',
                        style: GoogleFonts.inter(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: AppColors.primaryColor.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    // Proceed button
                    CustomButton(
                      color: AppColors.primaryColor,
                      text: 'Proceed',
                      onTap: () {
                        if (_selectedAccountType != null) {
                          _showFundAccountTypeBottomSheet(context);
                        } else {
                          // Show a message to select an option
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select a funding method.'),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showFundAccountTypeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: 350.h,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Fund Wallet',
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
                            child: Image.asset(
                              'assets/close.png',
                              height: 25.h,
                              width: 25.w,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'Enter an amount',
                        style: AppTextStyles.text.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            color: const Color(0xff353535)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomField(
                          val: AutovalidateMode.onUserInteraction,
                             validator:  (value) {
                            if (value!.isEmpty) {
                              return 'Enter an amount';
                            } else if (value.length < 4) {
                              return 'Amount cannot be less than ₦1000';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            value = _textController.text;
                          },
                          data: _textController,
                          hint: 'Amount',
                          type: TextInputType.phone),
                      SizedBox(height: 50.h),
                      // Proceed button
                      CustomButton(
                        color: AppColors.primaryColor,
                        text: 'Proceed',
                        onTap: () {
                          if(_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const WalletScreen()));
                          }

                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _proceedWithFunding(BuildContext context) {
    if (_selectedAccountType == 'Fund with Paystack') {
      _showFundAccountTypeBottomSheet(context);
    } else if (_selectedAccountType == 'Fund with Bank Transfer') {
      // Handle the Bank Transfer funding process
      print('Proceeding with Bank Transfer...');
      // Add your logic here for Bank Transfer
    }
  }
}




class MediumCardContainer extends StatelessWidget {
  final String image;
  final String firstText;
  final String secondText;

  const MediumCardContainer({
    super.key,
    required this.image,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: const Color(0xffEDEDED),
          borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Image.asset(
                image,
                width: 35,
                height: 35,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                firstText,
                style: AppTextStyles.text.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.navyBlue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(secondText,
                  style: AppTextStyles.text.copyWith(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff4F4F4F))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 110),
              child: Image.asset(
                Labels.arrow,
                height: 30,
                width: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListTle extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  const ListTle({
    super.key,
    required this.title,
    required this.subTitle, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          color: const Color(0xffEDEDED),
          borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
        subtitle: Text(subTitle,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: const Color(0xff4F4F4F))),
        title: Text(title,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: const Color(0xff353535))),
        leading: Image.asset(
          image,
          height: 35,
          width: 35,
        ),
      ),
    );
  }
}

class DotContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  const DotContainer({
    super.key,
    required this.color,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
