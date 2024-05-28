import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:western/pages/order.dart';
// import 'package:western/widgets/navBar.dart';

class ItemsWidget3 extends StatelessWidget {
  @override

    // List of item names
    final List<String> itemNames = [
      "Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7","88", "ee", "kk", 
      "Iced Green Tea", "Passion Tea", "Oolong Tea", "Item 11", "Item 12", "Item 13", "Item 14"
    ];

    final List<String> description = [
      "Description 1", "Description 2", "Description 3", "Description 4", "Description 5", "Description 6", "Description 7","ds 88", "ds ee", " ds kk", 
      "Refreshing green tea served over ice",
      "A vibrant, tropical blend of hibiscus and fruit flavors",
      "Smooth oolong tea topped with a creamy milk foam",
      "Description 11", "Description 12", "Description 13", "Description 14"
    ];

    final List<String> price = [
      "Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7","88", "ee", "kk", 
      "\$1.50", "\$1.50", "\$1.75", "Item 11", "Item 12", "Item 13", "Item 14"
    ];

  Widget build ( BuildContext context){
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap : true,
      childAspectRatio:  0.70,

      children: [
        for(int i = 10; i < 13; i++)
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
                      width : 120,
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

                SizedBox( height : 20),
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


