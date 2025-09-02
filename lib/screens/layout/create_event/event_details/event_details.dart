import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/appimages/appimages.dart';
import 'package:event_app/cores/utils/firebase_auth_util.dart';
import 'package:event_app/cores/utils/firebase_firestore.dart';
import 'package:event_app/screens/layout/create_event/widget/date_time_card.dart';
import 'package:event_app/screens/layout/create_event/widget/eventdata.dart';
import 'package:event_app/screens/layout/create_event/widget/location_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart' ;

import '../../../../cores/app_routes/app_routes.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var eventData = ModalRoute.of(context)?.settings.arguments as EventData;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primary,
        centerTitle: true,
        title: Text("Event Details", style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.primary),),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(APPROUTES.EditEvent,arguments: eventData);
          }, icon: Icon(Icons.edit,color: AppColors.primary,),),
          IconButton(onPressed: (){
            EasyLoading.show();
            FirebaseFirestoreService.deleteEvent(eventData: eventData);
            EasyLoading.showSuccess("Event Deleted Successfully");
            Navigator.pop(context);

          }, icon: Icon(Icons.delete,color: Colors.red,),)
        ],
      ),
      body: ListView(
        children: [
        Container(
        height: 201,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(image: AssetImage(eventData.eventCategoryImage), fit: BoxFit.cover),
        ),),
          SizedBox(height: 16,),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16),
            child: Text(eventData.eventTitle,style: theme.textTheme.titleLarge?.copyWith(color: AppColors.primary),),
          ),
          SizedBox(height: 16,),
          DateTimeCard(dateTime: eventData.selectDate),
          SizedBox(height: 16,),
          LocationCard(),
          Image.asset(AppImages.locimg),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("Description"),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(eventData.eventDescription),
          ),



        ],
      ),
    );
  }

}
