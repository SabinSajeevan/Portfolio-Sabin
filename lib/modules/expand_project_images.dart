import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ExpandImages extends StatefulWidget {
  const ExpandImages(
      {super.key, required this.imageList, required this.initialPage});

  final List<String> imageList;
  final int initialPage;
  @override
  State<ExpandImages> createState() => _ExpandImagesState();
}

class _ExpandImagesState extends State<ExpandImages> {
//  final CarouselController carouselController = CarouselController();
  final ScrollController carouselController = ScrollController();

  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialPage;
    // Jump to the initial index when the widget is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double screenWidth = MediaQuery.of(context).size.width;

      carouselController.jumpTo(widget.initialPage * screenWidth);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height * 0.8;

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveBreakpoints.of(context).isMobile ? 0 : 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.filled(
              onPressed: _currentIndex > 0
                  ? () {
                      if (_currentIndex > 0) {
                        setState(() {
                          _currentIndex--;
                        });
                        carouselController.animateTo(
                          _currentIndex * screenWidth,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    }
                  : null,
              icon: const Icon(Icons.arrow_back_ios)),
          Flexible(
            child: SizedBox(
              width: screenWidth,
              height: screenHeight, // Set height for the carousel
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: carouselController,
                itemExtent: screenWidth,
                shrinkWrap: true,
                itemCount: widget.imageList.length,
                itemBuilder: (context, index) {
                  return InteractiveViewer(
                    boundaryMargin: const EdgeInsets.all(20),
                    minScale: 1.0,
                    maxScale: 3.0,
                    child: Hero(
                      tag: widget.imageList[index],
                      child: Image.asset(widget.imageList[index]),
                    ),
                  );
                },
              ),
            ),
          ),
          Column(
            children: [
              Container(
                width: ResponsiveBreakpoints.of(context).isMobile ? 28.0 : 40,
                height: ResponsiveBreakpoints.of(context).isMobile ? 28.0 : 40,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 1),
                          blurRadius: 2),
                    ],
                    color: Colors.red),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: IconButton.filled(
                          onPressed: _currentIndex < widget.imageList.length - 1
                              ? () {
                                  if (_currentIndex <
                                      widget.imageList.length - 1) {
                                    setState(() {
                                      _currentIndex++;
                                    });
                                    carouselController.animateTo(
                                      _currentIndex * screenWidth,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                }
                              : null,
                          icon: const Icon(Icons.arrow_forward_ios)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
