import 'dart:developer';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/appimages/appimages.dart' show AppImages;
import 'package:event_app/cores/manager/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
   Profile({super.key});

  late AppProvider provider;

  final List<String> languageList = [
    "English",
    "Arabic",
  ];

  final List<ThemeMode> themeList = [
    ThemeMode.light,
    ThemeMode.dark,
  ];

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppProvider>(context);
    var them=Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: provider.themeMode==ThemeMode.light? AppColors.primary:AppColors.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(65),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 32,
                ),
                child: Container(
                  height: 124,
                  width: 124,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(1000),
                      bottomLeft: Radius.circular(1000),
                      bottomRight: Radius.circular(1000),
                    ),
                    image: DecorationImage(
                      image: AssetImage(AppImages.route),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("john Safwat",style: them.textTheme.titleLarge?.copyWith(color: AppColors.white),),
                  Text("johnsafwat.route@\ngmail.com",style: them.textTheme.bodyMedium?.copyWith(color: AppColors.white),),
                ],
              ),


            ],
          ),

        ),
        SizedBox(height: 24,),
        Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 16),child:
          Text("Language",style: them.textTheme.bodyLarge?.copyWith(color: AppColors.black,fontWeight: FontWeight.bold),),),
        SizedBox(height: 12,),
        Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child:  CustomDropdown<String>(
          hintText: 'Select Language',
          items: languageList,
          initialItem: languageList[0],
          onChanged: (value) {
            log('changing value to: $value');
             context.setLocale(Locale(value! =="English" ? "en" : "ar"));

          },
          decoration: CustomDropdownDecoration(
            closedBorder: Border.all(
              color: AppColors.primary,
            ),
            closedSuffixIcon: Icon(Icons.arrow_drop_down,color: AppColors.primary,size: 30,),
            closedFillColor: Colors.transparent,
            headerStyle: them.textTheme.bodyMedium?.copyWith(color: AppColors.primary),
          ),


        ),),  SizedBox(height: 24,),
        Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 16),child:
          Text("Theme",style: them.textTheme.bodyLarge?.copyWith(color: AppColors.black,fontWeight: FontWeight.bold),),),
        SizedBox(height: 12,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primary,),
              ),
              child: DropdownButton(
                underline: const SizedBox(),
                isExpanded: true,
                value: provider.themeMode,
                icon: const Icon(
                  Icons.arrow_drop_down_rounded,
                  color: AppColors.primary,
                ),
                iconSize: 40,
                dropdownColor: provider.themeMode == ThemeMode.light
                    ? AppColors.white
                    : AppColors.black,
                style: them.textTheme.bodyMedium?.copyWith(color: AppColors.primary),
                items: const [
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text(
                      "Light",
                    ),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text("Dark"),
                  ),
                ],
                onChanged: (value) {
                  provider.changeTheme(value);
                },
              ),
          ),
        ),

      ],
    );
  }
}
