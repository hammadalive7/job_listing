import 'package:flutter/material.dart';
import 'package:flutter_listing/constants/colors.dart';
import 'package:flutter_listing/constants/strings.dart';
import 'package:flutter_listing/providers/job_provider.dart';
import 'package:provider/provider.dart';
import 'custom_filter_chip.dart';

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
    final double horizontalPadding =
        MediaQuery.of(context).size.width > 1200 ? 140.0 : 20.0;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 15.0),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: selectedFilters.map((filter) {
                      return CustomFilterChip(
                        label: filter,
                        onDeleted: () => onRemoveFilter(filter),
                        uniqueKey: filter,
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child:
                    Consumer<JobProvider>(builder: (context, provider, child) {
                  return MouseRegion(
                    onEnter: (_) => provider.setHover(filterClear, true),
                    onExit: (_) => provider.setHover(filterClear, false),
                    child: GestureDetector(
                      onTap: onClearFilters,
                      child: Text(
                        filterClear,
                        style: TextStyle(
                          color: provider.isHovering(filterClear)
                              ? primaryColor
                              : Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
