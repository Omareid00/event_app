import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/appimages/appimages.dart';
import 'package:flutter/material.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Forget Password",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.black
        ),),),
      body: SafeArea(child: Column(
        children: [
          Image.asset(AppImages.forgetPassword, fit: BoxFit.cover),
          const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.primary,
                    fixedSize: const Size.fromHeight(55),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  child: Text(
                    "Reset Password",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      inherit: true,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ]
      ),
      ),




      );
  }
}
