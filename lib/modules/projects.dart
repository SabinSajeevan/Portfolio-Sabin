import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_sabin/helpers/helpers.dart';
import 'package:portfolio_sabin/modules/expand_project_images.dart';
import 'package:portfolio_sabin/modules/more_projects.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollTrigger extends StatefulWidget {
  final Widget child;
  const ScrollTrigger({super.key, required this.child});

  @override
  State<ScrollTrigger> createState() => _ScrollTriggerState();
}

class _ScrollTriggerState extends State<ScrollTrigger> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key ?? UniqueKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.05 && !_isVisible) {
          if (mounted) {
            setState(() {
              _isVisible = true;
            });
          }
        }
      },
      child: widget.child
          .animate(target: _isVisible ? 1 : 0)
          .fade(duration: 800.ms, curve: Curves.easeOutCubic)
          .slideY(begin: 0.1, end: 0, curve: Curves.easeOutCubic),
    );
  }
}

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with TickerProviderStateMixin {
  String aglProjectName = "AGL/Toyota Flutter IVI";
  String aglDescription =
      "Worked as part of the ICS team on a Flutter-based In-Vehicle Infotainment (IVI) demo for Toyota.\n"
      "\n• Automotive UI"
      "\n• Vehicle Controls"
      "\n• Media Management"
      "\n• gRPC Communication\n";
  String aglToolsUsed = "Flutter | Dart | gRPC | Figma";

  String figma2flutterProjectName = "Figma2Flutter";
  String figma2flutterDescription =
      "Contributed to a Figma plugin that converts design components into Flutter code.\n"
      "\n• Code Generation"
      "\n• Figma API"
      "\n• Design-to-Code Workflow"
      "\n• Component Mapping\n";
  String figma2flutterToolsUsed = "Flutter | Dart | JavaScript | Figma API";

  String tableTagProjectName = "TableTag";
  String tableTagDescription =
      "Restaurant POS & QR Ordering Platform built end-to-end.\n"
      "\n• QR Ordering"
      "\n• Live Kitchen Updates"
      "\n• Multi-role Access"
      "\n• Analytics Dashboard"
      "\n• Firebase Real-time Sync\n";
  String tableTagToolsUsed =
      "Flutter | Firebase | Firestore | Riverpod | Cloud Functions | GoRouter";

  String scullyProjectName = "Scully Truck Tester";
  String scullyDescription =
      "Built as part of the ICS team, Scully Truck Tester is an IoT-enabled application used for testing and configuring truck-mounted hardware devices."
      "\n\n• Bluetooth Device Communication"
      "\n• IoT Hardware Integration"
      "\n• Real-time Device Monitoring"
      "\n• Alert & Notification Management\n";
  String scullyToolsUsed = "Flutter | Dart | IoT | Bluetooth";

  String divineBullionProjectName = "Divine Bullion";
  String divineBullionDescription =
      "Digital gold trading platform enabling users to buy, sell, and monitor gold investments with real-time market pricing."
      "\n\n• Live Gold Rate Tracking"
      "\n• Buy & Sell Orders"
      "\n• Portfolio Management"
      "\n• Real-time Market Updates\n";
  String divineBullionToolsUsed = "Flutter | Dart | REST APIs";

  String moneyPoolProjectName = "Hagbad Moneypool";
  String moneyPoolDescription =
      "A digital microfinance platform that modernizes ROSCA-style money pools, enabling community-driven savings and fund management."
      "\n\n•  Digital Money Pools"
      "\n• Community Savings Groups"
      "\n• Trust & Rating System"
      "\n• White-label Financial Solution\n";
  String moneyPoolToolsUsed = "Flutter | Dart | Figma";

  final String projectShortDescription =
      "Of course, this website itself showcases my projects. It is built with Flutter.\nTake a look at other projects that I've been a part of:";
  late AnimationController _projectsController;
  final CarouselController aglCarouselController = CarouselController();
  final CarouselController tableTagCarouselController = CarouselController();

  final CarouselController figma2flutterCarouselController =
      CarouselController();
  final CarouselController scullyCarouselController = CarouselController();
  final CarouselController divineBullionCarouselController =
      CarouselController();
  final CarouselController moneyPoolCarouselController = CarouselController();

  final List<String> projectAGLImages = [
    'assets/images/projects/agl/agl1.webp',
    'assets/images/projects/agl/agl2.webp',
    'assets/images/projects/agl/agl3.webp',
    'assets/images/projects/agl/agl4.webp',
    'assets/images/projects/agl/agl5.webp',
  ];

  final List<String> projectFigma2FlutterImages = [
    'assets/images/projects/figma2flutter/figma2flutter1.webp',
    'assets/images/projects/figma2flutter/figma2flutter2.webp',
    'assets/images/projects/figma2flutter/figma2flutter3.webp',
    'assets/images/projects/figma2flutter/figma2flutter4.webp',
    'assets/images/projects/figma2flutter/figma2flutter5.webp',
  ];

  final List<String> projectTableTagImages = [
    'assets/images/projects/tabletag/tabletag1.webp',
    'assets/images/projects/tabletag/tabletag2.webp',
    'assets/images/projects/tabletag/tabletag3.webp',
    'assets/images/projects/tabletag/tabletag4.webp',
    'assets/images/projects/tabletag/tabletag5.webp',
  ];

  final List<String> projectScullyImages = [
    'assets/images/projects/scully/scully1.webp',
    'assets/images/projects/scully/scully2.webp',
    'assets/images/projects/scully/scully3.webp',
    'assets/images/projects/scully/scully4.webp',
    'assets/images/projects/scully/scully5.webp',
  ];

  final List<String> projectDivineBullionImages = [
    'assets/images/projects/divine_bullion/divine_bullion1.webp',
    'assets/images/projects/divine_bullion/divine_bullion2.webp',
    'assets/images/projects/divine_bullion/divine_bullion3.webp',
    'assets/images/projects/divine_bullion/divine_bullion4.webp',
    'assets/images/projects/divine_bullion/divine_bullion5.webp',
  ];

  final List<String> projectMoneyPoolImages = [
    'assets/images/projects/moneypool/moneypool1.webp',
    'assets/images/projects/moneypool/moneypool2.webp',
    'assets/images/projects/moneypool/moneypool3.webp',
    'assets/images/projects/moneypool/moneypool4.webp',
    'assets/images/projects/moneypool/moneypool5.webp',
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

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            //color: Colors.red,
            //borderRadius: BorderRadius.circular(4),
            //border: Border.all(color: border)
            ),
        margin: blockMargin,
        padding: blockPadding(context),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScrollTrigger(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      padding:
                          const EdgeInsets.only(bottom: 32, left: 30, top: 20),
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
                  ],
                ),
              ),
              ScrollTrigger(
                child: ResponsiveRowColumn(
                    layout:
                        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                    rowCrossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ResponsiveRowColumnItem(
                          rowFlex: 6,
                          columnOrder: 1,
                          child: ProjectDetailCarousel(
                            imageList: projectAGLImages,
                            carouselController: aglCarouselController,
                          )),
                      ResponsiveRowColumnItem(
                          rowFlex: 2,
                          rowFit: FlexFit.tight,
                          child: ProjectDetailDescription(
                            projectName: aglProjectName,
                            projectDescription: aglDescription,
                            projectTools: aglToolsUsed,
                            context: context,
                          ))
                    ]),
              ),
              const SizedBox(
                height: 70,
              ),
              ScrollTrigger(
                child: ResponsiveRowColumn(
                  layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  rowCrossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResponsiveRowColumnItem(
                        rowFlex: 2,
                        rowFit: FlexFit.tight,
                        child: ProjectDetailDescription(
                          projectName: figma2flutterProjectName,
                          projectDescription: figma2flutterDescription,
                          projectTools: figma2flutterToolsUsed,
                          context: context,
                        )),
                    ResponsiveRowColumnItem(
                        rowFlex: 6,
                        columnOrder: 1,
                        child: ProjectDetailCarousel(
                          imageList: projectFigma2FlutterImages,
                          carouselController: figma2flutterCarouselController,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              ScrollTrigger(
                child: ResponsiveRowColumn(
                    layout:
                        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                    rowCrossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ResponsiveRowColumnItem(
                          rowFlex: 6,
                          columnOrder: 1,
                          child: ProjectDetailCarousel(
                            imageList: projectTableTagImages,
                            carouselController: tableTagCarouselController,
                          )),
                      ResponsiveRowColumnItem(
                          rowFlex: 2,
                          rowFit: FlexFit.tight,
                          child: ProjectDetailDescription(
                            projectName: tableTagProjectName,
                            projectDescription: tableTagDescription,
                            projectTools: tableTagToolsUsed,
                            context: context,
                          ))
                    ]),
              ),
              const SizedBox(
                height: 70,
              ),
              ScrollTrigger(
                child: ResponsiveRowColumn(
                    layout:
                        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                    rowCrossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ResponsiveRowColumnItem(
                          rowFlex: 2,
                          rowFit: FlexFit.tight,
                          child: ProjectDetailDescription(
                            projectName: scullyProjectName,
                            projectDescription: scullyDescription,
                            projectTools: scullyToolsUsed,
                            context: context,
                          )),
                      ResponsiveRowColumnItem(
                          rowFlex: 6,
                          columnOrder: 1,
                          child: ProjectDetailCarousel(
                            imageList: projectScullyImages,
                            carouselController: scullyCarouselController,
                          )),
                    ]),
              ),
              const SizedBox(
                height: 70,
              ),
              ScrollTrigger(
                child: ResponsiveRowColumn(
                    layout:
                        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                    rowCrossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ResponsiveRowColumnItem(
                          rowFlex: 6,
                          columnOrder: 1,
                          child: ProjectDetailCarousel(
                            imageList: projectDivineBullionImages,
                            carouselController: divineBullionCarouselController,
                          )),
                      ResponsiveRowColumnItem(
                          rowFlex: 2,
                          rowFit: FlexFit.tight,
                          child: ProjectDetailDescription(
                            projectName: divineBullionProjectName,
                            projectDescription: divineBullionDescription,
                            projectTools: divineBullionToolsUsed,
                            context: context,
                          )),
                    ]),
              ),
              const SizedBox(
                height: 70,
              ),
              ScrollTrigger(
                child: ResponsiveRowColumn(
                    layout:
                        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                    rowCrossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ResponsiveRowColumnItem(
                          rowFlex: 2,
                          rowFit: FlexFit.tight,
                          child: ProjectDetailDescription(
                            projectName: moneyPoolProjectName,
                            projectDescription: moneyPoolDescription,
                            projectTools: moneyPoolToolsUsed,
                            context: context,
                          )),
                      ResponsiveRowColumnItem(
                          rowFlex: 6,
                          columnOrder: 1,
                          child: ProjectDetailCarousel(
                            imageList: projectMoneyPoolImages,
                            carouselController: moneyPoolCarouselController,
                          )),
                    ]),
              ),
              const SizedBox(
                height: 70,
              ),
              ScrollTrigger(child: MoreProjects())
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(
              //           top: ResponsiveBreakpoints.of(context).isMobile
              //               ? 45
              //               : 80),
              //       child: TextButton(
              //         onPressed: () {},
              //         child: Text("Show More",
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .bodyMedium!
              //                 .copyWith(color: primary)),
              //       ),
              //     ),
              //   ],
              // ),
            ]));
  }
}

