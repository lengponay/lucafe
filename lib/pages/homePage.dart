// ignore_for_file: unused_field, deprecated_member_use, sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:western/components/eventsTile.dart';
import 'package:western/components/imageCarousel.dart';
import 'package:western/components/sectionTile.dart';
import 'dart:async';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  final Uri websiteUrl = Uri.parse('https://lifeun.edu.kh');

  Future<void> _launchURL() async {
    if (!await launch(websiteUrl.toString())) {
      throw 'Could not launch $websiteUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var defaultPadding = screenSize.width * 0.04;

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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenSize.height * 0.11),
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            flexibleSpace: Padding(
              padding: EdgeInsets.all(12.0),
              child: SizedBox(
                height: screenSize.height * 0.23,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.hello("Manika"),
                          style: GoogleFonts.assistant(
                            fontSize: screenSize.width * 0.07,
                            color: Color.fromARGB(255, 239, 239, 244),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Color.fromARGB(255, 239, 239, 244),
                            size: screenSize.width * 0.08,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/notification");
                          },
                        ),
                      ],
                    ),
                    Text(
                      AppLocalizations.of(context)!.whatDoYouWantToHaveToday,
                      style: GoogleFonts.assistant(
                        fontSize: screenSize.width * 0.04,
                        color: Color.fromARGB(255, 239, 239, 244),
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 50),
                sliver: SliverToBoxAdapter(
                  child: ImageCarousel(),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(18.0),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.recommendedDrink,
                        style: GoogleFonts.assistant(
                          fontSize: screenSize.width * 0.06,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 255, 249, 249),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionTile(),
              ),
              SliverPadding(
                padding: EdgeInsets.all(defaultPadding),
                sliver: SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.lifeUniversityFCEvents,
                          style: GoogleFonts.assistant(
                            fontSize: screenSize.width * 0.06,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 255, 249, 249),
                          ),
                        ),
                        SizedBox(width: 5),
                        TextButton(
                          child: Text(
                            AppLocalizations.of(context)!.seeMore,
                            style: TextStyle(
                              fontSize: screenSize.width * 0.035,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 44, 25, 88),
                            ),
                          ),
                          onPressed: _launchURL,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: EventsTile(),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                sliver: SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Color.fromARGB(255, 103, 165, 235),
          color: Color.fromARGB(232, 93, 159, 225),
          animationDuration: Duration(milliseconds: 300),
          items: <Widget>[
            Icon(
              Icons.home,
              color: Colors.white,
              size: screenSize.width * 0.09,
            ),
            Icon(
              Icons.menu_book_rounded,
              color: Colors.white,
              size: screenSize.width * 0.09,
            ),
            // Icon(
            //   Icons.shopping_cart,
            //   color: Colors.white,
            //   size: screenSize.width * 0.09,
            // ),
            Icon(
              Icons.list_alt_rounded,
              color: Colors.white,
              size: screenSize.width * 0.09,
            ),
            Icon(
              Icons.account_circle,
              color: Colors.white,
              size: screenSize.width * 0.09,
            ),
          ],
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
            switch (index) {
              case 0:
                // homepage
                break;
              case 1:
                Navigator.pushNamed(context, '/menu');
                break;
              case 2:
                Navigator.pushNamed(context, '/order');
                break;
              case 3:
                Navigator.pushNamed(context, '/account');
                break;
              // case 4:
              //   Navigator.pushNamed(context, '/account');
              //                 break;
              default:
                break;
            }
          },
        ),
      ),
    );
  }
}