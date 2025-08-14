import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/screens/layout/categories_data.dart';
import 'package:event_app/screens/layout/widgets/eventitemcard.dart';
import 'package:event_app/screens/layout/widgets/tabitemwidget.dart';
import 'package:flutter/material.dart';

import '../categories_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex = 0;
  List<CategoriesData> categories = [
    CategoriesData(categoryTitle: "Sports", categoryImg: "", categoryIcon: ""),
    CategoriesData(
      categoryTitle: "Birthday",
      categoryImg: "",
      categoryIcon: "",
    ),
    CategoriesData(
      categoryTitle: "Book club",
      categoryImg: "",
      categoryIcon: "",
    ),
    CategoriesData(categoryTitle: "gaming", categoryImg: "", categoryIcon: ""),
    CategoriesData(categoryTitle: "meeting", categoryImg: "", categoryIcon: ""),
    CategoriesData(
      categoryTitle: "Workshop",
      categoryImg: "",
      categoryIcon: "",
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
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount:categories.length,
                itemBuilder:(context, index) {
                  return Eventitemcard();
                } ,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10,);
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
