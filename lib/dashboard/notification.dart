import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parcel_smart/components/custom_button.dart';
import 'package:parcel_smart/utils/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Adding toggle states for each notification option
  bool emailAccountActivity = false;
  bool emailCommunications = false;
  bool smsAccountActivity = false;
  bool smsCommunications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Notification',
                  style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('Manage your notification experience',
                    style: GoogleFonts.inter(
                        color: const Color(0xff000000),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 20.h,
                ),

                // Email: Account Activity Notification
                NotificationContainer(
                  title: 'Email: Account Activity',
                  subTitle: 'Get important notifications about your account',
                  sizedBox: 25,
                  isToggled: emailAccountActivity,
                  onToggle: (value) {
                    setState(() {
                      emailAccountActivity = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),

                // Email: Communications Notification
                NotificationContainer(
                  title: 'Email: Communications',
                  subTitle: 'Receive notification for every shipped item',
                  sizedBox: 48,
                  isToggled: emailCommunications,
                  onToggle: (value) {
                    setState(() {
                      emailCommunications = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),

                // SMS: Account Activity Notification
                NotificationContainer(
                  title: 'SMS: Account Activity',
                  subTitle: 'Get important notifications about your account',
                  sizedBox: 25,
                  isToggled: smsAccountActivity,
                  onToggle: (value) {
                    setState(() {
                      smsAccountActivity = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),

                // SMS: Communications Notification
                NotificationContainer(
                  title: 'SMS: Communications',
                  subTitle: 'Receive notification for every shipped item',
                  sizedBox: 47,
                  isToggled: smsCommunications,
                  onToggle: (value) {
                    setState(() {
                      smsCommunications = value;
                    });
                  },
                ),
                SizedBox(height: 30.h),

                // Update Button
                Center(
                    child: CustomButton(
                        color: AppColors.primaryColor,
                        text: 'Update',
                        onTap: () {
                          Navigator.pop(context);
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationContainer extends StatelessWidget {
  final String title;
  final double sizedBox;
  final String subTitle;
  final bool isToggled;
  final ValueChanged<bool> onToggle;

  const NotificationContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.sizedBox,
    required this.isToggled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff353535)),
              ),
              Text(
                subTitle,
                style: GoogleFonts.inter(
                    color: const Color(0xff000000),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            width: sizedBox,
          ),
          GestureDetector(
            onTap: () {
              onToggle(!isToggled); // Toggle the state when tapped
            },
            child: Icon(
              isToggled ? Icons.toggle_on : Icons.toggle_off,
              size: 50,
              color: isToggled ? AppColors.primaryColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
