import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_listing/data/listing_data.dart';
import 'package:flutter_listing/model/listing_model.dart';
import 'components/custom_header.dart';
import 'components/job_card.dart';
import 'components/job_filter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Jobs> jobs;
  final List<String> selectedFilters;

  _HomeScreenState()
      : jobs = data.map((jobData) => Jobs.fromJson(jobData)).toList(),
        selectedFilters = [];

  void addFilter(String filter) {
    setState(() {
      if (!selectedFilters.contains(filter)) {
        selectedFilters.add(filter);
      }
    });
  }

  void removeFilter(String filter) {
    setState(() {
      selectedFilters.remove(filter);
    });
  }

  void clearFilters() {
    setState(() {
      selectedFilters.clear();
    });
  }

  List<Jobs> get filteredJobs {
    if (selectedFilters.isEmpty) {
      return jobs;
    } else {
      return jobs.where((job) {
        final allTags = [...job.languages, ...job.tools];
        return selectedFilters.every((filter) => allTags.contains(filter));
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0fafa),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CustomHeader(isMobile: isMobile),
                    if (selectedFilters.isNotEmpty)
                      FilterSection(
                        selectedFilters: selectedFilters,
                        onRemoveFilter: removeFilter,
                        onClearFilters: clearFilters,
                        isMobile: isMobile,
                        constraints: constraints,
                      ),
                  ],
                ),
                Padding(
                  padding: constraints.maxWidth > 800
                      ? const EdgeInsets.only(
                          left: 140.0, right: 140.0, top: 15.0, bottom: 15.0)
                      : const EdgeInsets.all(20.0),
                  child: Column(
                    children: filteredJobs
                        .map(
                          (job) => JobCard(
                            job: job,
                            onAddFilter: addFilter,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
