import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_sabin/constants/colors.dart';
import 'package:portfolio_sabin/helpers/helpers.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with TickerProviderStateMixin {
  String headerShortDescription =
      "Welcome to my portfolio! I specialize in building captivating mobile applications and dynamic user experiences. With expertise in cross-platform development, I bring ideas to life using a blend of creativity and technical skill. Explore my projects and see how I can help turn your concepts into reality.";

  String headerTitle = "Sabin Sajeevan";
  String cvURL =
      "https://drive.google.com/file/d/1tJPcuZ2cavzrlq_8GlYv3WCozqBiUx4j/view?usp=sharing";

  late AnimationController _welcomeController;

  @override
  void initState() {
    super.initState();
    _welcomeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1400));
    _welcomeController.forward();
    _welcomeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 5000), () {
          if (mounted) {
            _welcomeController.forward(from: 0.0);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _welcomeController.dispose();
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
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 3,
            columnOrder: 2,
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
                            imagePath: "assets/animation/welcome.json",
                            size: 68,
                            controller: _welcomeController),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Hi, everyone! I'm",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Text(headerTitle,
                        style: Theme.of(context).textTheme.headlineLarge),
                  ),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(text: "$headerShortDescription\n\n"),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openUrl(cvURL, newWindow: true);
                              },
                            text: "Explore My Resume",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: primary)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 2,
            columnOrder: 1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15), // Adjust the radius as needed
              ),
              clipBehavior: Clip.antiAlias,
              elevation: 10.0,
              child: Image.asset(
                'assets/images/profile_image.jpg',
                width: 320,
                height: 320,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
