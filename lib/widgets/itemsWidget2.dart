// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, override_on_non_overriding_member

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'radio_switch_incre_decre.dart';
// import 'package:western/widgets/navBar.dart';

class ItemsWidget2 extends StatefulWidget {
  @override
  State<ItemsWidget2> createState() => _ItemsWidget2State();
}

final List<String> options = [
  "Normal Sugar",
  "Less Sugar",
  "More Sugar",
  "No Sugar",
];

class _ItemsWidget2State extends State<ItemsWidget2> {
  @override
  String currentOption = options[0];

  PersistentBottomSheetController customShowBottomSheet(
      BuildContext context, int i) {
    return showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetContent(
          itemName: itemNames[i],
          price: price[i],
          currentOption: currentOption,
          onOptionChanged: (value) {
            setState(() {
              currentOption = value;
            });
          },
        );
      },
    );
  }

  // List of item names
  final List<String> itemNames = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Hot Latte",
    "Hot Vanilla Latte",
    "Hot Americano",
    "Item 11"
  ];

  final List<String> description = [
    "Description 1",
    "Description 2",
    "Description 3",
    "Description 4",
    "Description 5",
    "Description 6",
    "Description 7",
    "Espresso with steamed milk",
    "steamed milk, Vanilla syrup",
    "Espresso with hot water",
    "Description 11"
  ];

  final List<String> price = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "\$1.00",
    "\$1.00",
    "\$1.50",
    "Item 11"
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.70,
      children: [
        for (int i = 7; i < 10; i++)
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black12,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'singleItemPage');
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset(
                        "lib/images/drinks/${i + 1}.png",
                        width: 130,
                        height: 130,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      itemNames[i],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    description[i],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        margin: EdgeInsets.symmetric(vertical: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 106, 132, 173),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        height: 37,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 2),
                          child: Text(
                            price[i],
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        onPressed: () {
                          customShowBottomSheet(context, i);
                        },
                        icon: const Icon(Icons.add),
                        style: IconButton.styleFrom(
                          backgroundColor:Color.fromARGB(145, 200, 209, 225),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}