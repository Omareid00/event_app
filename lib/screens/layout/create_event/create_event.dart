import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.center,
          "Create Event",style:
          TextStyle(

            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.primary
          ),),
      ),
    );
  }
}
