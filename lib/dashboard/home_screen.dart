import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parcel_smart/components/custom_button.dart';
import 'package:parcel_smart/components/custom_text_field.dart';
import 'package:parcel_smart/dashboard/get_quote.dart';
import 'package:parcel_smart/dashboard/profile_screen.dart';
import 'package:parcel_smart/dashboard/wallet.dart';
import 'package:parcel_smart/screens/auth_screens/sign_up.dart';
import 'package:parcel_smart/utils/colors.dart';
import 'package:parcel_smart/utils/styles.dart';

import '../components/containers/homeScreen_containers.dart';
import '../utils/labels.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: SingleChildScrollView(
        child: SizedBox(
          height: 1400.h,
          child: Stack(
            children: [
              const SingleChildScrollView(
                child: Column(
                  children: [
                    CyanContainer(),
                  ],
                ),
              ),
              Positioned(
                top: 250,
                right: 0,
                left: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primaryWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: Container(
                            height: 120.h,
                            width: 325.w,
                            decoration: BoxDecoration(
                                color: AppColors.navyBlue,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 18.h,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 18),
                                      child: Text(Labels.weekendOffer,
                                          style: AppTextStyles.text.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.sp)),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 18),
                                      child: Text(Labels.twentyOff,
                                          style: AppTextStyles.text.copyWith(
                                              fontSize: 26.sp,
                                              fontWeight: FontWeight.w900)),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 50.w,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 110.h,
                                    width: 120.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryWhite,
                                        borderRadius:
                                        BorderRadius.circular(400)),
                                    child: Image.asset(
                                      Labels.cart,
                                      height: 100.h,
                                      width: 100.w,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: Row(
                            children: [
                              DotContainer(
                                color: AppColors.navyBlue,
                                height: 10.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              DotContainer(
                                color: Color(0xffE3E1E8),
                                height: 10.h,
                                width: 10.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              DotContainer(
                                color: const Color(0xffE3E1E8),
                                height: 10.h,
                                width: 10.w,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20,right: 20),
                          child: GreyCardContainer(
                            image: Labels.ship,
                            firstTExt: Labels.youHaveMade,
                            secondText: Labels.eightShipments,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: HomeGreyCardTwo(),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 17),
                            child: Text(Labels.quickActions,
                                style: AppTextStyles.text.copyWith(
                                    fontSize: 14.sp,
                                    color: const Color(0xff353535)))),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: MediumCardContainer(
                                image: Labels.boc,
                                firstText: Labels.bookShipment,
                                secondText: Labels.sendOrReceive,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            const MediumCardContainer(
                                image: Labels.time,
                                firstText: Labels.getQuote,
                                secondText: Labels.request)
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: MediumCardContainer(
                                  image: Labels.location,
                                  firstText: Labels.trackShipment,
                                  secondText: Labels.theProgress,
                                )),
                            SizedBox(
                              width: 20.w,
                            ),
                            const MediumCardContainer(
                                image: Labels.timer,
                                firstText: Labels.shop,
                                secondText: Labels.buy)
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(Labels.shipment,
                                  style: AppTextStyles.text.copyWith(
                                      fontSize: 14.sp,
                                      color: const Color(0xff353535))),
                            ),
                            SizedBox(
                              width: 140.w,
                            ),
                            Text(Labels.viewAll,
                                style: AppTextStyles.text
                                    .copyWith(color: AppColors.primaryColor))
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        const ListTle(
                          title: Labels.id,
                          subTitle: Labels.onTheWay,
                          image: 'assets/package.png',
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        const ListTle(
                            image: 'assets/package.png',
                            title: Labels.idTwo, subTitle: Labels.onTheWay),
                        SizedBox(
                          height: 10.w,
                        ),
                        const ListTle(
                            image: 'assets/package.png',
                            title: Labels.idTwo, subTitle: Labels.onTheWay)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}