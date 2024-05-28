// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

import '../components/eventsTile.dart';
import '../components/imageCarousel.dart';
import '../components/sectionTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  double defaultPadding = 16.0;

  //1 categories
  //2 recommended
  //3 events(life)

  //3-1 url

  final Uri websiteUrl = Uri.parse('https://lifeun.edu.kh');

  Future<void> _launchURL() async {
    if (!await launch(websiteUrl.toString())) {
      throw 'Could not launch $websiteUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 94, 134, 143),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 120.0,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              padding: EdgeInsets.only(left: 20, top: 50, right: 10), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lu café",
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 30,
                          color: Color.fromARGB(255, 239, 239, 244),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: Color.fromARGB(255, 239, 239, 244),
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context,"/notification");
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.pin_drop,
                        size : 20,
                        color : Colors.white38
                      ),
                      Text(
                        " lu café (near conference room)",
                        style : TextStyle(
                          color : Colors.white38,
                          fontSize : 15,
                          fontWeight : FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height : 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.timer,
                        size : 20,
                        color : Colors.white38
                      ),
                      Text(
                        " Preparing time 5-10mns",
                        style : TextStyle(
                          color : Colors.white38,
                          fontSize : 15,
                          fontWeight : FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 5), 
                  Divider(
                    color: Colors.white,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                  ),
                ],
              ),
            ),
          ),


          //divider
          // SliverPadding(
          //   padding: EdgeInsets.symmetric(vertical : 10,horizontal: 12),
          //   sliver: SliverToBoxAdapter(
          //     child: Divider(
          //       color : Colors.white,
          //       thickness : 2,
          //       indent: 0,
          //       endIndent: 0,

          //     ),
          //   ),
          // ),
        

          //1
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            sliver: SliverToBoxAdapter(
              child: ImageCarousel(),
            ),
          ),

          //2
          SliverPadding(
            padding: EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Text(
                    "Recommended Drinks",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 255, 249, 249),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //2-1
          SliverToBoxAdapter(
            child: SectionTile(),
          ),

          //3
          SliverPadding(
            padding: EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Life University & FC Events",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 255, 249, 249),
                    ),
                  ),
                  
                  TextButton(
                    child : Text(
                      "see more",
                      style : TextStyle(
                        fontSize : 15,
                        fontWeight : FontWeight.w400,
                        color : const Color.fromARGB(255, 50, 28, 101),
                      ),
                    ),
                    onPressed: _launchURL,
                    
                  ),
                ],
              ),
            ),
          ),

          //3-1
          SliverToBoxAdapter(
            child: EventsTile(),
          ),

          
          
        ],
      ),

      //-------------bottomNavigation
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color.fromARGB(255, 34, 131, 107),
        color: Color.fromARGB(255, 70, 93, 87),
        animationDuration: Duration(milliseconds: 300),
        items: <Widget>[
          Icon(
            Icons.home,
            color: Colors.white,
            size: 35,
          ),
          Icon(
            Icons.menu_book_rounded,
            color: Colors.white,
            size: 35,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 35,
          ),
          Icon(
            Icons.list_alt_rounded,
            color: Colors.white,
            size: 35,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 35,
          ),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
          switch (index) {
            case 0:
              //homepage
              break;
            case 1:
              Navigator.pushNamed(context, '/menu');
              break;
            case 2:
              // Navigator.pushNamed(context, '/cart');
              break;
            case 3:
              Navigator.pushNamed(context, '/order');
              break;
            case 4:
               Navigator.pushNamed(context, '/account');
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
/*
//1
class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  double defaultPadding = 12.0;
  int _currentPage = 0;

  final List<String> categories = [
    'lib/images/drinkItems/dt4.png',
    'lib/images/drinkItems/dt1.png',
    'lib/images/drinkItems/dt2.png',
    'lib/images/drinkItems/dt3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            itemCount: categories.length,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemBuilder: (context, index) => Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Adjust the value for your desired curvature
                  image: DecorationImage(
                    image: AssetImage(categories[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: defaultPadding,
            right: defaultPadding,
            child: Row(
              children: List.generate(
                categories.length,
                (index) => Padding(
                  padding: EdgeInsets.only(left: defaultPadding / 4),
                  child: IndicatorDot(isActive: index == _currentPage),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//2 --> sectionTile
class SectionTile extends StatefulWidget {
  const SectionTile({Key? key}) : super(key: key);

  @override
  State<SectionTile> createState() => _SectionTileState();
}

class _SectionTileState extends State<SectionTile> with AutomaticKeepAliveClientMixin {
  double defaultPadding = 15.0;
  int _currentPage = 0;
  late PageController _pageController;

  final List<String> recommended = [
    'lib/images/recommended/rc1.png',
    'lib/images/recommended/rc2.png',
    'lib/images/recommended/rc3.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < recommended.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: recommended.length,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemBuilder: (context, index) => Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(recommended[index]),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


//3 ---> eventsTile
class EventsTile extends StatefulWidget {
  const EventsTile({Key? key}) : super(key: key);

  @override
  State<EventsTile> createState() => _EventsTileState();
}

class _EventsTileState extends State<EventsTile> with AutomaticKeepAliveClientMixin {
  double defaultPadding = 15.0;
  int _currentPage = 0;
  late PageController _pageController;

  final List<String> events = [
    "lib/images/schoolEvent/se1.jpeg",
    "lib/images/schoolEvent/se2.png",
    "lib/images/schoolEvent/se3.jpg",
    "lib/images/schoolEvent/se4.jpg",
    "lib/images/schoolEvent/se5.jpg",

  ];


  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < events.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: events.length,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemBuilder: (context, index) => Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(events[index]),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


//Indicator Dot 1

class IndicatorDot extends StatelessWidget {
  final bool isActive;

  const IndicatorDot({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: isActive ? Color.fromARGB(255, 9, 110, 225) : Color.fromARGB(137, 0, 0, 0),
      ),
    );

  }
}
*/
