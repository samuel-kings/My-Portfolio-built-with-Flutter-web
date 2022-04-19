import 'package:flutter/material.dart';

bool isTab(BuildContext context) {
  if (MediaQuery.of(context).size.width < 810 &&
      MediaQuery.of(context).size.width > 420) {
    return true;
  } else {
    return false;
  }
}

bool isMobile(BuildContext context) {
  if (MediaQuery.of(context).size.width < 600) {
    return true;
  } else {
    return false;
  }
}

bool isDesktop(BuildContext context) {
  if (MediaQuery.of(context).size.width > 810) {
    return true;
  } else {
    return false;
  } 
}
