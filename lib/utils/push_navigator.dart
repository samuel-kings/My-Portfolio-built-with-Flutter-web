import 'package:routemaster/routemaster.dart';
import 'package:flutter/material.dart';

pushNavigator(BuildContext context, String route) {
  Routemaster.of(context).push(route);
}