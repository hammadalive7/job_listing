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
              padding: const EdgeInsets.only(right: 12.0, top: 8.0),
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
                padding: const EdgeInsets.only(top: 8.0, right: 10.0),
                child: Center(
                  // Add Center widget
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 6, 8, 4),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      newJob,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            if (job.isFeatured)
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 10.0),
                child: Center(
                  // Add Center widget
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 6, 8, 4),

                    decoration: BoxDecoration(
                      color: featuredColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      featuredJob,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
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
        Row(
          children: [
            Text(
              job.postedAt,
              style: const TextStyle(
                color: jobDetailColor,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8.0), // Spacing before the dot

            const Text(
              '•',
              style: TextStyle(
                color: Color(0xFFB9BFBF),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8.0), // Spacing after the dot
            Text(
              job.contract,
              style: const TextStyle(
                color: jobDetailColor,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8.0), // Spacing before the dot
            const Text(
              '•',
              style: TextStyle(
                color: Color(0xFFB9BFBF),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8.0), // Spacing after the dot
            Text(
              job.location,
              style: const TextStyle(
                color: jobDetailColor,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
