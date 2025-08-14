import 'package:event_app/cores/app_routes/app_routes.dart';
import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/appicons/appicons.dart';
import 'package:event_app/cores/appimages/appimages.dart';
import 'package:event_app/screens/Authentication/Forgetpassword/forgetpassword.dart';
import 'package:event_app/screens/layout/categories_data.dart';
import 'package:flutter/material.dart';

import '../../layout/layout_view.dart';
import '../Register/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<CategoriesData> categories = [

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(AppImages.splashLogo, fit: BoxFit.cover),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  hintText: "Password",
                  suffixIcon: Icon(Icons.visibility, color: Colors.grey),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, APPROUTES.Forgetpassword);
                  },
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      inherit: true,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LayoutView()),
                      ),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        foregroundColor: AppColors.white,
                        backgroundColor: AppColors.primary,
                        fixedSize: const Size.fromHeight(50),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          inherit: true,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ), //loginButton
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      inherit: true,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, APPROUTES.Register);

                    },

                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        inherit: true,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "________________  Or _______________",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                inherit: true,
                letterSpacing: 1,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Login with Google",
                        style: TextStyle(color: AppColors.primary),
                      ),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        foregroundColor: AppColors.primary,
                        backgroundColor: AppColors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: AppColors.primary),
                        ),
                      ),
                      icon: Image.asset(Appicons.googleLogo),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
