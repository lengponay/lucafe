
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:western/widgets/radio_switch_incre_decre.dart';

class ItemsWidget extends StatefulWidget {
  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

final List<String> options = [
  "Normal Sugar",
  "Less Sugar",
  "More Sugar",
  "No Sugar",
];

class _ItemsWidgetState extends State<ItemsWidget> {
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

  final List<String> description = [
    "equalPartsEspressoSteamMilkAndMilkFaom",
    "espressoWithChilledMilkOverIce",
    "espressonDilutedWithHotWaterForASmoothTaste",
    "espressoMixedWtihSteamedMilkAndChoc",
    "espresonWithSteamedMilkAndVanillaSyrup",
    "espressoWithSteamMilkAndSyrup",
    "espressonWithSteamedMilkAndHazenutSyrup",
  ];
  // Global variable for localization keys
  final List<String> itemNames = [
    "icedCappuccino",
    "icedLatte",
    "icedAmericano",
    "icedMocha",
    "icedVanillaLatte",
    "icedCaramel",
    "hazelnutLatte",
  ];

  final List<String> price = [
    "\$1.50",
    "\$1.75",
    "\$1.25",
    "\$2.00",
    "\$1.75",
    "\$1.75",
    "\$2.50",
  ];

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    // Mapping of item names to localization keys
    final Map<String, String> localizedItemNames = {
      "icedCappuccino": localizations.icedCappucino,
      "icedLatte": localizations.icedLatte,
      "icedAmericano": localizations.icedAmericano,
      "icedMocha": localizations.icedMocha,
      "icedVanillaLatte": localizations.icedVanillaLatte,
      "icedCaramel": localizations.icedCaramel,
      "hazelnutLatte": localizations.hazelnutLatte,
    };
    final Map<String, String> localizedDescription = {
      "equalPartsEspressoSteamMilkAndMilkFaom":
          localizations.equalPartsEspressoSteamMilkAndMilkFaom,
      "espressoWithChilledMilkOverIce":
          localizations.espressoWithChilledMilkOverIce,
      "espressonDilutedWithHotWaterForASmoothTaste":
          localizations.espressonDilutedWithHotWaterForASmoothTaste,
      "espressoMixedWtihSteamedMilkAndChoc":
          localizations.espressoMixedWtihSteamedMilkAndChoco,
      "espresonWithSteamedMilkAndVanillaSyrup":
          localizations.espresonWithSteamedMilkAndVanillaSyrup,
      "espressoWithSteamMilkAndSyrup":
          localizations.espressoWithSteamMilkAndSyrup,
      "espressonWithSteamedMilkAndHazenutSyrup":
          localizations.espressonWithSteamedMilkAndHazenutSyrup,
    };
    final Map<String, String> localizedSugar = {
      "normalSugar": localizations.normalSugar,
      "noSugar": localizations.noSugar,
      "lessSugar": localizations.lessSugar,
      "moreSugar": localizations.moreSugar,
    };

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.70,
      children: [
        for (int i = 0; i < itemNames.length; i++)
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