import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/screens/layout/categories_data.dart';
import 'package:flutter/material.dart';

class Tabitemwidget extends StatelessWidget {
  final CategoriesData categoriesData ;
  final bool isSelected;
  const Tabitemwidget({super.key, required this.categoriesData, required this.isSelected});

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

        color: isSelected ? AppColors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isSelected ? AppColors.white : AppColors.white,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.book_outlined,
              color: isSelected ? AppColors.primary : AppColors.white,
              ),

          Text(categoriesData.categoryTitle,style: TextStyle(
              color: isSelected ? AppColors.primary : AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),),
        ],
      ),
    );
  }
}
