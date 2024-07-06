
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:western/pages/Order/order_provider.dart';

// import 'itemsWidget5.dart';

class BottomSheetContent2 extends StatefulWidget {
  final String itemName;
  final String price;
  final String currentOption;
  final ValueChanged<String> onOptionChanged;

  BottomSheetContent2({
    required this.itemName,
    required this.price,
    required this.currentOption,
    required this.onOptionChanged,
  });

  @override
  State<BottomSheetContent2> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent2> {
  late String currentOption;
  int quantityCount = 1;

  @override
  void initState() {
    super.initState();
    currentOption = widget.currentOption;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 350,
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
                    "Optional (+\$0.00)",
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 114, 112, 112),
                    ),
                  ),
                ],
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
      'name': widget.itemName,
      'price': widget.price,
      'quantity': quantityCount,
      'quality': currentOption,
    };
    Provider.of<OrderProvider>(context, listen: false).addItem(item);
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
