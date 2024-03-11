import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_sabin/constants/colors.dart';
import 'package:portfolio_sabin/helpers/block_wrapper.dart';
import 'package:portfolio_sabin/helpers/helpers.dart';
import 'package:portfolio_sabin/modules/about.dart';
import 'package:portfolio_sabin/modules/contact.dart';
import 'package:portfolio_sabin/modules/footer.dart';
import 'package:portfolio_sabin/modules/header.dart';
import 'package:portfolio_sabin/modules/projects.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends ConsumerState<Home> {
  bool isDarkMode = true;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isDarkMode = Theme.of(context).brightness == Brightness.dark;
      });
    });

    super.initState();
  }

  void _scrollUp() {
    _controller.animateTo(
      _controller.position.minScrollExtent,
      duration: const Duration(milliseconds: 1500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _toggleTheme(String theme) {
    setState(() {
      isDarkMode = !isDarkMode;
      ref.read(appThemeProvider.notifier).state =
          theme == "light" ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 66),
          child: Container(
            height: 66,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                      color: ref.watch(appThemeProvider)
                          ? const Color(0x1AFFFFFF)
                          : const Color(0x1A000000),
                      offset: const Offset(0, 2),
                      blurRadius: 4)
                ]),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 16, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.oswald(
                            textStyle:
                                Theme.of(context).textTheme.headlineLarge!,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: primary),
                        children: [
                          TextSpan(
                            text: "</>  ",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _scrollUp();
                              },
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _scrollUp();
                              },
                            text: "Sabin Sajeevan",
                            style: GoogleFonts.oswald(
                              textStyle:
                                  Theme.of(context).textTheme.headlineLarge,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    IconButton.filled(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                        (states) =>
                            isDarkMode ? Colors.white70 : Colors.black45,
                      )),
                      onPressed: () {
                        isDarkMode
                            ? _toggleTheme("light")
                            : _toggleTheme("dark");
                      },
                      icon:
                          Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                    )

                    // Switch(
                    //   value: isDarkMode,
                    //   onChanged: (isOn) {
                    //     isOn ? _toggleTheme("light") : _toggleTheme("dark");
                    //   },
                    // ),
                  ],
                )),
          ),
        ),
        body: ListView(
          controller: _controller,
          shrinkWrap: true,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            const BlockWrapper(
              HeaderSection(),
            ),
            const BlockWrapper(
              AboutSection(),
            ),
            const BlockWrapper(
              ProjectsSection(),
            ),
            const BlockWrapper(
              ContactSection(),
            ),
            const FooterSection(),
          ],
        ));
  }
}
