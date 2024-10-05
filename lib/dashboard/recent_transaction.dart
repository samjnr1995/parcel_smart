import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parcel_smart/utils/styles.dart';

class TransactionCard extends StatelessWidget {
  final String transactionId;
  final String description;
  final String date;
  final String amount;
  final String status;

  const TransactionCard({
    Key? key,
    required this.transactionId,
    required this.description,
    required this.date,
    required this.amount,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor = status == 'Success' ? Colors.green : Colors.orange;

    return Container(
      height: 10,
      margin: const EdgeInsets.symmetric(vertical: 200.0), // Reduced margin
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: const Color(0xffEDEDED), // Light background color for the card
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
        border:
            Border.all(color: Colors.grey.withOpacity(0.3)), // Border for card
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon based on transaction type
            Icon(
              Icons.swap_horiz, // Change icon as needed
              color: statusColor,
              size: 24.0,
            ),
            SizedBox(width: 10.w),
            // Transaction details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactionId,
                    style: AppTextStyles.text.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff353535),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: AppTextStyles.text.copyWith(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff4F4F4F),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    date,
                    style: AppTextStyles.text.copyWith(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff4F4F4F),
                    ),
                  ),
                ],
              ),
            ),
            // Amount and status
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '₦$amount',
                  style: AppTextStyles.text.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff6353535),
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    status,
                    style: AppTextStyles.text.copyWith(
                      fontSize: 8.sp,
                      color: statusColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WalletScreens extends StatelessWidget {
  const WalletScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wallet Transactions')),
      body: ListView(
        children: const [
          TransactionCard(
            transactionId: '176464537',
            description: 'Top-up wallet using Paystack',
            date: '2024-Aug-06',
            amount: '1,000',
            status: 'Success',
          ),
          TransactionCard(
            transactionId: '176464537',
            description: 'Top-up wallet using Paystack',
            date: '2024-Aug-06',
            amount: '1,000',
            status: 'Pending',
          ),
          // Add more TransactionCard widgets here...
        ],
      ),
    );
  }
}

