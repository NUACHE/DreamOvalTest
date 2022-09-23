import 'package:deip/core/theme/app_colors.dart';
import 'package:deip/core/widgets/brand_buttons.dart';
import 'package:deip/core/widgets/brand_dialogs.dart';
import 'package:deip/features/home/models/home_model.dart';
import 'package:deip/features/payment/services/payment_services.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckOut extends StatefulWidget {
  const CheckOut(
      {super.key,
      required this.reference,
      required this.amount,
      required this.payer,
      required this.payerContact,
      required this.checkOutModel});
  final String reference, amount, payer, payerContact;
  final HomeModel checkOutModel;

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Checkout',
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Billing',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 2.2.h,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          color: AppColors.baseBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(1.w),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.payer),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.payerContact),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.reference),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 0.1.h,
                color: Colors.black26,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Payment type',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 2.2.h,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
                  child: BrandButton(
                    color: Colors.black,
                    title: 'CASH',
                    titleColor: Colors.white,
                    function: () {},
                  ),
                ),
              ),
              Divider(
                thickness: 0.1.h,
                color: Colors.black26,
              ),
              //Order Summary
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Order Summary',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 2.2.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Service code',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 2.h,
                          ),
                        ),
                        const Spacer(),
                        Text('${widget.checkOutModel.serviceCode}'),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Comment',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 2.h,
                          ),
                        ),
                        const Spacer(),
                        const Text('Testing payments'),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.1.h,
                color: Colors.black26,
              ),
              //Subtotal
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Sub total',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 2.h,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'GHS  ${widget.amount}',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Tax',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 2.h,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'GHS 0',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.1.h,
                color: Colors.black26,
              ),
              //Total to pay
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Total to pay',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 2.h,
                      ),
                    ),
                    const Spacer(),
                    Text('GHS ${widget.amount}'),
                  ],
                ),
              ),
              //Final Step
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'This is the final step, after touching the Pay Now button, the payment will be done.',
                    style: TextStyle(
                        fontSize: 2.h,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              //Pay now
              Center(
                child: BrandButton(
                  color: AppColors.baseBlue,
                  title: 'Pay Now',
                  titleColor: Colors.white,
                  function: () async {
                    try {
                      showLoading(context);
                      var resp = await PaymentServices().makePayments(
                        serviceCode: widget.checkOutModel.serviceCode,
                        reference: widget.reference,
                        amount: widget.amount,
                        transactionId: '${widget.payer}-${widget.payerContact}',
                        payer: widget.payer,
                        payerContact: widget.payerContact,
                      );

                      debugPrint(resp.toString());
                      if (mounted) {}
                      Navigator.pop(context);
                      brandBottomSheet(context, height: 50.h);
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                ),
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
