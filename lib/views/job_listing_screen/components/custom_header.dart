import 'package:flutter/material.dart';
import 'package:flutter_listing/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHeader extends StatelessWidget {
  final bool isMobile;

  const CustomHeader({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      height: 150.0,
      width: double.infinity,
      child: SvgPicture.asset(
        isMobile
            ? 'assets/images/bg-header-mobile.svg'
            : 'assets/images/bg-header-desktop.svg',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
