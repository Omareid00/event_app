import 'package:event_app/cores/app_routes/app_routes.dart';
import 'package:event_app/cores/app_theme/app_theme.dart';
import 'package:event_app/cores/manager/app_provider.dart';
import 'package:event_app/firebase_options.dart';
import 'package:event_app/screens/splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()async{ {
  WidgetsFlutterBinding.ensureInitialized();
}
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      builder: (context, child) {
        var provider =Provider.of<AppProvider>(context);
        return MaterialApp(home: Splashscreen(),
          themeMode: provider.themeMode,
          theme: AppTheme.lightTheme,
          routes: ROUTES.routes,
          initialRoute: APPROUTES.splash,
          debugShowCheckedModeBanner: false,);

      },

      );
  }
}
