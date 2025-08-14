import 'package:event_app/cores/app_routes/app_routes.dart';
import 'package:event_app/firebase_options.dart';
import 'package:event_app/screens/splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async{ {
  WidgetsFlutterBinding.ensureInitialized();
}
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  ,

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Splashscreen(),
      routes: ROUTES.routes,
      initialRoute: APPROUTES.splash,
      debugShowCheckedModeBanner: false,);
  }

  }
