import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/appimages/appimages.dart';
import 'package:event_app/screens/layout/categories_data.dart';
import 'package:event_app/screens/layout/create_event/widget/create_event_categories.dart';
import 'package:event_app/screens/layout/create_event/widget/create_event_tabitem.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int selectedTabIndex = 0;
  List<CreateEventCategories> createEventCategories = [
    CreateEventCategories(
      categoryTitle: "Book club",
      categoryImg: AppImages.book,
      categoryIcon: Icons.book,
    ),
    CreateEventCategories(
      categoryTitle: "Sport",
      categoryImg: AppImages.Sport,
      categoryIcon: Icons.directions_bike_outlined,
    ),
    CreateEventCategories(
      categoryTitle: "Birthday",
      categoryImg: AppImages.birthday,
      categoryIcon: Icons.cake,
    ),
    CreateEventCategories(
      categoryTitle: "meeting",
      categoryImg: AppImages.meeting,
      categoryIcon: Icons.meeting_room_sharp,
    ),
    CreateEventCategories(
      categoryTitle: "gaming",
      categoryImg: AppImages.gaming,
      categoryIcon: Icons.ice_skating_outlined,
    ),
    CreateEventCategories(
      categoryTitle: "Eating",
      categoryImg: AppImages.eating,
      categoryIcon: Icons.ice_skating_outlined,
    ),
    CreateEventCategories(
      categoryTitle: "Holiday",
      categoryImg: AppImages.holiday,
      categoryIcon: Icons.ice_skating_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.center,
          "Create Event",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: AppColors.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  createEventCategories[selectedTabIndex].categoryImg,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 15),
              DefaultTabController(
                length: createEventCategories.length,
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
        
                  tabs: createEventCategories.map((categoriesData) {
                    return CreateEventTabitem(
                      isSelected:
                          selectedTabIndex ==
                          createEventCategories.indexOf(categoriesData),
                      eventcreateData: categoriesData,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Title",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit_note_outlined),
                  hintText: "Event Title",
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Description",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              TextFormField(
                maxLines: 4,
        
                decoration: InputDecoration(
                  hintText: "Event Description",
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Icon(Icons.calendar_month_outlined),
                  SizedBox(width: 10),
                  Text(
                    "Event Date",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time_outlined),
                  SizedBox(width: 10),
                  Text(
                    "Event Time",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Choose Time",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "Location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15),
        InkWell(
          onTap: () {
            // Handle click
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary, width: 1),
            ),
            child: Row(
              children: [
                // Left Icon Box
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.my_location,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 15),
        
                // Text
                Expanded(
                  child: Text(
                    " Chosse Event Location",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
        
                // Right Arrow
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.blueAccent,
                ),
              ],
            ),
        
        
          ),
        ),
              SizedBox(height: 15),
              ElevatedButton(
        
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 2,
                  fixedSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "Add Event",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}
