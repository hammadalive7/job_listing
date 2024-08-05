import 'package:flutter/material.dart';
import 'package:flutter_listing/data/listing_data.dart';
import 'package:flutter_listing/model/listing_model.dart';

class JobProvider with ChangeNotifier {
  final List<Jobs> _jobs =
      data.map((jobData) => Jobs.fromJson(jobData)).toList();

  final List<String> _selectedFilters = [];

  List<Jobs> get jobs => _jobs;

  List<String> get selectedFilters => _selectedFilters;

  final Map<String, bool> _hovering = {};

  bool isHovering(String label) {
    return _hovering[label] ?? false;
  }

  void setHover(String label, bool hovering) {
    _hovering[label] = hovering;
    notifyListeners();
  }

  void addFilter(String filter) {
    if (!_selectedFilters.contains(filter)) {
      _selectedFilters.add(filter);
      notifyListeners();
    }
  }

  void removeFilter(String filter) {
    _selectedFilters.remove(filter);
    notifyListeners();
  }

  void clearFilters() {
    _selectedFilters.clear();
    notifyListeners();
  }

  List<Jobs> get filteredJobs {
    if (_selectedFilters.isEmpty) {
      return _jobs;
    } else {
      return _jobs.where((job) {
        final allTags = [...job.languages, ...job.tools];
        return _selectedFilters.every((filter) => allTags.contains(filter));
      }).toList();
    }
  }
}
