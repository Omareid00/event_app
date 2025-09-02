

import 'package:event_app/screens/layout/create_event/create_event.dart';
import 'package:event_app/screens/layout/create_event/edit_event/edit_event.dart';
import 'package:event_app/screens/layout/create_event/event_details/event_details.dart';
import 'package:event_app/screens/layout/create_event/widget/eventdata.dart';
import 'package:flutter/material.dart';

import '../../screens/Authentication/Forgetpassword/forgetpassword.dart';
import '../../screens/Authentication/Login/loginscreen.dart';
import '../../screens/Authentication/Register/register.dart';
import '../../screens/layout/layout_view.dart';
import '../../screens/onboarding/onboarding_view.dart';
import '../../screens/splashscreen/splashscreen.dart';

class APPROUTES{
  APPROUTES._();
  static const String splash="Splash";
  static const String OnboardingView="OnboardingView";
  static const String LoginScreen="LoginScreen";
  static const String Forgetpassword="Forgetpassword";
  static const String Register="Register";
  static const String LayoutView="LayoutView";
  static const String CreateEvent="CreateEvent";
  static const String EventDetails="EventDetails";
  static const String EditEvent="EditEvent";


}
class ROUTES{
  ROUTES._();


  static Map<String, Widget Function(BuildContext)> routes ={
    APPROUTES.splash :(_)=> Splashscreen(),
    APPROUTES.OnboardingView :(_)=> OnboardingView(),
    APPROUTES.LoginScreen :(_)=> LoginScreen(),
    APPROUTES.Forgetpassword :(_)=> Forgetpassword(),
    APPROUTES.Register :(_)=> Register(),
    APPROUTES.LayoutView :(_)=> LayoutView(),
    APPROUTES.CreateEvent :(_)=> CreateEvent(),
    APPROUTES.EventDetails :(_) => EventDetails(),
    APPROUTES.EditEvent :(_) => EditEvent(),

  };
}