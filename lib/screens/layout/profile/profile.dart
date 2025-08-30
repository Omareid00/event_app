import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/appimages/appimages.dart' show AppImages;
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {
  final List<String> languageList = [
    "English",
    "Arabic",
  ];
  final List<String> themeList = [
    "Light",
    "Dark",
  ];
  @override
  Widget build(BuildContext context) {
    var them=Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primary,
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
                    color: AppColors.white,
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
        Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child:  CustomDropdown<String>(
          hintText: 'Select Language',
          items: themeList,
          initialItem: themeList[0],
          onChanged: (value) {
            log('changing value to: $value');
          },
          decoration: CustomDropdownDecoration(
            closedBorder: Border.all(
              color: AppColors.primary,
            ),
            closedSuffixIcon: Icon(Icons.arrow_drop_down,color: AppColors.primary,size: 30,),
            closedFillColor: Colors.transparent,
            headerStyle: them.textTheme.bodyMedium?.copyWith(color: AppColors.primary),
          ),


        ),),

      ],
    );
  }
}