class ProjectDetailDescription extends StatelessWidget {
  const ProjectDetailDescription(
      {super.key,
      required this.context,
      required this.projectName,
      required this.projectDescription,
      required this.projectTools});

  final BuildContext context;
  final String projectName;
  final String projectDescription;
  final String projectTools;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                TextSpan(text: "$projectDescription\n"),
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
    );
  }
}

class ProjectDetailCarousel extends StatefulWidget {
  const ProjectDetailCarousel(
      {super.key, required this.imageList, required this.carouselController});
  final List<String> imageList;
  final CarouselController carouselController;
  @override
  ProjectDetailCarouselState createState() => ProjectDetailCarouselState();
}

class ProjectDetailCarouselState extends State<ProjectDetailCarousel> {
  double _itemExtent = 250; // Size of each carousel item

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        setState(() {
          _itemExtent = ResponsiveBreakpoints.of(context).isDesktop
              ? MediaQuery.of(context).size.width * 0.17
              : MediaQuery.of(context).size.width * 0.58;
        });
      }
    });
    super.initState();
  }

  void _moveForward() {
    widget.carouselController.animateTo(
      widget.carouselController.offset + _itemExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _moveBackward() {
    widget.carouselController.animateTo(
      widget.carouselController.offset - _itemExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onImagePressed({required int initialPage}) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ExpandImages(
              imageList: widget.imageList, initialPage: initialPage);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconButton.filled(
                  onPressed: () {
                    _moveBackward();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height *
                      (ResponsiveBreakpoints.of(context).isDesktop
                          ? 0.6
                          : 0.45),
                  child: CarouselView(
                    itemExtent: _itemExtent,
                    controller: widget.carouselController,
                    itemSnapping: true,
                    onTap: (value) {
                      onImagePressed(initialPage: value);
                    },
                    children: widget.imageList
                        .map((item) => Hero(
                              tag: item,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: AssetImage(item),
                                    fit: BoxFit
                                        .contain, // Fill the container while maintaining aspect ratio
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              IconButton.filled(
                  onPressed: () {
                    _moveForward();
                  },
                  icon: const Icon(Icons.arrow_forward_ios)),
            ],
          ),
        ],
      ),
    );
  }
}
