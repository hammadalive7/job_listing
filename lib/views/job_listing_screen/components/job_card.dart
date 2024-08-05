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

    return Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 23),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: blurColor.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(0, 15), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                border: Border(
                  left: BorderSide(
                    style: BorderStyle.solid,
                    color: job.isFeatured ? primaryColor : Colors.white,
                    width: 5.0,
                  ),
                ),
              ),
              child: isWideScreen
                  ? Padding(
                    padding: const EdgeInsets.all(23.0),
                    child: buildDesktopLayout(context),
                  )
                  : Padding(
                    padding: const EdgeInsets.all(23.0),
                    child: buildMobileLayout(context),
                  ),
            ),
          ),
          if (!isWideScreen)
            Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 23),
                child: SizedBox(
                  width: 46.0,
                  height: 46.0,
                  child: SvgPicture.asset(job.logo),
                ),
              ),
            ),
        ],
      ),
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
        const Divider(color: Color(0xFFC0C2C1), thickness: 1.0),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
        JobCardChips(job: job, onAddFilter: onAddFilter),
      ],
    );
  }
}
