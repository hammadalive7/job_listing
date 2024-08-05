import 'package:flutter/material.dart';
import 'package:flutter_listing/constants/colors.dart';
import 'package:flutter_listing/model/listing_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'job_card_text.dart';
import 'job_card_chips.dart';

class JobCard extends StatelessWidget {
  final Jobs job;
  final Function(String) onAddFilter;

  const JobCard({
    super.key,
    required this.job,
    required this.onAddFilter,
  });

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.sizeOf(context).width > 700;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 8),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border(
                left: BorderSide(
                  style: BorderStyle.solid,
                  color: job.isFeatured ? primaryColor : Colors.white,
                  width: 3.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: isWideScreen
                  ? buildDesktopLayout(context)
                  : buildMobileLayout(context),
            ),
          ),
        ),
        if (!isWideScreen)
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 40),
              child: SizedBox(
                width: 60.0,
                child: SvgPicture.asset(job.logo),
              ),
            ),
          ),
      ],
    );
  }

  Row buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 60.0, child: SvgPicture.asset(job.logo)),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.03),
            JobCardText(job: job),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: JobCardChips(job: job, onAddFilter: onAddFilter),
          ),
        ),
      ],
    );
  }

  Column buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JobCardText(job: job),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
        Divider(color: Colors.grey[300], thickness: 1.0),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
        JobCardChips(job: job, onAddFilter: onAddFilter),
      ],
    );
  }
}
