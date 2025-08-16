import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/screens/layout/categories_data.dart';
import 'package:flutter/material.dart';

import 'create_event_categories.dart';

class CreateEventTabitem extends StatelessWidget {
  final CreateEventCategories eventcreateData;
  final bool isSelected;
  const CreateEventTabitem({super.key, required this.eventcreateData, required this.isSelected});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 10,
        bottom: 5,
      ),
      decoration: BoxDecoration(

        color: isSelected ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.primary,
        ),
      ),
      child: Row(
        children: [
          Icon(eventcreateData.categoryIcon,
            color: isSelected ? AppColors.white : AppColors.primary,
          ),

          Text(eventcreateData.categoryTitle,style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),),
        ],
      ),
    );
  }
}
