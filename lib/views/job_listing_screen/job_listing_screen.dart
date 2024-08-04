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
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
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
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: FilterSection(
                                    selectedFilters: selectedFilters,
                                    onRemoveFilter: removeFilter,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextButton(
                                    style: const ButtonStyle(
                                      splashFactory: NoSplash.splashFactory,
                                    ),
                                    onPressed: clearFilters,
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
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
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
