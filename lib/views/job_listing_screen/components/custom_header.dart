import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHeader extends StatelessWidget {
  final bool isMobile;

  const CustomHeader({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff5ca5a4),
      height: isMobile ? 200.0 : 300.0,
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
