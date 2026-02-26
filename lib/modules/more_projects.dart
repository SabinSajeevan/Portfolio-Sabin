import 'package:flutter/material.dart';
import 'package:portfolio_sabin/modules/expand_project_images.dart';
import 'package:responsive_framework/responsive_framework.dart';

// ignore: must_be_immutable
class MoreProjects extends StatelessWidget {
  MoreProjects({super.key});

  List<MoreProjectsImagesWithNameModel> moreProductsList = [
    MoreProjectsImagesWithNameModel(
        image: 'assets/images/projects/more_projects/app24.webp',
        name: "APP24",
        description: "Hyper local-on demand service based mobile application",
        shortDescription:
            "Cab booking / Groceries / Food delivery / Courier service / Essential services"),
    MoreProjectsImagesWithNameModel(
        image: 'assets/images/projects/more_projects/aqary.webp',
        name: "AQARY",
        description: "Application for real estate",
        shortDescription: "Buy, rental, exchange of properties ( UAE based )"),
    MoreProjectsImagesWithNameModel(
        image: 'assets/images/projects/more_projects/ctrl_room.webp',
        name: "Ctrl Room",
        description: "Application for overseeing security workforce",
        shortDescription:
            "Real-time scheduling, Live tracking, Shift updates, Job duties"),
    MoreProjectsImagesWithNameModel(
        image: 'assets/images/projects/more_projects/bmk.webp',
        name: "BMK",
        description: "End-to-end shopping app for fashion and electronics",
        shortDescription:
            "Cart system, Discount coupons, Flexible delivery, Order tracking"),
    MoreProjectsImagesWithNameModel(
        image: 'assets/images/projects/more_projects/goldx.webp',
        name: "GoldX",
        description: "Digital platform for gold",
        shortDescription:
            "Buy, Sell, SIP, Gift and Store online at live market rates"),
    MoreProjectsImagesWithNameModel(
        image: 'assets/images/projects/more_projects/koode.webp',
        name: "Koode",
        description: "Coin-based private calling platform for connections",
        shortDescription:
            "Coin purchase, Secure calling, User discovery, Privacy-first design"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (int i = 0; i < moreProductsList.length; i += 2)
        ResponsiveRowColumn(
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveRowColumnItem(
                  rowFlex: 3,
                  child: MoreProjectsItem(
                    project: moreProductsList[i],
                    index: i,
                  )),
              if (i + 1 < moreProductsList.length)
                ResponsiveRowColumnItem(
                    rowFlex: 3,
                    child: MoreProjectsItem(
                      project: moreProductsList[i + 1],
                      index: i + 1,
                    )),
            ])
    ]);
  }
}

class MoreProjectsItem extends StatelessWidget {
  final MoreProjectsImagesWithNameModel project;
  final int index;
  MoreProjectsItem({
    super.key,
    required this.project,
    required this.index,
  });

  final List<String> imagesList = [
    'assets/images/projects/more_projects/app24.webp',
    'assets/images/projects/more_projects/aqary.webp',
    'assets/images/projects/more_projects/ctrl_room.webp',
    'assets/images/projects/more_projects/bmk.webp',
    'assets/images/projects/more_projects/goldx.webp',
    'assets/images/projects/more_projects/koode.webp',
  ];
  void onImagePressed({required BuildContext context}) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ExpandImages(imageList: imagesList, initialPage: index);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Card(
        borderOnForeground: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.shade400, width: 0.2)),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            onImagePressed(context: context);
          },
          child: Column(
            children: [
              Image.asset(
                project.image,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.sizeOf(context).width *
                            (ResponsiveBreakpoints.of(context)
                                    .smallerThan(DESKTOP)
                                ? 0.2
                                : 0.1)),
                    child: Column(
                      children: [
                        Text(project.name,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 18,
                                    )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(project.description ?? "",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith()),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(project.shortDescription ?? "",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MoreProjectsImagesWithNameModel {
  final String image;
  final String name;
  final String? description;
  final String? shortDescription;

  MoreProjectsImagesWithNameModel(
      {required this.image,
      required this.name,
      this.description,
      this.shortDescription});
}
