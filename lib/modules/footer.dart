import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_sabin/helpers/helpers.dart';

class FooterSection extends ConsumerStatefulWidget {
  const FooterSection({super.key});

  @override
  FooterSectionState createState() => FooterSectionState();
}

class FooterSectionState extends ConsumerState<FooterSection>
    with TickerProviderStateMixin {
  String footerDescription = "© 2024 Sabin Sajeevan. All rights reserved.";

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 66,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                color: ref.watch(appThemeProvider)
                    ? const Color(0x1AFFFFFF)
                    : const Color(0x1A000000),
                offset: const Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 2)
          ]),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 25, 16, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(text: footerDescription),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
