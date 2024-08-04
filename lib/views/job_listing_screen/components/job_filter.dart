import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterSection extends StatelessWidget {
  final List<String> selectedFilters;
  final Function(String) onRemoveFilter;

  const FilterSection({
    super.key,
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
              backgroundColor: const Color(0xfff0fafa),
              side: const BorderSide(color: Color(0xfff0fafa)),
              labelStyle: const TextStyle(color: Color(0xff5ca5a4)),
              deleteIcon: SvgPicture.asset(
                'assets/images/icon-remove.svg',
                color: const Color(0xff5ca5a4),
              ),
              deleteIconBoxConstraints:
                  const BoxConstraints.tightFor(width: 20.0, height: 20.0),
              label: Text(filter),
              onDeleted: () => onRemoveFilter(filter),
              onSelected: (bool value) {
                if (value) {
                  onRemoveFilter(filter);
                }
              },
            )),
      ],
    );
  }
}
