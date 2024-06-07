import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localization/app_localization.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

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

  Future<void> onDonePress(BuildContext context) async {
    // Navigate to the "/home" route using GoRouter
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false); // burada false yapıyoruzki tekrar açıldığında splash screenden boarding yerine home screen e atsın.!!!
    GoRouter.of(context).go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      onDonePress: () => onDonePress(context),
    );
  }
}
