// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, library_private_types_in_public_api

// import 'package:cafe/pages/notificationPage.dart';
// import 'package:cafe/pages/order/orderItems.dart';
// import 'package:cafe/pages/order/order_provider.dart';
// import 'package:cafe/pages/order/paymentPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:western/pages/Order/order_provider.dart';

import '../notificationPage.dart';
import 'PaymentPage.dart';
import 'orderItems.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //* Update item quantity
  void updateQuantity(BuildContext context, int index, int newQuantity) {
    Provider.of<OrderProvider>(context, listen: false).updateQuantity(index,
        newQuantity); //* Using provider to listen to the item quantity which is updated
  }

  void deleteItem(BuildContext context, int index) {
    Provider.of<OrderProvider>(context, listen: false)
        .removeItem(index); //* Using provider to listen and remove an item
  }

  // Calculate item total price
  double calculateItemTotalPrice(Map<String, dynamic> item) {
    double price = double.parse(item['price'].substring(1));
    return price * item['quantity']; //* Calculate the item
  }

  // Calculate total amount
  double calculateTotal(List<Map<String, dynamic>> orderItems) {
    double total = 0;
    for (var item in orderItems) {
      double price = double.parse(item['price'].substring(1));
      total += price * item['quantity']; // * Sum the item total
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double appBarIconSize = screenSize.width * 0.075;
    final double appBarTitleSize = screenSize.width * 0.06;
    final double fontSizeMedium = screenSize.width * 0.05;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
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
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            iconSize: appBarIconSize,
          ),
          title: Center(
            child: Text(
              "Order Summary",
              style: GoogleFonts.assistant(
                color: Colors.white,
                fontSize: appBarTitleSize,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                color: Color.fromARGB(255, 239, 239, 244),
                iconSize: appBarIconSize,
                icon: Icon(Icons.notifications),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Notificationpage(),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Consumer<OrderProvider>(
          builder: (BuildContext context, OrderProvider orderProvider,
              Widget? child) {
            final orderItems = orderProvider.orderItems;
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.005,
                  horizontal: screenSize.width * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: screenSize.height * 0.01),
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                      height: screenSize.height * 0.002,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: screenSize.width * 0.01),
                      child: Text(
                        "Your order summary",
                        style: GoogleFonts.assistant(
                          fontSize: fontSizeMedium,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    for (int i = 0; i < orderItems.length; i++)
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: screenSize.height * 0.01),
                        child: OrderItems(
                          //* Item name,price,quantity at here
                          name: orderItems[i]['name'] ?? '',
                          price: orderItems[i]['price'] ?? 0.0,
                          image: "lib/images/drinks/${i + 1}.png",
                          quantity: orderItems[i]['quantity'] ?? 1,
                          onQuantityChanged: (newQuantity) =>
                              updateQuantity(context, i, newQuantity),
                          onDelete: () => deleteItem(context, i),
                        ),
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.grey[200]!],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText:
                                      "Remark your words here. e.g : sugar 70%",
                                  hintStyle: GoogleFonts.assistant(
                                    color: Color.fromARGB(255, 87, 82, 82),
                                  ),
                                  fillColor: Colors.grey[150],
                                  filled: true,
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 141, 184, 214),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                                style: GoogleFonts.assistant(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(31, 232, 225, 225),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bill Summary",
                            style: GoogleFonts.assistant(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Display each item in the bill summary
                          for (int i = 0; i < orderItems.length; i++)
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${orderItems[i]['name']} x${orderItems[i]['quantity']}",
                                      style: GoogleFonts.assistant(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "\$${calculateItemTotalPrice(orderItems[i]).toStringAsFixed(2)}",
                                      style: GoogleFonts.assistant(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          SizedBox(height: 5),
                          Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                          SizedBox(height: 5),
                          // Calculate and display subtotal
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: GoogleFonts.assistant(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "\$${calculateTotal(orderItems).toStringAsFixed(2)}",
                                style: GoogleFonts.assistant(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount",
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
                          // Calculate and display total
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: GoogleFonts.assistant(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$${calculateTotal(orderItems).toStringAsFixed(2)}",
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
                    Container(
                      padding: EdgeInsets.only(
                          left: 154,
                          top: 10), // *adjust the left side from 255 to 154
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(137, 247, 247, 247)
                                .withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 20,
                            offset: Offset(0, 14),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left:
                                    78), //* decrease the left side from 100 to 78
                            child: ElevatedButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PaymentPage(orderItems: orderItems),
                                  )),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                "Confirm Order",
                                style: GoogleFonts.assistant(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 51, 102, 190),
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
            );
          },
        ),
      ),
    );
  }
}