import 'package:flutter/material.dart';
import 'package:flutter_listing/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_listing/providers/job_provider.dart';
import 'components/custom_header.dart';
import 'components/job_card.dart';
import 'components/job_filter.dart';

class JobListingScreen extends StatelessWidget {
  const JobListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);
    final bool isMobile = MediaQuery.sizeOf(context).width < 600;
    final double horizontalPadding =
        MediaQuery.sizeOf(context).width > 1200 ? 140.0 : 20.0;

    return Scaffold(
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomHeader(isMobile: isMobile),
                if (jobProvider.selectedFilters.isNotEmpty)
                  FilterSection(
                    selectedFilters: jobProvider.selectedFilters,
                    onRemoveFilter: jobProvider.removeFilter,
                    onClearFilters: jobProvider.clearFilters,
                    isMobile: isMobile,
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: 23.0),
              child: Column(
                children: jobProvider.filteredJobs
                    .map((job) => JobCard(
                          job: job,
                          onAddFilter: jobProvider.addFilter,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
