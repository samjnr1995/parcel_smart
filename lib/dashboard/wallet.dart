import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parcel_smart/components/custom_button.dart';
import 'package:parcel_smart/dashboard/recent_transaction.dart';
import 'package:parcel_smart/utils/colors.dart';
import 'package:parcel_smart/utils/styles.dart';

import '../components/containers/homeScreen_containers.dart';
import '../utils/labels.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 800.h,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Wallet',
                          style: AppTextStyles.text.copyWith(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/Vector.png',
                        height: 20.h,
                        width: 20.w,
                      )
                    ],
                  ),
                   SizedBox(height: 20.h),
                  const Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: HomeGreyCardTwo(),
                  ),
                ],
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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recent Transactions',
                          style: AppTextStyles.text.copyWith(
                            fontSize: 14.sp,
                            color: const Color(0xff353535),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        // Tab Bar
                        TabBar(
                          unselectedLabelStyle: AppTextStyles.text.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.navyBlue),
                          controller: tabController,
                          labelColor: AppColors.navyBlue,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: AppColors.primaryColor,
                          labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                          tabs: const [
                            Tab(text: 'All'),
                            Tab(
                              text: 'Completed',
                            ),
                            Tab(text: 'Pending'),
                          ],
                        ),
                        // Tab Bar View
                        SizedBox(
                          height: 500.h, // Adjust height based on your content
                          child: TabBarView(
                            controller: tabController,
                            children:  [
                              Transform.translate(
                                offset: const Offset(0.0, -180),
                                child: const TransactionCard(
                                  transactionId: '176464537',
                                  description: 'Top-up wallet using Paystack',
                                  date: '2024-Aug-06',
                                  amount: '1,000',
                                  status: 'Success',
                                ),
                              ),

                            ],
                          ),
                        ),
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
