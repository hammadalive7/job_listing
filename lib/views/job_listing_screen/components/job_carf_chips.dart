
import 'package:flutter/material.dart';
import 'package:flutter_listing/model/listing_model.dart';

class JobCardChips extends StatelessWidget {

  final Jobs job;
  final Function(String) onAddFilter;

  const JobCardChips({
    super.key,
    required this.job,
    required this.onAddFilter,
  });

  @override
  Widget build(BuildContext context) {
    return                   Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        ...job.languages
            .map((lang) => ActionChip(
          backgroundColor: const Color(0xfff0fafa),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side:
          const BorderSide(color: Color(0xfff0fafa)),
          label: Text(lang,
              style: const TextStyle(
                  color: Color(0xff5ca5a4))),
          onPressed: () => onAddFilter(lang),
        ))
            .toList(),
        ...job.tools
            .map((tool) => ActionChip(
          backgroundColor: const Color(0xfff0fafa),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side:
          const BorderSide(color: Color(0xfff0fafa)),
          label: Text(tool,
              style: const TextStyle(
                  color: Color(0xff5ca5a4))),
          onPressed: () => onAddFilter(tool),
        ))
            .toList(),
      ],
    );

  }
}
