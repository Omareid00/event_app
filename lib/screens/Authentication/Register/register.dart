import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/appimages/appimages.dart';
import 'package:event_app/cores/utils/firebase_auth_util.dart';
import 'package:event_app/screens/Authentication/Login/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Register",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key:formKey ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Image.asset(AppImages.splashLogo, fit: BoxFit.cover),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.grey),
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  validator: (value) {
                    final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  validator: (value) {
                    final passwordRegex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*]).{8,}$',
                    );
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    else if (!passwordRegex.hasMatch(value)) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    hintText: "Password",
                    suffixIcon: Icon(Icons.visibility, color: Colors.grey),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value != passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;

                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    hintText: "Re Password",
                    suffixIcon: Icon(Icons.visibility, color: Colors.grey),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
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
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            EasyLoading.show();
                            FirebaseAuthUtil.createUserWithEmailAndPassword( nameController.text,
                                emailController.text, 
                                passwordController.text).then((value) {
                                  EasyLoading.dismiss();
                                  if(value != null){
                                    EasyLoading.showSuccess("Register Successfully");
                                    Navigator.pop(context);
                                  }
                                },);
                          }
                        },
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
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
