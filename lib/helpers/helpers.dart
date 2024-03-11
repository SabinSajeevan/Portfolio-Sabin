import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_sabin/constants/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

final appThemeProvider = StateProvider<bool>((ref) => false);

// Margin
const EdgeInsets marginBottom12 = EdgeInsets.only(bottom: 12);
const EdgeInsets marginBottom24 = EdgeInsets.only(bottom: 24);
const EdgeInsets marginBottom40 = EdgeInsets.only(bottom: 40);

// Padding
const EdgeInsets paddingBottom24 = EdgeInsets.only(bottom: 24);

// Block Spacing
const List<Condition<BoxConstraints>> blockWidthConstraints = [
  Condition.equals(name: MOBILE, value: BoxConstraints(maxWidth: 600)),
  Condition.equals(name: TABLET, value: BoxConstraints(maxWidth: 700)),
  Condition.largerThan(name: TABLET, value: BoxConstraints(maxWidth: 1280)),
];

EdgeInsets blockPadding(BuildContext context) =>
    ResponsiveValue<EdgeInsets>(context,
        defaultValue: EdgeInsets.symmetric(
            horizontal: ResponsiveBreakpoints.of(context).isMobile ? 15 : 55,
            vertical: ResponsiveBreakpoints.of(context).isMobile ? 45 : 80),
        conditionalValues: [
          const Condition.smallerThan(
              name: TABLET,
              value: EdgeInsets.symmetric(horizontal: 15, vertical: 45))
        ]).value;

const EdgeInsets blockMargin = EdgeInsets.fromLTRB(10, 0, 10, 32);

Widget buildMaterialIconCircle(
    {String? imagePath,
    double? size,
    AnimationController? controller,
    double? imageSize = 60}) {
  return Container(
    width: size,
    height: size,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: primaryLight,
    ),
    child: MouseRegion(
      onEnter: (event) {
        controller?.repeat();
      },
      onExit: (event) {
        controller?.stop();
      },
      child: IconButton(
        splashRadius: 50,
        iconSize: 100,
        onPressed: () {
          if (controller?.status == AnimationStatus.dismissed) {
            controller?.reset();
            controller?.animateTo(1);
          } else {
            controller?.reverse();
          }
        },
        icon: Lottie.asset(imagePath!,
            controller: controller, height: imageSize, fit: BoxFit.fitHeight),
      ),
    ),
    // Align(
    //   alignment: Alignment.center,
    //   child: Image.asset(
    //     imagePath,
    //     fit: BoxFit.contain,
    //     width: size * 0.5,
    //     height: size * 0.5,
    //   ),
    // ),
  );
}

Future<bool> openUrl(String url, {bool newWindow = false}) async {
  try {
    if (await canLaunchUrl(Uri.parse(url))) {
      return await launchUrl(
        Uri.parse(url),
      );
    } else {
      debugPrint("Could not launch $url");
      return false;
    }
  } catch (e) {
    debugPrint("Could not launch $url");
    return false;
  }
}
