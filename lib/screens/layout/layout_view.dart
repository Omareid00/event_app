import 'package:event_app/cores/app_routes/app_routes.dart';
import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class LayoutView extends StatefulWidget {
   const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedindex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Constants.screens[selectedindex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedindex,
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.white,
        unselectedItemColor: Colors.white,
        onTap: (index) {
         setState(() {
           selectedindex = index;
         });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "map",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Love",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
      floatingActionButton: Bounceable(
        onTap: () {
        Navigator.pushNamed(context, APPROUTES.CreateEvent);
        },
        child: CircleAvatar(
          backgroundColor: AppColors.white,
          radius: 30,
          child: CircleAvatar(
            radius: 25,
        
            backgroundColor: AppColors.primary,child: Icon(Icons.add,color: AppColors.white,),)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
