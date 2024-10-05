import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parcel_smart/components/custom_button.dart';
import 'package:parcel_smart/utils/colors.dart';
import 'package:parcel_smart/utils/styles.dart';

class GetQuoteScreen extends StatefulWidget {
  @override
  _GetQuoteScreenState createState() => _GetQuoteScreenState();
}

class _GetQuoteScreenState extends State<GetQuoteScreen> {
  // Dropdown values
  String? originCity;
  String? destinationCity;
  String? quantity = '1';
  String? weight = '5';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h,),
              Row(
                children: [
                  Text(
                    'Get Quote',
                    style: AppTextStyles.text.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff353535)),
                  ),
                  SizedBox(width: 220,),
                  Image.asset(
                    'assets/close.png',
                    height: 20.h,
                    width: 20.w,
                  ),

                ],
              ),
              SizedBox(height: 15.h,),
              Row(
                children: [
                  Text('Select origin city'),
                  SizedBox(
                    width: 50.w,
                  ),
                  Text('Select destination city')
                ],
              ),
              SizedBox(height: 4.h,),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: AppColors.primaryColor,
                            width: 1.5,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      value: originCity,
                      items: ['1', '2', '3'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          originCity = newValue;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    // Select destination city
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: AppColors.primaryColor,
                            width: 1.5,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      value: destinationCity,
                      items: ['1', '2', '3'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          destinationCity = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Text('Quantity'),
                  SizedBox(
                    width: 105.w,
                  ),
                  Row(
                    children: [
                      Text(
                        'Weight (KG)',
                        style: AppTextStyles.text
                            .copyWith(fontSize: 12.sp, color: Color(0xff353535)),
                      ),
                      Image.asset(
                        'assets/sync.png',
                        height: 20.h,
                        width: 20.w,
                        color: AppColors.primaryColor,
                      ),
                      Text(
                        'To volume',
                        style: AppTextStyles.text.copyWith(
                            fontSize: 12.sp, color: AppColors.primaryColor),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 4.h,),
              Row(
                children: [
                  Expanded(
                    // Quantity
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: AppColors.primaryColor,
                            width: 1.5,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      value: quantity,
                      items: ['1', '2', '3', '4', '5'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          quantity = newValue;
                        });
                      },
                    ),
                  ),
                   SizedBox(width: 16.w),
                  Expanded(
                    // Quantity
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:  BorderSide(
                            color: AppColors.primaryColor,
                            width: 1.5.w,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      value: quantity,
                      items: ['1', '2', '3', '4', '5'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          weight = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Note Field
              Text('Note'),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor,
                      width: 1.5,
                    ),
                  ),
                  hintStyle: AppTextStyles.text.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff000000)),
                  hintText: "You can include any additional description here.",
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30.h),
              // Add New Item Button
              CustomButton(
                textColor: AppColors.primaryColor,
                  color: const Color(0xffF4FDF8), text: 'Add New Item', onTap: () {}),
              SizedBox(height: 13.h),
              // Get Quote Button
              CustomButton(
                  color: AppColors.primaryColor,
                  text: 'Get Quote',
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
