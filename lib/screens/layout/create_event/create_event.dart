import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/appimages/appimages.dart';
import 'package:event_app/cores/utils/firebase_firestore.dart';
import 'package:event_app/screens/layout/create_event/widget/create_event_categories.dart';
import 'package:event_app/screens/layout/create_event/widget/create_event_tabitem.dart';
import 'package:event_app/screens/layout/create_event/widget/eventdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int selectedTabIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<CreateEventCategories> createEventCategories = [
    CreateEventCategories(
      categoryTitle: "Book club",
      categoryImg: AppImages.book,
      categoryIcon: Icons.book,
      categoryId: "",
    ),
    CreateEventCategories(
      categoryTitle: "Sport",
      categoryImg: AppImages.Sport,
      categoryIcon: Icons.directions_bike_outlined,
      categoryId: "",
    ),
    CreateEventCategories(
      categoryTitle: "Birthday",
      categoryImg: AppImages.birthday,
      categoryIcon: Icons.cake,
      categoryId: "",
    ),
    CreateEventCategories(
      categoryTitle: "meeting",
      categoryImg: AppImages.meeting,
      categoryIcon: Icons.meeting_room_sharp,
      categoryId: "",
    ),
    CreateEventCategories(
      categoryTitle: "gaming",
      categoryImg: AppImages.gaming,
      categoryIcon: Icons.ice_skating_outlined,
      categoryId: '',
    ),
    CreateEventCategories(
      categoryTitle: "Eating",
      categoryImg: AppImages.eating,
      categoryIcon: Icons.ice_skating_outlined,
      categoryId: "",
    ),
    CreateEventCategories(
      categoryTitle: "Holiday",
      categoryImg: AppImages.holiday,
      categoryIcon: Icons.ice_skating_outlined,
      categoryId: "",
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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 1.0,
                  height: 0.25,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    createEventCategories[selectedTabIndex].categoryImg,
                    fit: BoxFit.cover,
                  ),
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
                      return CreateEventTabitem(
                        isSelected:
                            selectedTabIndex ==
                            createEventCategories.indexOf(categoriesData),
                        eventcreateData: categoriesData,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Title",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                  controller: titleController,
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
                SizedBox(height: 10),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                  controller: descriptionController,
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
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined),
                    SizedBox(width: 10),
                    Text(
                      "Event Date",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        getcurrentDate();
                      },
                      child: Text(
                        selectedDate== null ? "Choose Date" : DateFormat('yyyy-MM-dd').format(selectedDate!).toString(),
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
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        getCurrentTime();
                      },
                      child: Text(
                        selectedTime==null?"Choose Time":selectedTime.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Location",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // Handle click
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.primary, width: 1),
                    ),
                    child: Row(
                      children: [
                        // Left Icon Box
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.my_location,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),

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
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    EventData data= EventData(

                      eventTitle: titleController.text,
                      eventId: "",
                      isFavorite: false,
                      eventDescription: descriptionController.text,
                      selectDate: selectedDate!,
                      eventCategoryId: createEventCategories[selectedTabIndex].categoryId,
                      eventCategoryImage: createEventCategories[selectedTabIndex].categoryImg,);
                    if (formKey.currentState!.validate()) {
                      if (selectedDate != null ) {
                        EasyLoading.show();
                        FirebaseFirestoreService.createNewEventTask(data).then((value) {
                          EasyLoading.dismiss();
                        });




                      }

                    }
                  },
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
      ),
    );
  }

  void getcurrentDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDate: DateTime.now(),
    ).then((value) {
      setState(() {
        selectedDate= value;
      });
    });
  }
  void getCurrentTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        selectedTime= value;
      });
    });
  }
}
