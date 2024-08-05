import 'package:flutter/material.dart';
import 'package:flutter_listing/constants/colors.dart';
import 'package:flutter_listing/providers/job_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;
  final VoidCallback onDeleted;
  final String uniqueKey;

  const CustomFilterChip({
    super.key,
    required this.label,
    required this.onDeleted,
    required this.uniqueKey,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<JobProvider>(
      builder: (context, provider, child) {
        bool isHovering = provider.isHovering(uniqueKey);

        return Container(
          decoration: BoxDecoration(
            color: secondaryColor,
            border: Border.all(color: secondaryColor),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text Section
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(5.0),
                  ),
                ),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
              // Cross Section
              MouseRegion(
                onEnter: (_) => provider.setHover(uniqueKey, true),
                onExit: (_) => provider.setHover(uniqueKey, false),
                child: GestureDetector(
                  onTap: onDeleted,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: isHovering ? Colors.black : primaryColor,
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(5.0),
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/icon-remove.svg',
                      color: Colors.white,
                      width: 15.0,
                      height: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
