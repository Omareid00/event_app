import 'package:event_app/screens/onboarding/onboardingitems.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../cores/appcolors/appcolors.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = Onboardingitems();
  final pageController = PageController();
  bool isLastPage =false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        bottomSheet: Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () =>pageController.previousPage(duration: Duration(milliseconds: 400), curve: Curves.bounceIn) ,
            icon: Icon(Icons.arrow_back,color: AppColors.primary,applyTextScaling: true,),),
            SmoothPageIndicator(
              onDotClicked:(index) => pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 350),
                  curve:Curves.decelerate ) ,
              controller: pageController,
              count: controller.onboardingItems.length,
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: AppColors.primary,
              ),),
            IconButton(onPressed : () => pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.bounceIn),
              icon: Icon(Icons.arrow_forward,color: AppColors.primary,applyTextScaling: true,),),
          ],),
        ),
        body: PageView.builder(
            onPageChanged: (index)=>setState(()=>isLastPage=controller.onboardingItems.length-1==index),
            itemCount: controller.onboardingItems.length,
            controller: pageController,
            itemBuilder: (context , index){
              return Column(
                children: [
                  const SizedBox(height: 16,),
                  Image.asset(controller.onboardingItems[index].firstImage,),
                  const SizedBox(height: 50.5,),
                  Image.asset(controller.onboardingItems[index].secondImage,),
                  const SizedBox(height: 50,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        controller.onboardingItems[index].title,style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(controller.onboardingItems[index].desc,style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 60,),
                  ],)

                ],
              );
            }
        ),
      
      ),
    );
  }
}
//  Widget finishButton(){
//   return TextButton(onPressed: ()async{
//     final pres = await SharedPreferences.getInstance();
//     pres.setBool("onboarding", true);
//
//     if(!mounted)return;
//     Navigator.pushReplacementNamed(context, APPROUTES.LoginScreen);
//   },
//       child: const Text("Finish",style:
//   TextStyle(
//       color: APPCOLORS.gold,
//       fontWeight: FontWeight.bold,
//       fontSize: 18
//   ),));
// }

