import 'package:flutter/material.dart';
class FundWalletBottomSheet extends StatefulWidget {
  @override
  _FundWalletBottomSheetState createState() => _FundWalletBottomSheetState();
}

class _FundWalletBottomSheetState extends State<FundWalletBottomSheet> {
  String? _selectedOption = 'Paystack'; // Default selected option

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ensure the modal sheet takes minimal height
        children: [
          // Close button at the top right corner
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Text(
            "Fund Wallet",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 16),
          // Radio buttons for funding options
          RadioListTile<String>(
            title: Text("Fund with Paystack"),
            value: 'Paystack',
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text("Fund with Bank Transfer"),
            value: 'Bank Transfer',
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          SizedBox(height: 16),
          // Proceed button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal, // Button color
              minimumSize: Size(double.infinity, 48), // Full-width button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              // Handle the proceed action
              Navigator.pop(context); // Close the bottom sheet after proceeding
            },
            child: Text("Proceed"),
          ),
          SizedBox(height: 16), // Bottom spacing
        ],
      ),
    );
  }
}