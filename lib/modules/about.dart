import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      "Flutter developer with 7+ years of experience building scalable cross-platform applications across fintech, POS, IoT, automotive, and enterprise domains.\n\n"
      "Specialized in Flutter architecture, Firebase ecosystems, Riverpod state management, and real-time application development. Strong focus on building production-grade applications with clean architecture, performance optimization, and seamless user experiences.\n\n"
      "Experienced in developing modern mobile platforms, scalable business solutions, and feature-rich applications across multiple industries while collaborating with cross-functional teams to deliver high-quality products.";
  late AnimationController _aboutController;
  late AnimationController _flutterController;
  late AnimationController _dartController;
  late AnimationController _firebaseController;
  late AnimationController _firestoreController;
  late AnimationController _androidController;
  late AnimationController _riverpodController;
  late AnimationController _grpcController;
  late AnimationController _restAPIController;
  late AnimationController _cicdController;
  late AnimationController _cloudFunctionController;
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
    _dartController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _firebaseController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _firestoreController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _androidController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _riverpodController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _grpcController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _cricketController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _badmintonController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _travelController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _moviesController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _restAPIController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _cicdController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _cloudFunctionController = AnimationController(
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
    _firestoreController.dispose();
    _androidController.dispose();
    _riverpodController.dispose();
    _grpcController.dispose();
    _cricketController.dispose();
    _badmintonController.dispose();
    _travelController.dispose();
    _moviesController.dispose();
    _restAPIController.dispose();
    _cicdController.dispose();
    _cloudFunctionController.dispose();
    _dartController.dispose();

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
                ]
                    .animate(interval: 150.ms, delay: 100.ms)
                    .fade(duration: 800.ms, curve: Curves.easeOutCubic)
                    .slideX(begin: -0.1, end: 0, curve: Curves.easeOutCubic),
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
                      skill: "Dart",
                      imagePath: "assets/animation/dart.json",
                      controller: _dartController,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Skills(
                      skill: "Firebase",
                      imagePath: "assets/animation/firebase.json",
                      controller: _firebaseController,
                    ),
                    Skills(
                      skill: "Firestore",
                      imagePath: "assets/animation/firestore.json",
                      controller: _firestoreController,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Skills(
                      skill: "Riverpod",
                      imagePath: "assets/animation/riverpod.json",
                      controller: _riverpodController,
                    ),
                    Skills(
                      skill: "gRPC",
                      imagePath: "assets/animation/grpc.json",
                      controller: _grpcController,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Skills(
                      skill: "REST APIs",
                      imagePath: "assets/animation/rest_api.json",
                      controller: _restAPIController,
                    ),
                    Skills(
                      skill: "Cloud Functions",
                      imagePath: "assets/animation/cloud_function.json",
                      controller: _cloudFunctionController,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Skills(
                      skill: "CI/CD",
                      imagePath: "assets/animation/cicd.json",
                      controller: _cicdController,
                    ),
                    Skills(
                      skill: "Android",
                      imagePath: "assets/animation/android.json",
                      controller: _androidController,
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
              ]
                  .animate(interval: 150.ms, delay: 100.ms)
                  .fade(duration: 800.ms, curve: Curves.easeOutCubic)
                  .slideX(begin: 0.1, end: 0, curve: Curves.easeOutCubic),
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
              imagePath: imagePath,
              size: 53,
              controller: controller,
            ),
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
