import 'package:event_app/screens/layout/favourite/favourtie.dart';
import 'package:event_app/screens/layout/home/home.dart';
import 'package:event_app/screens/layout/map/map.dart';
import 'package:event_app/screens/layout/profile/profile.dart';
import 'package:flutter/cupertino.dart';

abstract class Constants {
  static List<Widget> screens=[
    Home(),
    Map_View(),
    Favourtie(),
    Profile(),

  ];
}

