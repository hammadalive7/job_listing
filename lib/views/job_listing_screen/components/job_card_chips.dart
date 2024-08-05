import 'package:flutter/material.dart';
import 'package:flutter_listing/constants/colors.dart';
import 'package:flutter_listing/model/listing_model.dart';

class JobCardChips extends StatefulWidget {
  final Jobs job;
  final Function(String) onAddFilter;

  const JobCardChips({
    super.key,
    required this.job,
    required this.onAddFilter,
  });

  @override
  _JobCardChipsState createState() => _JobCardChipsState();
}

class _JobCardChipsState extends State<JobCardChips> {
  final Map<String, bool> _hovering = {};

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        ...widget.job.languages.map((lang) => _buildChip(lang)).toList(),
        ...widget.job.tools.map((tool) => _buildChip(tool)).toList(),
      ],
    );
  }

  Widget _buildChip(String label) {
    return MouseRegion(
      onEnter: (_) => _setHover(label, true),
      onExit: (_) => _setHover(label, false),
      child: ActionChip(
        backgroundColor: _hovering[label] == true
            ? primaryColor
            : secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: const BorderSide(
          color: secondaryColor,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: _hovering[label] == true
                ? Colors.white
                : primaryColor,
          ),
        ),
        onPressed: () => widget.onAddFilter(label),
      ),
    );
  }

  void _setHover(String label, bool isHovering) {
    setState(() {
      _hovering[label] = isHovering;
    });
  }
}
