import 'package:flutter/material.dart';
import 'package:portfolio_sabin/helpers/helpers.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BlockWrapper extends StatelessWidget {
  final Widget widget;

  const BlockWrapper(this.widget, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ResponsiveConstraints(
          conditionalConstraints: blockWidthConstraints, child: widget),
    );
  }
}
