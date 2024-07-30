// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:western/l10n/l10n.dart';

import 'package:western/pages/IntroPage/signUpPage.dart';
import 'package:western/pages/Order/order.dart';
import 'package:western/pages/Order/order_provider.dart';
import 'package:western/pages/account/languages.dart';
import 'package:western/pages/account/localeProvider.dart';
import 'package:western/pages/account/profile.dart';

import 'package:western/pages/Order/trackOrder.dart';
import 'package:western/pages/IntroPage/introPage.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'pages/IntroPage/singInPage.dart';
import 'pages/changePw.dart';
import 'pages/homePage.dart';
import 'pages/menu.dart';
import 'pages/notificationPage.dart';


void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => OrderProvider()),
      ChangeNotifierProvider(create: (_) => LocaleProvider()),
    ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();  
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: L10n.all,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: localeProvider.locale ?? _locale,
          initialRoute: '/', // Set the initial route to the IntroPage
          routes: {
            "/": (context) => IntroPage(), // Show IntroPage first
            '/home': (context) => HomePage(),
            '/menu': (context) => MenuPage(),
            '/cart': (context) => OrderPage(),
            '/notification': (context) => Notificationpage(),
            //"/order": (context) => PaymentPage(orderItems: [],),
            "/order": (context) => OrderPage(),
            //"/payment": (context) => PaymentPage(orderItems: [],),
            "/trackOrder": (context) => TrackOrder(),
            "/account": (context) => ProfilePage(),
            "/signIn": (context) => SignInPage(),
            "/signUp": (context) => SignUpPage(),
            "/changePw": (context) => ChangePassword(),
            "/languages": (context) => Languages(),
          },
        );
      },
    );
  }
}





// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:western/l10n/l10n.dart';
// import 'package:western/pages/IntroPage/signInPage.dart';
// import 'package:western/pages/IntroPage/signUpPage.dart';
// // import 'package:western/pages/Order/PaymentPage.dart';
// import 'package:western/pages/Order/order_provider.dart';
// import 'package:western/pages/account/languages.dart';
// import 'package:western/pages/account/profile.dart';
// import 'package:western/pages/accountWidget/changePw.dart';
// import 'package:western/pages/accountWidget/homePage.dart';
// import 'package:western/pages/accountWidget/menu.dart';
// import 'package:western/pages/accountWidget/notificationPage.dart';
// import 'package:western/pages/Order/order.dart';
// import 'package:flutter_gen/gen_l10n/app_localization.dart';
// import 'package:western/pages/Order/trackOrder.dart';
// import 'pages/IntroPage/introPage.dart';


// void main() {
//   runApp(
//     MultiProvider(providers: [
//       ChangeNotifierProvider(create: (_)=> OrderProvider()),
//        ChangeNotifierProvider(create: (_) => LocaleProvider()),
//     ],
//       child:MyApp(),
//     ),
//   );

// }

// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();

//   static void setLocale(BuildContext context, Locale newLocale){
//     _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();  
//     state?.setLocale(newLocale);
//   }
// }

// class _MyAppState extends State<MyApp> {

//   Locale? _locale;
//   setLocale(Locale locale){
//     setState(() {
//       _locale = locale;
//     });
//   }
//   @override
//   void initState() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//        supportedLocales: L10n.all,
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       locale: Locale("km"),
//       initialRoute: '/', // Set the initial route to the IntroPage
//       routes: {
//         "/": (context) => IntroPage(), // Show IntroPage first
//         '/home': (context) => HomePage(),
//         '/menu': (context) => MenuPage(),
//         '/cart': (context) => OrderPage(),
//         '/notification': (context) => Notificationpage(),
//         //"/order": (context) => PaymentPage(orderItems: [],),
//         "/order": (context) => OrderPage(),
//         //"/payment": (context) => PaymentPage(orderItems: [],),
//         "/trackOrder": (context) => TrackOrder(),
//         "/account": (context) => ProfilePage(),
//         "/signIn": (context) => SignInPage(),
//         "/signUp": (context) => SignUpPage(),
//         "/changePw": (context) => ChangePassword(),
//         "/languages": (context) => Languages(),
//       },
//     );
//   }
// }