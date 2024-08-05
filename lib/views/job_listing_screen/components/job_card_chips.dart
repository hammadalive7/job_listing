import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_listing/constants/colors.dart';
import 'package:flutter_listing/model/listing_model.dart';
import 'package:flutter_listing/providers/job_provider.dart';

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
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        ...widget.job.languages
            .map((lang) => _buildChip(lang, '${widget.job.id}_lang_$lang')),
        ...widget.job.tools
            .map((tool) => _buildChip(tool, '${widget.job.id}_tool_$tool')),
      ],
    );
  }

  Widget _buildChip(String label, String uniqueKey) {
    return Consumer<JobProvider>(
      builder: (context, provider, child) {
        return MouseRegion(
          onEnter: (_) => provider.setHover(uniqueKey, true),
          onExit: (_) => provider.setHover(uniqueKey, false),
          child: ActionChip(
            backgroundColor:
                provider.isHovering(uniqueKey) ? primaryColor : secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            side: const BorderSide(
              color: secondaryColor,
            ),
            label: Text(
              label,
              style: TextStyle(
                color: provider.isHovering(uniqueKey)
                    ? Colors.white
                    : primaryColor,
              ),
            ),
            onPressed: () => widget.onAddFilter(label),
          ),
        );
      },
    );
  }
}
