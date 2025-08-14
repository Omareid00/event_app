import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/appimages/appimages.dart';
import 'package:event_app/screens/Authentication/Login/loginscreen.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
        "Register",style: TextStyle(
          fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.black
      ),),),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16,),
            Image.asset(AppImages.splashLogo, fit: BoxFit.cover),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  hintText: "Password",
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  hintText: "Re Password",
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
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
                        "Create Account",
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
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),),
                TextButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),)),
                    child: Text("Login",style: TextStyle(color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),))
              ],
            ),



          ],
      ),)
    );
  }
}
