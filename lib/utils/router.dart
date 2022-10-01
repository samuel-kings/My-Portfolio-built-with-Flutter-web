import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import '../screens/404.dart';
import '../screens/about.dart';
import '../screens/contact.dart';
import '../screens/home.dart';
import '../screens/pricing.dart';
import '../screens/projects.dart';

const String homeScreenRoute = '/';
const String aboutScreenRoute = '/about';
const String projectsScreenRoute = '/projects';
const String pricingScreenRoute = '/pricing';
const String contactScreenRoute = '/contact';
const String notFound = '404 - Not Found';

final routes = RouteMap(
    onUnknownRoute: (route) {
      return buildPage(name: notFound, child: NotFoundPage(name: route));
    },
    routes: {
      homeScreenRoute: (route) => buildPage(name: 'Samuel Kings - My Portfolio', child: const HomeScreen()),
      aboutScreenRoute: (route) => buildPage(name: 'About', child: const AboutMeScreen()),
      projectsScreenRoute: (route) => buildPage(name: 'Projects', child: const ProjectsScreen()),
      pricingScreenRoute: (route) => buildPage(name: 'Pricing', child: const PricingScreen()),
      contactScreenRoute: (route) => buildPage(name: 'Contact', child: const ContactScreen()),
    });

MaterialPage buildPage({required String name, required Widget child}) {
  String name_ = name.toLowerCase();
  
  return MaterialPage(
    name: name_,
    key: ValueKey(name_),
    child: Title(
      title: name,
      color: Colors.white,
      child: child,
    ),
  );
}
