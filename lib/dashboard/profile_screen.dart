import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parcel_smart/components/custom_button.dart';
import 'package:parcel_smart/dashboard/general.dart';
import 'package:parcel_smart/dashboard/notification.dart';
import 'package:parcel_smart/dashboard/recent_transaction.dart';
import 'package:parcel_smart/dashboard/update_password.dart';
import 'package:parcel_smart/utils/colors.dart';
import 'package:parcel_smart/utils/styles.dart';

import '../components/containers/homeScreen_containers.dart';
import '../utils/labels.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this); // Changed to 3 tabs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 700.h,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Profile',
                      style: AppTextStyles.text.copyWith(
                          fontSize: 20.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: CircleAvatar(
                      radius: 40,
                      child: Image.asset(
                        'assets/profile.png',
                        height: 70.h,
                        width: 80.w,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'John Doe',
                      style: AppTextStyles.text.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 16.sp),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 220,
                right: 0,
                left: 0,
                child: Container(
                  height: 700.h,
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
                          'Account Settings',
                          style: AppTextStyles.text.copyWith(
                            fontSize: 14.sp,
                            color: const Color(0xff353535),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        // Tab Bar

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const General()));
                          },
                          child: const ListTle(
                            title: 'General',
                            subTitle:
                                'By filling your data you get a much experience using the app',
                            image: 'assets/general.png',
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UpdatePassword()));
                          },
                          child: const ListTle(
                            title: 'Password',
                            subTitle:
                                'Update your password to a more stronger password',
                            image: 'assets/password.png',
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationScreen()));
                          },
                          child: const ListTle(
                            title: 'Notification',
                            subTitle: 'Manage your notification experience',
                            image: 'assets/notify.png',
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const ListTle(
                          title: 'Support',
                          subTitle: 'Contact our customer support',
                          image: 'assets/support.png',
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const ListTle(
                          title: 'Logout',
                          subTitle: 'Sign out of yur account',
                          image: 'assets/logout.png',
                        )
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
