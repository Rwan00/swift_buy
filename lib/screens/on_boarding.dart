import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../methods/methods.dart';
import '../models/onboarding_model.dart';
import '../theme/body_theme.dart';
import '../widgets/onboarding_widget.dart';
import 'login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    var boardController = PageController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                animatedNavigateAndDelete(context, const LoginScreen(),
                    PageTransitionType.leftToRight, Curves.easeInOutCirc);
              },
              child: Text(
                "SKIP",
                style: GoogleFonts.raleway(
                  color: primaryPurple,
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
      body: Column(children: [
        Expanded(
          child: PageView.builder(
            controller: boardController,
            onPageChanged: (int index) {
              if (index == onBoardingList.length - 1) {
                setState(() {
                  isLast = true;
                });
              } else {
                setState(() {
                  isLast = false;
                });
              }
            },
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildBoardingItem(onBoardingList[index]),
            itemCount: onBoardingList.length,
          ),
        ),
        const SizedBox(
          height: 85,
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: [
              SmoothPageIndicator(
                controller: boardController,
                count: onBoardingList.length,
                effect: JumpingDotEffect(
                    verticalOffset: 20,
                    jumpScale: 1.6,
                    activeDotColor: primaryPurple,
                    dotWidth: 24,
                    dotHeight: 8),
              ),
              const Spacer(),
              FloatingActionButton(
                onPressed: () {
                  isLast
                      ? animatedNavigateAndDelete(context, const LoginScreen(),
                          PageTransitionType.leftToRight, Curves.easeInOutCirc)
                      : boardController.nextPage(
                          duration: const Duration(milliseconds: 900),
                          curve: Curves.easeInOutBack);
                },
                backgroundColor: primaryPurple,
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
