import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

import '../localization/app_localization.dart';
// Text(AppLocalizations.of(context).getTranslate("boarding_screen")));
class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "Welcome",
        description: "This is an onboarding screen",
        pathImage: "assets/onboarding1.png",
      ),
    );
    slides.add(
      Slide(
        title: "Discover",
        description: "Discover new features",
        pathImage: "assets/onboarding2.png",
      ),
    );
    slides.add(
      Slide(
        title: "Get Started",
        description: "Let's get started!",
        pathImage: "assets/onboarding3.png",
      ),
    );
  }

  void onDonePress() {
    // Navigate to your main screen
    Navigator.pushReplacementNamed(context, "/main");
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      onDonePress: onDonePress,
    );
  }
}
