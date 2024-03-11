import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_sabin/helpers/helpers.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with TickerProviderStateMixin {
  String aglProjectName = "AGL/Toyota Flutter IVI";
  String aglDescription =
      "Explore our Toyota Tradeshow Demo, a Flutter app developed in collaboration with Automotive Grade Linux. This interactive demo showcases cutting-edge IVI technology, leveraging Flutter and gRPC for seamless connectivity and innovation in automotive infotainment.";
  String aglToolsUsed = "Flutter | Dart | GRPC | Figma";

  String figma2flutterProjectName = "Figma2Flutter";
  String figma2flutterDescription =
      "Figma2Flutter is a plugin designed to streamline the process of creating Flutter applications from Figma designs. With Figma2Flutter, developers can seamlessly translate Figma designs into Flutter code, saving time and ensuring consistency between design and development. Simplify your workflow and bring your Figma designs to life with Figma2Flutter";
  String figma2flutterToolsUsed = "Flutter | Dart | JavaScript | Figma";

  String scullyProjectName = "Scully Truck Tester";
  String scullyDescription =
      "Scully Truck Tester is a mobile application designed for interacting with IoT devices, specifically tailored for Scully truck equipment. With this app, users can easily monitor and control IoT devices, ensuring optimal performance and safety in trucking operations. Streamline your testing process and enhance efficiency with Scully Truck Tester.";
  String scullyToolsUsed = "Flutter | Dart | IoT | Figma";

  String divineBullionProjectName = "Divine Bullion";
  String divineBullionDescription =
      "Divine Bullion is a mobile application dedicated to trading gold. With Divine Bullion, users can easily buy and sell gold, track prices in real-time, and stay updated on market trends. Experience seamless gold trading at your fingertips with Divine Bullion.";
  String divineBullionToolsUsed = "Flutter | Dart | Figma";

  String moneyPoolProjectName = "Hagbad Moneypool";
  String moneyPoolDescription =
      "Money Pool Platform digitizes traditional microfinance like ROSCA, offering a white-label solution for entrepreneurs and financial institutions. With customizable branding and currency compatibility, it enables seamless onboarding and fund management, making community-driven finance accessible.";
  String moneyPoolToolsUsed = "Flutter | Dart | Figma";

  final String projectShortDescription =
      "Of course, this website itself showcases my projects. It is built with Flutter.\nTake a look at other projects that I've been a part of:";
  late AnimationController _projectsController;
  final CarouselController aglCarouselController = CarouselController();
  final CarouselController figma2flutterCarouselController =
      CarouselController();
  final CarouselController scullyCarouselController = CarouselController();
  final CarouselController divineBullionCarouselController =
      CarouselController();
  final CarouselController moneyPoolCarouselController = CarouselController();

  final List<String> projectAGLImages = [
    'assets/images/projects/agl/agl1.png',
    'assets/images/projects/agl/agl2.png',
    'assets/images/projects/agl/agl3.png',
    'assets/images/projects/agl/agl4.png',
    'assets/images/projects/agl/agl5.png',
  ];

  final List<String> projectFigma2FlutterImages = [
    'assets/images/projects/figma2flutter/figma2flutter1.png',
    'assets/images/projects/figma2flutter/figma2flutter2.png',
    'assets/images/projects/figma2flutter/figma2flutter3.png',
    'assets/images/projects/figma2flutter/figma2flutter4.png',
    'assets/images/projects/figma2flutter/figma2flutter5.png',
  ];

  final List<String> projectScullyImages = [
    'assets/images/projects/scully/scully1.png',
    'assets/images/projects/scully/scully2.png',
    'assets/images/projects/scully/scully3.png',
    'assets/images/projects/scully/scully4.png',
    'assets/images/projects/scully/scully5.png',
  ];

  final List<String> projectDivineBullionImages = [
    'assets/images/projects/divine_bullion/divine_bullion1.png',
    'assets/images/projects/divine_bullion/divine_bullion2.png',
    'assets/images/projects/divine_bullion/divine_bullion3.png',
    'assets/images/projects/divine_bullion/divine_bullion4.png',
    'assets/images/projects/divine_bullion/divine_bullion5.png',
  ];

  final List<String> projectMoneyPoolImages = [
    'assets/images/projects/moneypool/moneypool1.png',
    'assets/images/projects/moneypool/moneypool2.png',
    'assets/images/projects/moneypool/moneypool3.png',
    'assets/images/projects/moneypool/moneypool4.png',
    'assets/images/projects/moneypool/moneypool5.png',
  ];

  @override
  void initState() {
    super.initState();
    _projectsController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1400));
    _projectsController.forward();
    _projectsController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 5000), () {
          if (mounted) {
            _projectsController.forward(from: 0.0);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _projectsController.dispose();
    super.dispose();
  }

  projectDetailCarousel(
      {required CarouselController carouselController,
      required List<String> imageList}) {
    return ResponsiveRowColumnItem(
      rowFlex: 6,
      columnOrder: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                IconButton.filled(
                    onPressed: () {
                      carouselController.previousPage();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                Expanded(
                  child: CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                        autoPlay: false,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        height: MediaQuery.of(context).size.height *
                            (ResponsiveBreakpoints.of(context).isDesktop
                                ? 0.6
                                : 0.45),
                        viewportFraction:
                            ResponsiveBreakpoints.of(context).isDesktop
                                ? 0.35
                                : 1.0),
                    items: imageList
                        .map((item) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(item),
                                  fit: BoxFit
                                      .contain, // Fill the container while maintaining aspect ratio
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                IconButton.filled(
                    onPressed: () {
                      carouselController.nextPage();
                    },
                    icon: const Icon(Icons.arrow_forward_ios)),
              ],
            )
          ],
        ),
      ),
    );
  }

  projectDetailDescription(
      {required String projectName,
      required String projectDescription,
      required String projectTools}) {
    return ResponsiveRowColumnItem(
      rowFlex: 2,
      rowFit: FlexFit.tight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Text(
                  projectName,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 24,
                        //   fontWeight: FontWeight.w700,
                        //   decoration: TextDecoration.underline,
                        //   decorationStyle: TextDecorationStyle.solid,
                        //   //color: Colors.transparent,
                        //   decorationColor: Colors.black38,
                        //   shadows: [
                        //     const Shadow(
                        //       color: Colors.black,
                        //       offset: Offset(0, -5),
                        //     )
                        //   ],
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(text: "$projectDescription\n\n"),
                  TextSpan(
                      text: projectTools,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.blueAccent.shade100)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
                    child: buildMaterialIconCircle(
                        imagePath: "assets/animation/emoji_love_eye.json",
                        size: 68,
                        imageSize: 40,
                        controller: _projectsController),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Projects Showcase",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32, left: 30, top: 20),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(text: projectShortDescription),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ResponsiveRowColumn(
                  layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  rowCrossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    projectDetailCarousel(
                        carouselController: aglCarouselController,
                        imageList: projectAGLImages),
                    projectDetailDescription(
                        projectName: aglProjectName,
                        projectDescription: aglDescription,
                        projectTools: aglToolsUsed)
                  ]),
              const SizedBox(
                height: 70,
              ),
              ResponsiveRowColumn(
                layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                rowCrossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  projectDetailDescription(
                      projectName: figma2flutterProjectName,
                      projectDescription: figma2flutterDescription,
                      projectTools: figma2flutterToolsUsed),
                  projectDetailCarousel(
                      carouselController: figma2flutterCarouselController,
                      imageList: projectFigma2FlutterImages),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              ResponsiveRowColumn(
                  layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  rowCrossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    projectDetailCarousel(
                        carouselController: scullyCarouselController,
                        imageList: projectScullyImages),
                    projectDetailDescription(
                        projectName: scullyProjectName,
                        projectDescription: scullyDescription,
                        projectTools: scullyToolsUsed)
                  ]),
              const SizedBox(
                height: 70,
              ),
              ResponsiveRowColumn(
                  layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  rowCrossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    projectDetailDescription(
                        projectName: divineBullionProjectName,
                        projectDescription: divineBullionDescription,
                        projectTools: divineBullionToolsUsed),
                    projectDetailCarousel(
                        carouselController: divineBullionCarouselController,
                        imageList: projectDivineBullionImages),
                  ]),
              const SizedBox(
                height: 70,
              ),
              ResponsiveRowColumn(
                  layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  rowCrossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    projectDetailCarousel(
                        carouselController: moneyPoolCarouselController,
                        imageList: projectMoneyPoolImages),
                    projectDetailDescription(
                        projectName: moneyPoolProjectName,
                        projectDescription: moneyPoolDescription,
                        projectTools: moneyPoolToolsUsed),
                  ]),
            ]));
  }
}
