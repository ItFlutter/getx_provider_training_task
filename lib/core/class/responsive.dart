import 'package:flutter/material.dart';

// const double mobileToWebBreakPoint = 875;
const double mobileToTabletBreakPoint = 768;
const double tabletToWebBreakPoint = 1024;

class RsponsiveWidget extends StatelessWidget {
  final Widget web;
  final Widget? tablet;
  final Widget mobile;
  const RsponsiveWidget(
      {super.key, required this.web, this.tablet, required this.mobile});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isWeb(context)) {
      return web;
    } else if (Responsive.isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }
}

class Responsive {
  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletToWebBreakPoint;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileToTabletBreakPoint &&
      MediaQuery.of(context).size.width < tabletToWebBreakPoint;
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileToTabletBreakPoint;
}
