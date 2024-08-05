import 'package:flutter/material.dart';
import 'package:flutter_listing/constants/colors.dart';
import 'package:flutter_listing/constants/strings.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterSection extends StatelessWidget {
  final List<String> selectedFilters;
  final Function(String) onRemoveFilter;
  final VoidCallback onClearFilters;
  final bool isMobile;

  const FilterSection({
    super.key,
    required this.selectedFilters,
    required this.onRemoveFilter,
    required this.onClearFilters,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = MediaQuery.of(context).size.width > 800 ? 140.0 : 20.0;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 15.0),
        child: Container(
          width: double.infinity,
          height: 150,
          margin: EdgeInsets.only(top: isMobile ? 100 : 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: selectedFilters.map((filter) {
                      return FilterChip(
                        backgroundColor: secondaryColor,
                        side: const BorderSide(color: secondaryColor),
                        labelStyle: const TextStyle(color: primaryColor),
                        deleteIcon: SvgPicture.asset(
                          'assets/images/icon-remove.svg',
                          color: primaryColor,
                        ),
                        deleteIconBoxConstraints: const BoxConstraints.tightFor(
                          width: 20.0,
                          height: 20.0,
                        ),
                        label: Text(filter),
                        onDeleted: () => onRemoveFilter(filter),
                        onSelected: (bool value) {
                          if (value) {
                            onRemoveFilter(filter);
                          }
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  style: const ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: onClearFilters,
                  child: const Text(
                    filterClear,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
