import 'package:flutter/material.dart';
import 'package:flutter_listing/constants/colors.dart';
import 'package:flutter_listing/constants/strings.dart';
import 'package:flutter_listing/model/listing_model.dart';
import 'package:flutter_listing/providers/job_provider.dart';
import 'package:provider/provider.dart';

class JobCardText extends StatelessWidget {
  final Jobs job;

  const JobCardText({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 8.0),
              child: Text(
                job.company,
                style: const TextStyle(
                  color: primaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (job.isNew)
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    newJob,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            if (job.isFeatured)
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    featuredJob,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8.0),
        Consumer<JobProvider>(builder: (context, provider, child) {
          String uniqueKey = '${job.id}_${job.position}';
          return MouseRegion(
            onEnter: (_) => provider.setHover(uniqueKey, true),
            onExit: (_) => provider.setHover(uniqueKey, false),
            child: Text(
              job.position,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: provider.isHovering(uniqueKey) == true
                    ? primaryColor
                    : Colors.black,
              ),
            ),
          );
        }),
        const SizedBox(height: 8.0),
        Text(
          '${job.postedAt} • ${job.contract} • ${job.location}',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
