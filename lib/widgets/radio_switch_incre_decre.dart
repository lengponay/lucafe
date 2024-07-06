// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:western/pages/Order/order_provider.dart';

import 'itemsWidget.dart';

class BottomSheetContent extends StatefulWidget {
  final String itemName;
  final String price;
  final String currentOption;
  final ValueChanged<String> onOptionChanged;

  BottomSheetContent({
    required this.itemName,
    required this.price,
    required this.currentOption,
    required this.onOptionChanged,
  });

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  late String currentOption;
  int quantityCount = 1;
  @override

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 550,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.itemName,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ],
          ),
          SizedBox(height: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sugar Level",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Optional (+\$0.00)",
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 114, 112, 112),
                    ),
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  'Normal Sugar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                leading: Radio<String>(
                    value: options[0],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        //* Include setState
                        currentOption =value!; //* if the current option is not equal with the value
                      });
                      widget.onOptionChanged(value!);
                    }),
              ),
              ListTile(
                title: Text(
                  'Less Sweet',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                leading: Radio<String>(
                  value: options[1],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption =
                          value!; //* if the currentOPtions isn't equal to the value
                    });
                    widget.onOptionChanged(
                        value!); //* then the option will change to the value which isn't equal with the currentOptions
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'More Sweet',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                leading: Radio<String>(
                    value: options[2],
                    groupValue:
                        currentOption, //* Change from widget.currentOption to currentOption
                    onChanged: (value) {
                      setState(() {
                        currentOption = value!;
                      });
                      widget.onOptionChanged(value!);
                    }),
              ),
              ListTile(
                title: Text(
                  'No Sweet',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                leading: Radio<String>(
                    value: options[3],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value!;
                      });
                      widget.onOptionChanged(value!);
                    }),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.price,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    _buildIconButton(
                      icon: Icons.remove_circle_outline,
                      onPressed: decrementQuantity,
                      color: Color.fromARGB(255, 220, 87, 77),
                    ),
                    SizedBox(width : 10),
                    Container(
                      width: 35,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(190, 124, 190, 236),
                        border: Border.all(
                          color: Color.fromARGB(255, 142, 160, 193),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '$quantityCount',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 49, 50, 51),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width : 10),
                    _buildIconButton(
                      icon: Icons.add_box_outlined,
                      onPressed: incrementQuantity,
                      color: Color.fromARGB(255, 41, 118, 44),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Center(
            child: ElevatedButton(
              onPressed: () {
                addToCart();
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: Color.fromARGB(255, 74, 140, 215),
              ),
              child: Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

 @override
  void initState() {
    super.initState();
    currentOption = widget.currentOption;
  }

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 1) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    Map<String, dynamic> item = {
      //* Store an item name, price, quantity, quality
      'name': widget.itemName,
      'price': widget.price,
      'quantity': quantityCount,
      'quality': currentOption,
    };
    Provider.of<OrderProvider>(context, listen: false)
        .addItem(item); //* Using provider to add an item to the order page
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black54.withOpacity(0.6),
        insetPadding: EdgeInsets.only(top: 20),
        title: Text(
          "Successfully added to cart",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.15),
      ),
      child: IconButton(
        icon: Icon(icon),
        color: color,
        iconSize: 24,
        onPressed: onPressed,
      ),
    );
  }
}