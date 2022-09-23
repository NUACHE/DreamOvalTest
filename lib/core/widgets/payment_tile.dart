import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Day Pass',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 2.5.h,
                ),
              ),
              const Spacer(),
              const Text('GHS 10.00'),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: const [
              Text(
                'One-off',
                style: TextStyle(),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: const [
              Text(
                'Qty: 1',
                style: TextStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
