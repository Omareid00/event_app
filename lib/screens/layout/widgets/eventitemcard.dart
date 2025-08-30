import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/appimages/appimages.dart';
import 'package:event_app/screens/layout/create_event/widget/eventdata.dart';
import 'package:flutter/material.dart';

class Eventitemcard extends StatelessWidget {
  final EventData eventData;

  const Eventitemcard({super.key,required this.eventData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 201,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(image: AssetImage(eventData.eventCategoryImage), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.grey,

            ),
            child: Column(
              children: [
                Text(
                  eventData.selectDate.toString(),
                  style: TextStyle(color: AppColors.primary, fontSize: 20,
                      fontWeight: FontWeight.w900,height: 1),

          )
        ],
      ),
    ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,

            ),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(eventData.eventTitle,style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
                ),),
                Icon(eventData.isFavorite?
                Icons.favorite:Icons.favorite_border)
              ],
            ),
          )
    ],
      ),
    );
  }
}
