import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageNavigator {
  navigateWithoutAnimation(Widget newPage, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => newPage));
  }
}
