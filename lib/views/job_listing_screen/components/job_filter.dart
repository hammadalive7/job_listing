import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  final List<String> selectedFilters;
  final Function(String) onRemoveFilter;

  FilterSection({
    required this.selectedFilters,
    required this.onRemoveFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        ...selectedFilters.map((filter) => FilterChip(
          label: Text(filter),
          onDeleted: () => onRemoveFilter(filter), onSelected: (bool value) {
          if (value) {
            onRemoveFilter(filter);
          }
        },
        )),
      ],
    );
  }
}
