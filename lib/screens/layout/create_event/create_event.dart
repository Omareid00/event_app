import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/appimages/appimages.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        const Text(
          textAlign: TextAlign.center,
          "Create Event",style:
          TextStyle(

            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: AppColors.primary
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(AppImages.Sport,fit: BoxFit.cover,)),
            SizedBox(height: 15,),
            DefaultTabController(
              length: categories.length,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                padding: EdgeInsets.zero,
                indicatorColor: AppColors.white,
                indicator: BoxDecoration(),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 4),
                dividerColor: Colors.transparent,
                labelPadding: EdgeInsets.symmetric(horizontal: 4),
                onTap: (index) {
                  setState(() {
                    selectedTabIndex = index;
                  });
                },

                tabs: categories.map((categoriesData) {
                  return Tabitemwidget(
                    isSelected:
                    selectedTabIndex ==
                        categories.indexOf(categoriesData),
                    categoriesData: categoriesData,
                  );
                }).toList(),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
