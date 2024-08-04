import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterSection extends StatelessWidget {
  final List<String> selectedFilters;
  final Function(String) onRemoveFilter;
  final VoidCallback onClearFilters;
  final bool isMobile;
  final BoxConstraints constraints;

  const FilterSection({
    super.key,
    required this.selectedFilters,
    required this.onRemoveFilter,
    required this.onClearFilters,
    required this.isMobile,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return                       Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: constraints.maxWidth > 800 ? const EdgeInsets.only(left: 140.0, right: 140.0, top: 15.0, bottom: 15.0) :const EdgeInsets.all(20.0),
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
                color:
                const Color(0xff5ca5a4).withOpacity(0.1),
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
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Wrap(
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
                    ),
                  )
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  style: const ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: onClearFilters,
                  child: const Text(
                    'Clear',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
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
