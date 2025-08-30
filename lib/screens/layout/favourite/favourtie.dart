import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/utils/firebase_firestore.dart';
import 'package:event_app/screens/layout/create_event/widget/eventdata.dart';
import 'package:event_app/screens/layout/widgets/eventitemcard.dart';
import 'package:flutter/material.dart';

class Favourtie extends StatelessWidget {
  const Favourtie({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(

             decoration: InputDecoration(
               prefixIcon: Icon(Icons.search,color: AppColors.primary,),
               hintText: "search for Events",
               border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
             ),
            ),
          ),
          SizedBox(height: 16,),
          StreamBuilder(
            stream: FirebaseFirestoreService.getFavouriteStreamEventList(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong"));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              List<EventData> eventDataList = snapshot.data!.docs.map((e) {
                return e.data();
              }).toList();

              return eventDataList.isEmpty?Center(child: Text("No Favourite Events",style: theme.textTheme.bodyLarge,),)    :Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: eventDataList.length,
                  itemBuilder: (context, index) {
                    return Eventitemcard(eventData: eventDataList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
