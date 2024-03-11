import 'package:flutter/material.dart';
import 'package:portfolio_sabin/helpers/helpers.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with TickerProviderStateMixin {
  String aboutDescription =
      "Hey there! I'm Sabin Sajeevan, a driven developer passionate about crafting exceptional digital experiences. With a background in app development and a love for problem-solving, I thrive on turning ideas into reality."
      "\n\nMy journey into the world of development was sparked by a fascination with technology and a desire to create solutions that make a difference. From designing sleek mobile apps to optimizing user interfaces, I'm committed to delivering top-notch results that exceed expectations."
      // "\n\nWhen I'm not coding, you can find me on the cricket pitch, smashing shuttlecocks on the badminton court, or hitting the road for an adventure. I'm always up for exploring new places and experiences, which helps me stay inspired and creative."
      "\n\nI'm excited to collaborate with like-minded individuals to bring innovative ideas to life. Let's team up and create something extraordinary together!";

  late AnimationController _aboutController;
  late AnimationController _flutterController;
  late AnimationController _firebaseController;
  late AnimationController _uiuxController;
  late AnimationController _androidController;
  late AnimationController _laravelController;
  late AnimationController _phpController;
  late AnimationController _cricketController;
  late AnimationController _badmintonController;
  late AnimationController _travelController;
  late AnimationController _moviesController;

  @override
  void initState() {
    super.initState();
    _aboutController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _flutterController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _firebaseController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _uiuxController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _androidController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _laravelController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _phpController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _cricketController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _badmintonController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _travelController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _moviesController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _aboutController.forward();
    _aboutController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 5000), () {
          if (mounted) {
            _aboutController.forward(from: 0.0);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _aboutController.dispose();
    _flutterController.dispose();
    _firebaseController.dispose();
    _uiuxController.dispose();
    _androidController.dispose();
    _laravelController.dispose();
    _phpController.dispose();
    _cricketController.dispose();
    _badmintonController.dispose();
    _travelController.dispose();
    _moviesController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          //  color: Colors.white,
          //borderRadius: BorderRadius.circular(4),
          //border: Border.all(color: border)
          ),
      margin: blockMargin,
      padding: blockPadding(context),
      child: ResponsiveRowColumn(
        layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowSpacing: 50,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: buildMaterialIconCircle(
                            imagePath: "assets/animation/emoji_with_glass.json",
                            size: 68,
                            controller: _aboutController),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "About Me",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      )
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(text: aboutDescription),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 2,
            rowFit: FlexFit.tight,
            rowColumn: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 30),
                  child: Text(
                    "Skills & Technologies",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  children: [
                    Skills(
                      skill: "Flutter",
                      imagePath: "assets/animation/flutter.json",
                      controller: _flutterController,
                    ),
                    Skills(
                      skill: "Firebase",
                      imagePath: "assets/animation/firebase.json",
                      controller: _firebaseController,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Skills(
                      skill: "Design UI/UX",
                      imagePath: "assets/animation/uiux.json",
                      controller: _uiuxController,
                    ),
                    Skills(
                      skill: "Java Android",
                      imagePath: "assets/animation/android.json",
                      controller: _androidController,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Skills(
                      skill: "Laravel",
                      imagePath: "assets/animation/laravel.json",
                      controller: _laravelController,
                    ),
                    Skills(
                      skill: "PHP",
                      imagePath: "assets/animation/php.json",
                      controller: _phpController,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 30),
                  child: Text(
                    "Hobbies & Interests",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Row(
                  children: [
                    Skills(
                      skill: "Cricket",
                      imagePath: "assets/animation/cricket.json",
                      controller: _cricketController,
                    ),
                    Skills(
                      skill: "Badminton",
                      imagePath: "assets/animation/badminton.json",
                      controller: _badmintonController,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Skills(
                      skill: "Travel",
                      imagePath: "assets/animation/travel.json",
                      controller: _travelController,
                    ),
                    Skills(
                      skill: "Movies",
                      imagePath: "assets/animation/movies.json",
                      controller: _moviesController,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Skills extends StatelessWidget {
  const Skills(
      {super.key,
      required this.skill,
      required this.imagePath,
      required this.controller});
  final String skill;
  final String imagePath;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            buildMaterialIconCircle(
                imagePath: imagePath, size: 53, controller: controller),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                skill,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
