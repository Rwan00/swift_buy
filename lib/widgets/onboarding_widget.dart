import 'package:flutter/material.dart';


import '../models/onboarding_model.dart';
import '../theme/body_theme.dart';
import '../theme/fonts.dart';

Padding buildBoardingItem(OnBoardingModel onBoardingModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Image.asset(onBoardingModel.img)),
        const SizedBox(height: 16,),
        Text(
          onBoardingModel.title,
          textAlign: TextAlign.center,
          style: heading.copyWith(color: primaryDeepPurple),
        ),
        const SizedBox(height: 24,),
        Text(
          onBoardingModel.body,
          textAlign: TextAlign.center,
          style: subTitle.copyWith(
              color: const Color.fromARGB(255, 113, 112, 112)),
        ),
      ],
    ),
  );
}