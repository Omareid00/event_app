import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_app/cores/app_routes/app_routes.dart';
import 'package:event_app/cores/app_theme/app_theme.dart';
import 'package:event_app/cores/manager/app_provider.dart';
import 'package:event_app/cores/services/config.dart';
import 'package:event_app/firebase_options.dart';
import 'package:event_app/screens/splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("en"),
        Locale("ar"),
      ],
      fallbackLocale: const Locale("en"),
      useOnlyLangCode: true,
      path: "assets/langs",
      startLocale: const Locale("en"),
      child: const MyApp(),
    ),
  );

  configLoadindg();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider()..getTheme()..getLang(),
      builder: (context, child) {
        var provider = Provider.of<AppProvider>(context);

        return MaterialApp(
          home: const Splashscreen(),
          themeMode: provider.themeMode, // 👈 listens to provider
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routes: ROUTES.routes,
          initialRoute: APPROUTES.splash,
          builder: EasyLoading.init(
            builder: BotToastInit(),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
