import 'package:flutter/material.dart';
import 'package:kings/routing/consts.dart';
import 'package:kings/screens/404.dart';
import 'package:kings/screens/about.dart';
import 'package:kings/screens/contact.dart';
import 'package:kings/screens/home.dart';
import 'package:kings/screens/pricing.dart';
import 'package:kings/screens/projects.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case aboutScreenRoute:
      return MaterialPageRoute(builder: (context) => const AboutMeScreen());
      case projectsScreenRoute:
      return MaterialPageRoute(builder: (context) => const ProjectsScreen());
      case pricingScreenRoute:
      return MaterialPageRoute(builder: (context) => const PricingScreen());
      case contactScreenRoute:
      return MaterialPageRoute(builder: (context) => const ContactScreen());
    default:
      return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name!));
  }
}