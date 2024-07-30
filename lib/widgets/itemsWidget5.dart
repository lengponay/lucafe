// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, override_on_non_overriding_member

// import 'package:flutter/cupertino.dart';
// import 'package:western/widgets/radio_switch_incre_decre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'radio_switch_incre_decre2.dart';
// import 'package:western/widgets/navBar.dart';

class ItemsWidget5 extends StatefulWidget {
  @override
  State<ItemsWidget5> createState() => _ItemsWidget5State();
}

final List<String> options = [
  "Normal Sugar",
  "Less Sugar",
  "More Sugar",
  "No Sugar",
];

class _ItemsWidget5State extends State<ItemsWidget5> {
  String currentOption = options[0];

  PersistentBottomSheetController customShowBottomSheet(
      BuildContext context, int i) {
    return showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetContent2(
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
    "Item 8",
    "Item 9",
    "Item 10",
    "Item 11",
    "Item 12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "olatte",
    "sprite",
    "pepsi",
    "coke",
    "age",
  ];

  final List<String> description = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
    "Item 10",
    "Item 11",
    "Item 12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "specialOlattePlusTheVitaminsInside",
    "spriteBoostYourMoodAndHapptWithSprite",
    "withPepsiEverythingIsYummyAndFun",
    "cokeMakerYourFoodMoreDeliciousAndMoreEnjoyable",
    "22",
  ];

  final List<String> price = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
    "Item 10",
    "Item 11",
    "Item 12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "\$0.65",
    "\$0.65",
    "\$0.65",
    "\$1.00",
    "22",
  ];

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    final Map<String, String> localizedItemNames = {
      "Item 1": localizations.age, // just add it for forloop
      "Item 2": localizations.age, // just add it for forloop
      "Item 3": localizations.age, // just add it for forloop
      "Item 4": localizations.age, // just add it for forloop
      "Item 5": localizations.age, // just add it for forloop
      "Item 6": localizations.age, // just add it for forloop
      "Item 7": localizations.age, // just add it for forloop
      "Item 8": localizations.age, // just add it for forloop
      "Item 9": localizations.age, // just add it for forloop
      "Item 10": localizations.age, // just add it for forloop
      "Item 11": localizations.age, // just add it for forloop
      "Item 12": localizations.age, // just add it for forloop
      "13": localizations.age, // just add it for forloop
      "14": localizations.age, // just add it for forloop
      "15": localizations.age, // just add it for forloop
      "16": localizations.age, // just add it for forloop
      "17": localizations.age,
      "olatte": localizations.olatte,
      "sprite": localizations.sprite,
      "pepsi": localizations.pepsi,
      "coke": localizations.coke,
      "age": localizations.age,
    };
    final Map<String, String> localizedDescription = {
      "Item 1": localizations.age,
      "Item 2": localizations.age,
      "Item 3": localizations.age,
      "Item 4": localizations.age,
      "Item 5": localizations.age,
      "Item 6": localizations.age,
      "Item 7": localizations.age,
      "Item 8": localizations.age,
      "Item 9": localizations.age,
      "Item 10": localizations.age,
      "Item 11": localizations.age,
      "Item 12": localizations.age,
      "13": localizations.age,
      "14": localizations.age,
      "15": localizations.age,
      "16": localizations.age,
      "17": localizations.age,
      "specialOlattePlusTheVitaminsInside":
          localizations.specialOlattePlusTheVitaminsInside,
      "spriteBoostYourMoodAndHapptWithSprite":
          localizations.spriteBoostYourMoodAndHapptWithSprite,
      "withPepsiEverythingIsYummyAndFun":
          localizations.withPepsiEverythingIsYummyAndFun,
      "cokeMakerYourFoodMoreDeliciousAndMoreEnjoyable":
          localizations.cokeMakerYourFoodMoreDeliciousAndMoreEnjoyable,
      "22": localizations.age,
    };
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.70,
      children: [
        for (int i = 17; i < 21; i++)
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
                      localizedItemNames[itemNames[i]]!,
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
                    localizedDescription[description[i]]!,
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
                          color: Color.fromARGB(255, 89, 111, 149),
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
                          backgroundColor: Color.fromARGB(145, 200, 209, 225),
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