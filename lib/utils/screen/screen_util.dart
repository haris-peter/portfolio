// Created by: Haris Josin Peter, Created at: 05-03-2024 11:40 pm

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/utils/responsive_utils.dart';

class ResponsiveFrameworkBuilder extends StatelessWidget {
  final Widget child;
  const ResponsiveFrameworkBuilder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.builder(
      ClampingScrollWrapper(child: child),
      landscapePlatforms: [
        ResponsiveTargetPlatform.web,
      ],
      breakpoints: const [
        ResponsiveBreakpoint.resize(350, name: MOBILE),
        ResponsiveBreakpoint.autoScale(600, name: TABLET),
        ResponsiveBreakpoint.resize(800, name: DESKTOP),
        ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
      ],
    );
  }

  bool isMobile(BuildContext context) {
    return !ResponsiveWrapper.of(context).isMobile;
  }

  bool isTablet(BuildContext context) {
    return !ResponsiveWrapper.of(context).isTablet;
  }

  bool isDesktop(BuildContext context) {
    return !ResponsiveWrapper.of(context).isDesktop;
  }

  bool isXl(BuildContext context) {
    return !ResponsiveWrapper.of(context).isLargerThan('XL');
  }
}
