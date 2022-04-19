import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kings/routing/consts.dart';
import 'package:url_strategy/url_strategy.dart';
import 'routing/router.dart' as router;


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCDGGw1NaBI59bIewfXzPQzgcgUII9knlY",
          authDomain: "samuel-kings-portfolio-website.firebaseapp.com",
          projectId: "samuel-kings-portfolio-website",
          storageBucket: "samuel-kings-portfolio-website.appspot.com",
          messagingSenderId: "916645220692",
          appId: "1:916645220692:web:206300f3990c31ae92f8c1",
          measurementId: "G-0KYDY54ZV6"));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Samuel Kings',
      onGenerateRoute: router.generateRoute,
      initialRoute: homeScreenRoute,
      theme: ThemeData(
          scrollbarTheme: ScrollbarThemeData(
              thickness: MaterialStateProperty.all(5),
              radius: const Radius.circular(10),
              thumbColor: MaterialStateProperty.all(Colors.black),
              trackColor: MaterialStateProperty.all(Colors.white),
              showTrackOnHover: true),
          primaryColor: const Color(0xFF000000),
          textTheme: GoogleFonts.kuraleTextTheme(
            Theme.of(context).textTheme,
          ),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xFF000000)),
          // ignore: deprecated_member_use
          accentColor: const Color(0xFF000000)),
      
  );
}
