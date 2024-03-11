import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_sabin/constants/colors.dart';
import 'package:portfolio_sabin/helpers/helpers.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection>
    with TickerProviderStateMixin {
  late AnimationController _contactController;
  late AnimationController _addressController;
  late AnimationController _emailController;
  late AnimationController _phoneController;
  late AnimationController _whatsappController;
  late AnimationController _linkedinController;
  late AnimationController _instagramController;

  final String address = "Thrissur, Kerala - India";
  final String emailName = "sabinksajeevan@gmail.com";
  final String email = "mailto:sabinksajeevan@gmail.com";
  final String phoneName = "+91 8281415894";
  final String phone = "tel://+918281415894";
  final String whatsappName = "+91 8281415894";
  final String whatsapp = "https://wa.me/+918281415894";
  final String linkedin =
      "https://www.linkedin.com/in/sabin-sajeevan-938953190";
  final String instagram =
      "https://www.instagram.com/sabin_sajeevan?igsh=MTI2bnc0dzB3dWs2cQ%3D%3D&utm_source=qr";
  final String linkedinName = "Sabin Sajeevan";
  final String instagramName = "sabin_sajeevan";

  @override
  void initState() {
    super.initState();
    _contactController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1400));
    _addressController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _emailController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _phoneController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _whatsappController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _linkedinController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _instagramController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    _contactController.forward();
    _emailController.forward(from: 0.0);
    _contactController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 5000), () {
          if (mounted) {
            _contactController.forward(from: 0.0);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _contactController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _whatsappController.dispose();
    _linkedinController.dispose();
    _instagramController.dispose();

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
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: buildMaterialIconCircle(
                    imagePath: "assets/animation/emoji_eye_blink.json",
                    size: 68,
                    imageSize: 40,
                    controller: _contactController),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Contact Me",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Feel free to reach out to me through any of the following channels:",
              style: Theme.of(context).textTheme.bodyMedium,
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
                ResponsiveRowColumnItem(
                    rowFlex: 1,
                    rowFit: FlexFit.tight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
                      child: ContactItem(
                        imagePath: "assets/animation/address.json",
                        controller: _addressController,
                        contactTitle: "Address",
                        contactValue: Text(
                          address,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    )),
                ResponsiveRowColumnItem(
                    rowFlex: 1,
                    rowFit: FlexFit.tight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
                      child: ContactItem(
                          imagePath: "assets/animation/email.json",
                          controller: _emailController,
                          imageSize: 80,
                          contactTitle: "Email",
                          contactValue: RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        openUrl(email, newWindow: true);
                                      },
                                    text: emailName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: primary)),
                              ]))),
                    )),
                ResponsiveRowColumnItem(
                    rowFlex: 1,
                    rowFit: FlexFit.tight,
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
                        child: ContactItem(
                            imagePath: "assets/animation/phone.json",
                            controller: _phoneController,
                            contactTitle: "Phone",
                            contactValue: RichText(
                                text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    children: [
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          openUrl(phone, newWindow: true);
                                        },
                                      text: phoneName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: primary)),
                                ]))))),
              ]),
          ResponsiveRowColumn(
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowCrossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  rowFit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
                    child: ContactItem(
                      imagePath: "assets/animation/whatsapp.json",
                      controller: _whatsappController,
                      contactTitle: "Whatsapp",
                      contactValue: RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyMedium,
                              children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    openUrl(whatsapp, newWindow: true);
                                  },
                                text: whatsappName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: primary)),
                          ])),
                    ),
                  )),
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  rowFit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
                    child: ContactItem(
                        imagePath: "assets/animation/linkedin.json",
                        controller: _linkedinController,
                        contactTitle: "LinkedIn",
                        contactValue: RichText(
                            text: TextSpan(
                                style: Theme.of(context).textTheme.bodyMedium,
                                children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      openUrl(linkedin, newWindow: true);
                                    },
                                  text: linkedinName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: primary)),
                            ]))),
                  )),
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  rowFit: FlexFit.tight,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
                      child: ContactItem(
                          imagePath: "assets/animation/instagram.json",
                          controller: _instagramController,
                          contactTitle: "Instagram",
                          contactValue: RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        openUrl(instagram, newWindow: true);
                                      },
                                    text: instagramName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: primary)),
                              ])))))
            ],
          ),
        ]));
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem(
      {super.key,
      required this.imagePath,
      required this.controller,
      required this.contactTitle,
      required this.contactValue,
      this.imageSize = 60});
  final String imagePath;
  final AnimationController controller;
  final String contactTitle;
  final Widget contactValue;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: buildMaterialIconCircle(
                    imagePath: imagePath,
                    size: 58,
                    controller: controller,
                    imageSize: imageSize),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        contactTitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: contactValue)
                  ],
                ),
              )
            ],
          ),
        ]);
  }
}
