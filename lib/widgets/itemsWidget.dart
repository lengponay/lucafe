import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:western/pages/order.dart';
// import 'package:western/widgets/navBar.dart';

class ItemsWidget extends StatelessWidget {
  @override

  // List of item names
    final List<String> itemNames = [
      "Iced Cappucino",
      "Iced Latte",
      "Iced Americano",
      "Iced Mocha",
      "Iced Vanilla Latte",
      "Iced Caramel",
      "HazeLnut Latte",

    ];

    final List<String> description = [
      "Equal parts espresso, steamed milk, and milk foam",
      "Espresso with chilled milk over ice",
      "Espresso diluted with hot water for a smooth taste",
      "Espresso mixed with steamed milk and choco",
      "Espresso with steamed milk and vanilla syrup",
      "Espresso with steamed milk and syrup",
      "Espresso with steamed milk and  hazelnut syrup",
    ];

    final List<String> price = [
      "\$1.60",
      "\$1.75",
      "\$1.25",
      "\$2.0",
      "\$1.75",
      "\$1.75",
      "\$2.5",
    ];

  Widget build ( BuildContext context){
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap : true,
      childAspectRatio:  0.70,

      children: [
        for(int i = 0; i < 7 ; i++)
          Container(
            padding : EdgeInsets.symmetric (vertical : 5, horizontal : 10),
            margin : EdgeInsets.symmetric(vertical : 7, horizontal : 15),
            decoration : BoxDecoration(
              borderRadius: BorderRadius.circular (20),
              color : Colors.black12,
              boxShadow: [
                BoxShadow(
                  color : Colors.black.withOpacity(0.3,),
                  spreadRadius : 1,
                  blurRadius : 8,
                ),
                
              ],
            ),
            child : Column(
              children: [
                //1
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/order', // Navigate to OrderPage
                      arguments: {
                        'name': itemNames[i],
                        'description': description[i],
                        'price': price[i],
                      },
                    );
                  },
                  child : Container(
                    margin : EdgeInsets.all(10),
                    child : Image.asset(
                      "lib/images/${i + 1}.png",
                      width : 130,
                      height : 130,
                      fit : BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding : EdgeInsets.only(bottom : 2),
                  child : Container(
                    alignment : Alignment.centerLeft,
                    child : Text(
                      itemNames[i],
                      style : TextStyle(
                        fontSize : 18,
                        fontWeight : FontWeight.bold,
                        color : Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${description[i]}", 
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
                    mainAxisAlignment : MainAxisAlignment.spaceBetween, // To make the row fit its content
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 95, 112, 142),
                          borderRadius: BorderRadius.circular(18), // Circular shape with radius 18
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                              spreadRadius: 2, // Spread radius
                              blurRadius: 5, // Blur radius
                              offset: Offset(0, 3), // Offset of the shadow
                            ),
                          ],
                        ),
                        height: 35,
                        width: 55,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 2),
                          child: Text(
                            "${price[i]}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8), // Add some space between the container and the icon
                      Container(
                        padding : EdgeInsets.all(5),
                        decoration : BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color : Color.fromARGB(255, 113, 128, 152),
                        ),
                        child: Icon(
                          CupertinoIcons.add, // Replace with the desired icon
                          color: Colors.white,
                          size: 24,
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


