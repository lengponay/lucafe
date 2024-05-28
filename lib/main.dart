import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:western/pages/PaymentPage.dart';
import 'package:western/pages/menu.dart';
// import 'package:western/pages/notificationDetailPage.dart';
import 'package:western/pages/notificationPage.dart';
import 'package:western/pages/order.dart';
import 'package:western/pages/trackOrder.dart';
import 'pages/homePage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  void initState(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }
    @override
    Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes : {
          "/" : (context) => HomePage(),
          '/menu' : (context) => MenuPage(),
          '/notification' : (context) => Notificationpage(),
          "/order" :(context) => OrderPage(),
          "/Payment" :(context) => PaymentPage(orderItems: [],),
          "/trackOrder" : (context) => TrackOrder(),
        },
      );
    }
}