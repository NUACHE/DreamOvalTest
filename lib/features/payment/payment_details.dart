import 'package:deip/core/theme/app_colors.dart';
import 'package:deip/core/widgets/brand_buttons.dart';
import 'package:deip/core/widgets/brand_textfield.dart';
import 'package:deip/features/home/models/home_model.dart';
import 'package:deip/features/payment/checkout.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key, required this.selectedModel});
  final HomeModel selectedModel;

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  TextEditingController payerController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController referenceController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  bool payerError = false;
  bool phoneError = false;
  bool referenceError = false;
  bool amountError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Payment Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Please review the costs and provide your payment details',
                    style: TextStyle(
                        fontSize: 2.h,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Payer'),
                  ),
                  BrandTextBox(
                    name: 'Name of payer',
                    controller: payerController,
                    errorMessage: 'Invalid name',
                    error: payerError,
                    boxColor: AppColors.baseBlue,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Phone Number'),
                  ),
                  BrandTextBox(
                    name: 'Phone number of payer',
                    controller: phoneController,
                    errorMessage: 'Invalid phone number',
                    error: phoneError,
                    boxColor: AppColors.baseBlue,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Reference'),
                  ),
                  BrandTextBox(
                    name: 'Reference of bill',
                    controller: referenceController,
                    errorMessage: 'Invalid reference',
                    error: referenceError,
                    boxColor: AppColors.baseBlue,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Amount'),
                  ),
                  BrandTextBox(
                    name: 'Amount paid',
                    controller: amountController,
                    errorMessage: 'Invalid amount',
                    error: amountError,
                    boxColor: AppColors.baseBlue,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Center(
                    child: BrandButton(
                      color: AppColors.baseBlue,
                      title: 'Next',
                      titleColor: Colors.white,
                      function: () async {
                        //check phone
                        if (phoneController.text.isEmpty) {
                          setState(() {
                            phoneError = true;
                          });
                        } else if (phoneController.text.isNotEmpty) {
                          setState(() {
                            phoneError = false;
                          });
                        }
                        //check reference
                        if (referenceController.text.isEmpty) {
                          setState(() {
                            referenceError = true;
                          });
                        } else if (referenceController.text.isNotEmpty) {
                          referenceError = false;
                        }
                        //check payer
                        if (payerController.text.isEmpty) {
                          setState(() {
                            payerError = true;
                          });
                        } else if (payerController.text.isNotEmpty) {
                          setState(() {
                            payerError = false;
                          });
                        }
                        //check amount
                        if (amountController.text.isEmpty) {
                          setState(() {
                            amountError = true;
                          });
                        } else if (amountController.text.isNotEmpty) {
                          setState(() {
                            amountError = false;
                          });
                        }
                        if (payerController.text.isNotEmpty &&
                            phoneController.text.isNotEmpty &&
                            referenceController.text.isNotEmpty &&
                            amountController.text.isNotEmpty) {
                          setState(() {
                            payerError = false;
                            phoneError = false;
                            phoneError = false;
                            amountError = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckOut(
                                reference: referenceController.text,
                                amount: amountController.text,
                                payer: payerController.text,
                                payerContact: phoneController.text,
                                checkOutModel: widget.selectedModel,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
