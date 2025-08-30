import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_app/cores/app_routes/app_routes.dart';
import 'package:event_app/cores/appicons/appicons.dart';
import 'package:event_app/cores/localization/custome_tr.dart';
import 'package:event_app/cores/localization/custome_trans.dart';
import 'package:event_app/cores/manager/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../cores/appcolors/appcolors.dart';
import '../../cores/appimages/appimages.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.eventlyTop),
                    SizedBox(height: 30),
                    Image.asset(AppImages.introPage),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Personalize Your Experience",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Choose your preferred theme and language to \n get started with a comfortable, tailored \n experience that suits your style.",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Language",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                ),
                              ),
                              Spacer(),
                              AnimatedToggleSwitch<String>.rolling(
                                current: context.locale.languageCode, // get current language
                                values: const ["en", "ar"],
                                height: 40,
                                indicatorSize: const Size(40, 40),
                                onChanged: (langCode) {
                                  context.setLocale(Locale(langCode));
                                  },
                                iconList: [
                                 Image.asset(Appicons.er),
                                 Image.asset(Appicons.eg),


                                ],
                                style: ToggleStyle(
                                  backgroundColor: Colors.transparent,
                                  indicatorColor: AppColors.primary,
                                  borderColor: AppColors.primary,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Theme",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                ),
                              ),
                              Spacer(),
                              AnimatedToggleSwitch<ThemeMode>.rolling(
                                  current: provider.themeMode,
                                  values: const [ThemeMode.light, ThemeMode.dark],
                                  onChanged: (value) {
                                    provider.changeTheme(value! == ThemeMode.dark ? ThemeMode.dark : ThemeMode.light);
                                  },
                                iconList: [
                                  Icon(Icons.light_mode,
                                  color:AppColors.white ,),
                                  Icon(Icons.dark_mode),
                                ],
                                height: 40,
                                indicatorSize: Size(40, 40),
                                style: ToggleStyle(
                                  backgroundColor: Colors.transparent,
                                  borderColor: AppColors.primary,
                                  indicatorColor: AppColors.primary,
                                ),
                                onTap: (props) {},


                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                var prefs =
                                    await SharedPreferences.getInstance();
                                var onboarding =
                                    prefs.getBool("onboarding") ?? false;
                                if (onboarding) {
                                  provider.setOnTime();
                                  Navigator.pushReplacementNamed(
                                      context, APPROUTES.LoginScreen);
                                } else {
                                  Navigator.pushReplacementNamed(
                                      context, APPROUTES.OnboardingView);
                                }
                              },


                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                foregroundColor: AppColors.white,
                                backgroundColor: AppColors.primary,
                                fixedSize: Size(20, 55),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child:
                              Text(CustomeTrans.letsStart.customTr),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
