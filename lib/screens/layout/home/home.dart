import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/appimages/appimages.dart';
import 'package:event_app/cores/utils/firebase_firestore.dart';
import 'package:event_app/screens/layout/categories_data.dart';
import 'package:event_app/screens/layout/create_event/widget/create_event_categories.dart';
import 'package:event_app/screens/layout/create_event/widget/eventdata.dart';
import 'package:event_app/screens/layout/widgets/eventitemcard.dart';
import 'package:event_app/screens/layout/widgets/tabitemwidget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex = 0;
  List<CreateEventCategories> createEventCategories = [
    CreateEventCategories(
      categoryTitle: "Book club",
      categoryImg: AppImages.book,
      categoryIcon: Icons.book,
      categoryId: "book club",
    ),
    CreateEventCategories(
      categoryTitle: "Sport",
      categoryImg: AppImages.Sport,
      categoryIcon: Icons.directions_bike_outlined,
      categoryId: "sport",
    ),
    CreateEventCategories(
      categoryTitle: "Birthday",
      categoryImg: AppImages.birthday,
      categoryIcon: Icons.cake,
      categoryId: "birthday",
    ),
    CreateEventCategories(
      categoryTitle: "meeting",
      categoryImg: AppImages.meeting,
      categoryIcon: Icons.meeting_room_sharp,
      categoryId: "meeting",
    ),
    CreateEventCategories(
      categoryTitle: "gaming",
      categoryImg: AppImages.gaming,
      categoryIcon: Icons.ice_skating_outlined,
      categoryId: 'gaming',
    ),
    CreateEventCategories(
      categoryTitle: "Eating",
      categoryImg: AppImages.eating,
      categoryIcon: Icons.ice_skating_outlined,
      categoryId: "eating",
    ),
    CreateEventCategories(
      categoryTitle: "Holiday",
      categoryImg: AppImages.holiday,
      categoryIcon: Icons.ice_skating_outlined,
      categoryId: "holiday",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: 174,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Welcome Back ✨",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "John Safwat",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.light_mode_outlined, color: AppColors.white),
                        SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "EN",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.white,
                        ),
                        Text(
                          "Cairo, Egypt",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
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
                          return Tabitemwidget(
                            isSelected:
                                selectedTabIndex ==
                                createEventCategories.indexOf(categoriesData),
                            createEventCategories: categoriesData,

                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestoreService.getStreamEventList(
                categoryId: createEventCategories[selectedTabIndex].categoryId,
              ),
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

                return Expanded(
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
      ],
    );
  }
}
