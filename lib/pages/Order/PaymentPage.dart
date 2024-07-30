
// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:western/pages/Order/trackOrder.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class PaymentPage extends StatefulWidget {
  final List<Map<String, dynamic>> orderItems;

  const PaymentPage({required this.orderItems});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isCashSelected = false;
  bool isCreditCardSelected = false;

  double calculateItemTotalPrice(int index) {
    double price = double.parse(widget.orderItems[index]['price'].substring(1));
    return price * widget.orderItems[index]['quantity'];
  }

  double calculateTotal() {
    double total = 0;
    for (var item in widget.orderItems) {
      double price = double.parse(item['price'].substring(1));
      total += price * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    // Debug prints to check the order items
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            Color.fromARGB(255, 74, 140, 215),
            Color.fromARGB(255, 217, 222, 222)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
            iconSize: 35,
          ),
          title: Container(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              AppLocalizations.of(context)!.confirmOrder,
              style: GoogleFonts.assistant(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 2, left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  height: 4,
                ),
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    AppLocalizations.of(context)!.yourBillSummary,
                    style: GoogleFonts.assistant(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 5),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < widget.orderItems.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${widget.orderItems[i]['name']} x${widget.orderItems[i]['quantity']}",
                                  style: GoogleFonts.assistant(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "\$${calculateItemTotalPrice(i).toStringAsFixed(2)}",
                                  style: GoogleFonts.assistant(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: 10),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.subTotal,
                              style: GoogleFonts.assistant(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "\$${calculateTotal().toStringAsFixed(2)}",
                              style: GoogleFonts.assistant(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.discount,
                              style: GoogleFonts.assistant(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "-\$0.00", // Update this value as per the coupon discount logic
                              style: GoogleFonts.assistant(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.total,
                              style: GoogleFonts.assistant(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "\$${calculateTotal().toStringAsFixed(2)}",
                              style: GoogleFonts.assistant(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 7),
                  child: Text(
                    AppLocalizations.of(context)!.paymentMethod,
                    style: GoogleFonts.assistant(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.all(5),
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.attach_money_rounded,
                              color: Colors.black,
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            Text(
                              AppLocalizations.of(context)!.cashPayment,
                              style: GoogleFonts.assistant(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Spacer(),
                            Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                shape: CircleBorder(),
                                value: isCashSelected,
                                onChanged: (value) {
                                  setState(() {
                                    isCashSelected = value!;
                                    if (isCashSelected) {
                                      isCreditCardSelected = false;
                                    }
                                  });
                                },
                                activeColor: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.credit_card,
                              color: Colors.black,
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            Text(
                              AppLocalizations.of(context)!.creditCardOrBank,
                              style: GoogleFonts.assistant(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Spacer(),
                            Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                shape: CircleBorder(),
                                value: isCreditCardSelected,
                                onChanged: (value) {
                                  setState(() {
                                    isCreditCardSelected = value!;
                                    if (isCreditCardSelected) {
                                      isCashSelected = false;
                                    }
                                  });
                                },
                                activeColor: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 86, 80, 80)
                            .withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.pin_drop_sharp,
                              color: Color.fromARGB(255, 255, 250, 250),
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                AppLocalizations.of(context)!.pickUpAtLUCoffee,
                                style: GoogleFonts.assistant(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 250, 246, 246),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 220),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TrackOrder(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            textStyle: GoogleFonts.assistant(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.placeOrder,
                            style: GoogleFonts.assistant(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 51, 102, 190),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}