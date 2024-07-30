// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:western/widgets/itemsWidget.dart';
import 'package:western/widgets/itemsWidget2.dart';
import 'package:western/widgets/itemsWidget3.dart';
import 'package:western/widgets/itemsWidget4.dart';
import 'package:western/widgets/itemsWidget5.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

// import 'package:gradients/gradients.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: Container(
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
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/home");
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.menu,////////////////// menu
                          style: GoogleFonts.assistant(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/cart");
                          },
                          child: Icon(
                            Icons.shopping_cart_checkout_rounded,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          AppLocalizations.of(context)!.openFromSevenAMtoFivePM,
                          style: GoogleFonts.assistant(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.directions_walk,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          AppLocalizations.of(context)!.selfPickUpAtTheLUCoffee,
                          style: GoogleFonts.assistant(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_rate_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          AppLocalizations.of(context)!.rating,//// star rating
                          style: GoogleFonts.assistant(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  TabBar(
                    isScrollable: true,
                    labelColor: Color.fromARGB(255, 255, 249, 249),
                    // indicatorColor: Colors.blue,
                    indicator: BoxDecoration(),
                    labelStyle: GoogleFonts.assistant(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    labelPadding: EdgeInsets.symmetric(horizontal: 20),
                    tabs: [
                      Tab(text: AppLocalizations.of(context)!.coldCoffee),
                      Tab(text: AppLocalizations.of(context)!.hotCoffee),
                      Tab(text: AppLocalizations.of(context)!.tea),
                      Tab(text: AppLocalizations.of(context)!.milkTea),
                      Tab(text: AppLocalizations.of(context)!.softDrink),
                    ],
                  ),
                  Flexible(
                    child: TabBarView(
                      children: [
                        ItemsWidget(),
                        ItemsWidget2(),
                        ItemsWidget3(),
                        ItemsWidget4(),
                        ItemsWidget5(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}