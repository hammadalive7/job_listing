import 'package:flutter/material.dart';
import 'package:flutter_listing/model/listing_model.dart';

class JobCard extends StatelessWidget {
  final Jobs job;
  final Function(String) onAddFilter;

  JobCard({
    required this.job,
    required this.onAddFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Replace with Image.asset if you're using assets
                Text(job.company, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                if (job.isNew)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Chip(
                      label: Text('NEW!'),
                      backgroundColor: Colors.teal[100],
                    ),
                  ),
                if (job.isFeatured)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Chip(
                      label: Text('FEATURED'),
                      backgroundColor: Colors.teal[300],
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(job.position, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('${job.postedAt} • ${job.contract} • ${job.location}'),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                ...job.languages.map((lang) => ActionChip(
                  label: Text(lang),
                  onPressed: () => onAddFilter(lang),
                )).toList(),
                ...job.tools.map((tool) => ActionChip(
                  label: Text(tool),
                  onPressed: () => onAddFilter(tool),
                )).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
